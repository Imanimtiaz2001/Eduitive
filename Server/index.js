// Imports
const express = require("express");
const bodyParser = require("body-parser");
const firebase = require("firebase/app");
const auth = require("firebase/auth");
const firestore = require("firebase/firestore");
const cors = require("cors");
const admin = require("firebase-admin");
const multer = require("multer");
const nsfwjs = require("nsfwjs");

// Import required modules
const { createCanvas, loadImage } = require('canvas');
const canvas = createCanvas(640, 480);


// Initialize the app
const app = firebase.initializeApp({
  apiKey: "AIzaSyA_g0wFYIoo9sFKsb6uwgPOd60x7AjJDV0",
  authDomain: "eduitive-51bf1.firebaseapp.com",
  databaseURL: "https://eduitive-51bf1-default-rtdb.firebaseio.com",
  projectId: "eduitive-51bf1",
  storageBucket: "eduitive-51bf1.appspot.com",
  messagingSenderId: "557267969962",
  appId: "1:557267969962:web:444889ef7d942b5e5c2dd3",
  measurementId: "G-TSHK8DWDCL",
});

const Auth = auth.getAuth(app);
const db = firestore.getFirestore(app);

// Initialize Firebase Admin SDK
admin.initializeApp({
  credential: admin.credential.cert("./serviceKey.json"),
  storageBucket: "gs://eduitive-51bf1.appspot.com",
  databaseURL: "https://eduitive-51bf1-default-rtdb.firebaseio.com",
});

// Initialize Firestore
const Db = admin.firestore();

// Multer configuration for handling file uploads
const storageConfig = multer.memoryStorage();
const upload = multer({ storage: storageConfig });


//NSFW 
async function loadNSFWModel() {
  try {
    nsfwModel = await nsfwjs.load();
    console.log("NSFW model loaded successfully.");
  } catch (error) {
    console.error("Error loading NSFW model:", error);
  }
}

// Load the NSFW model before starting the server
loadNSFWModel();

// Initialize the server
const server = express();
server.use(express.json());
server.use(cors());
server.use(bodyParser.json());
server.use(bodyParser.urlencoded({ extended: true }));

//----APIs----

// Signup API
server.post("/api/signup", async (req, res) => {
  try {
    const { email, password ,name } = req.body;
    // Check if the user with the same email already exists
    const existingUser = await firestore.getDoc(
      firestore.doc(db, "users", email)
    );
    if (existingUser.exists()) {
      return res.status(400).send("User with the same email already exists");
    }
    // Create user in authentication
    const userCredential = await auth.createUserWithEmailAndPassword(
      Auth,
      email,
      password
    );
    // Store user data in Firestore
    await firestore.setDoc(firestore.doc(db, "users", email), {
      uid: userCredential.user.uid,
      email: email,
      name: name,
    });
    res.status(201).send("User created successfully");
  } catch (e) {
    console.error(e);
    res.status(500).send("Error creating user");
  }
});

// Login API
server.post("/api/login", async (req, res) => {
  try {
    const { email, password } = req.body;
    // Sign in with email and password
    const userCredential = await auth.signInWithEmailAndPassword(
      Auth,
      email,
      password
    );
    // Retrieve user data from Firestore
    const userData = await firestore.getDoc(firestore.doc(db, "users", email));
    const user = userData.data();
    res.status(200).json({
      uid: user.uid,
      email: user.email,
      name: user.name,
    });
  } catch (e) {
    console.error(e);
    res.status(401).send("Invalid credentials");
  }
});

// Password Reset API
server.post("/api/reset-password", async (req, res) => {
  try {
    const { email } = req.body;

    // Send password reset email
    await auth.sendPasswordResetEmail(Auth, email );

    res.status(200).send("Password reset email sent successfully");
  } catch (e) {
    console.error(e);
    res.status(500).send("Error sending password reset email");
  }
});

//Video Upload
server.post("/upload", upload.single("video"), async (req, res) => {
  try {
    const { title, description, grade, subject, uploaderId } = req.body;
    const filename = `${Date.now()}_${req.file.originalname}`;

    const bucket = admin.storage().bucket();
    const videoFile = bucket.file(filename);
    const videoStream = videoFile.createWriteStream({
      metadata: {
        contentType: req.file.mimetype,
      },
    });

    videoStream.end(req.file.buffer);

    // Properly handle event listeners to avoid MaxListenersExceededWarning
    await new Promise((resolve, reject) => {
      videoStream.on("finish", resolve);
      videoStream.on("error", reject);
    });

    const videoUrl = `https://storage.googleapis.com/${bucket.name}/${filename}`;

    // Correctly use collection method to access Firestore
    const videosCollection = Db.collection("videos");
    const docRef = await videosCollection.add({
      title,
      description,
      grade,
      subject,
      uploaderId,
      videoUrl,
    });

server.post("/api/upload", upload.single("video"), async (req, res) => {
  try {
    const { title, description, grade, subject, uploaderId } = req.body;
    const filename = `${Date.now()}_${req.file.originalname}`;


    res.status(200).json({
      message: "Video doesn't have safe content",
      docId: docRef.id,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal server error" });
  }
});

    res
      .status(200)
      .json({
        message: "Video and data uploaded successfully",
        docId: docRef.id,
      });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal server error" });
  }
});

//Get Videos
server.get("/videos/:grade/:subject", async (req, res) => {
  try {
    const { grade, subject } = req.params;

    // Check if grade and subject are defined
    if (!grade || !subject) {
      return res
        .status(400)
        .json({ error: "Grade and subject parameters are required." });
    }

    // Query Firestore to get videos based on grade and subject
    const videosSnapshot = await Db
      .collection("videos")
      .where("grade", "==", grade)
      .where("subject", "==", subject)
      .get();


    const videos = [];
    videosSnapshot.forEach((doc) => {
      const data = doc.data();
      videos.push({
        id: doc.id,
        title: data.title,
        description: data.description,
        grade: data.grade,
        subject: data.subject,
        uploaderId: data.uploaderId,
        videoUrl: data.videoUrl,
      });
    });

    res.status(200).json(videos);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal server error" });
  }
});



//Listening  on PORT
const PORT = process.env.PORT || 3000;
server.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});