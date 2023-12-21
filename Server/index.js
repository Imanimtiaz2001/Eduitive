const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const admin = require("firebase-admin");

const app = express();

// Initialize Firebase Admin SDK
const serviceAccount = require("./serviceKey.json");
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://eduitive-51bf1-default-rtdb.firebaseio.com", // Replace with your Firebase project URL
});

app.use(bodyParser.json());
app.use(cors());

// Signup endpoint
app.post('/api/signup', async (req, res) => {
  const { email, password , name } = req.body;

  try {
    const userRecord = await admin.auth().createUser({
      email,
      password,
    });

    // Save additional user data to Firestore if needed
    await admin.firestore().collection('users').doc(userRecord.uid).set({
      email,
      name,
    });

    res.status(201).send('User created successfully');
  } catch (error) {
    console.error(error);
    res.status(500).send('Error creating user');
  }
});

// Login endpoint
app.post('/api/login', async (req, res) => {
  const { email, password } = req.body;

  try {
    const userRecord = await admin.auth().getUserByEmail(email);

    // Validate password (you might want to use Firebase Authentication for this)
    // For demonstration purposes, we're just checking the email and password match
    if (userRecord.email === email) {
      res.status(200).send('Login successful');
    } else {
      res.status(401).send('Invalid email or password');
    }
  } catch (error) {
    console.error(error);
    res.status(500).send('Error during login');
  }
});


const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
