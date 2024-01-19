// ignore_for_file: invalid_use_of_protected_member
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:image_picker/image_picker.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StateProviderClass()),
        ChangeNotifierProvider(create: (context) => LoginStateProvider()),
        ChangeNotifierProvider(create: (context) => CreateAccountStateProvider()),
        ChangeNotifierProvider(create: (context) => ForgotPasswordProvider()),
        ChangeNotifierProvider(create: (context) => ChangePasswordProvider()),
        ChangeNotifierProvider(create: (context) => VerificationCodeProvider()),
        ChangeNotifierProvider(create: (context) => HomeStateProvider()),
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
        ChangeNotifierProvider(create: (context) => ProfileeditedProvider()),
        ChangeNotifierProvider(create: (context) => EditProfileProvider()),
        ChangeNotifierProvider(create: (context) => VideoUploadProvider()),
        ChangeNotifierProvider(create: (context) => VideoUploadedProvider()),
        ChangeNotifierProvider(create: (context) => VideoSearchProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class StateProviderClass extends ChangeNotifier {
  bool _isActive = false;

  bool get isActive => _isActive;

  void updateState(bool value) {
    _isActive = value;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFFE4F1F8),
      ),
      home: SplashScreen(),
      routes: {
        '/splash2': (context) => SplashScreen2(),
        '/splash3': (context) => SplashScreen3(),
        '/splash4': (context) => SplashScreen4(),
        '/login': (context) => LoginPage(),
        '/createAccount': (context) => CreateAccountPage(),
        '/AccountCreated': (context) => AccountCreatedPage(),
        '/termsAndConditions': (context) => TermsAndConditionsPage(),
        '/privacyPolicy': (context) => PrivacyPolicyPage(),
        '/home': (context) => HomePage(),
        '/forgotPassword': (context) => ForgotPasswordPage(),
        '/verificationCode': (context) => VerificationCodePage(),
        '/changePassword': (context) => ChangePasswordPage(),
        '/passwordChanged': (context) => PasswordChangedPage(),
        '/gradeSection': (context) => GradeSectionPage(),
        '/subjectSection': (context) => SubjectSectionPage(),
        '/learningSection': (context) => LearningSectionPage(),
        '/settings': (context) => SettingsPage(),
        '/videoUpload': (context) => VideoUploadPage(),
        '/videoSearch': (context) => VideoSearchPage(),
        '/videoUploaded': (context) => VideoUploadedPage(),
        '/favorites': (context) => FavoritesPage(),
        '/profileEdited': (context) => ProfileeditedPage(),
        '/editProfile': (context) => EditProfilePage(),
        '/uploaderProfile': (context) => UploaderPage(),
        '/homeVideo': (context) => VideoWatchHomePage(),
        '/videoWatch': (context) => VideoWatchPage(),
        '/videoPolicy': (context) => VideoPolicy(),
        '/aboutUs': (context) => AboutUs(),

      },
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Color(0xFF3787FF) : Color(0xFF767372),
      ),
    );
  }
}


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<StateProviderClass>(
        builder: (context, stateProvider, child) {
          bool isActive = stateProvider.isActive;

          return Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logo.PNG'),
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Welcome to Eduitive!',
                      style: TextStyle(
                        color: Color(0xFF060302),
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 2,
                      width: 60,
                      color: Color(0xFF3787FF),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Where Education meets innovation.',
                        style: TextStyle(
                          color: Color(0xFF767372),
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 26),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyApp()._buildDot(isActive),
                        MyApp()._buildDot(false),
                        MyApp()._buildDot(false),
                        MyApp()._buildDot(false),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        stateProvider.updateState(true);
                        Navigator.pushReplacementNamed(context, '/splash2');
                      },
                      child: Text('Next'),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 30,
                right: 16,
                child: IconButton(
                  icon: Icon(Icons.skip_next, size: 50, color: Colors.blue),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SplashScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<StateProviderClass>(
        builder: (context, stateProvider, child) {
          bool isActive = stateProvider.isActive;

          return Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/splash2.PNG'),
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Community Learning',
                      style: TextStyle(
                        color: Color(0xFF060302),
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 2,
                      width: 60,
                      color: Color(0xFF3787FF),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Engage with a Community of Learners and Experts!',
                        style: TextStyle(
                          color: Color(0xFF767372),
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 26),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyApp()._buildDot(false),
                        MyApp()._buildDot(isActive),
                        MyApp()._buildDot(false),
                        MyApp()._buildDot(false),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/splash3');
                      },
                      child: Text('Next'),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 30,
                right: 16,
                child: IconButton(
                  icon: Icon(Icons.skip_next, size: 50, color: Colors.blue),
                  onPressed: () {

                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SplashScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<StateProviderClass>(
        builder: (context, stateProvider, child) {
          bool isActive = stateProvider.isActive;

          return Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/splash3.PNG'),
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Test Yourself',
                      style: TextStyle(
                        color: Color(0xFF060302),
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 2,
                      width: 60,
                      color: Color(0xFF3787FF),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Strive for Excellence by Assessing your Abilities with Quizzes and Monitor your Progress effectively.',
                        style: TextStyle(
                          color: Color(0xFF767372),
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 26),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyApp()._buildDot(false),
                        MyApp()._buildDot(false),
                        MyApp()._buildDot(isActive),
                        MyApp()._buildDot(false),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/splash4');
                      },
                      child: Text('Next'),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 30,
                right: 16,
                child: IconButton(
                  icon: Icon(Icons.skip_next, size: 50, color: Colors.blue),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SplashScreen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<StateProviderClass>(
        builder: (context, stateProvider, child) {
          bool isActive = stateProvider.isActive;

          return Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/chatbot.PNG'),
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Personalized Mentor',
                      style: TextStyle(
                        color: Color(0xFF060302),
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 2,
                      width: 60,
                      color: Color(0xFF3787FF),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Unlock Solutions to Complex Questions with our Friendly Chatbot Samora to facilitate your Learning.',
                        style: TextStyle(
                          color: Color(0xFF767372),
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 26),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyApp()._buildDot(false),
                        MyApp()._buildDot(false),
                        MyApp()._buildDot(false),
                        MyApp()._buildDot(isActive),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text('Next'),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 30,
                right: 16,
                child: IconButton(
                  icon: Icon(Icons.skip_next, size: 50, color: Colors.blue),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class LoginStateProvider extends ChangeNotifier {

  bool _isObscure = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _validateEmail = false;
  bool _validatePassword = false;

  bool get isObscure => _isObscure;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  bool get validateEmail => _validateEmail;
  bool get validatePassword => _validatePassword;

  void togglePasswordVisibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  void resetValidation() {
    _validateEmail = false;
    _validatePassword = false;
    notifyListeners();
  }


  void validateFields(BuildContext context) {
    _validateEmail = _emailController.text.isEmpty || !_isValidEmail(_emailController.text);
    // Validate password only if it's not empty and has more than 8 characters
    _validatePassword = _passwordController.text.isNotEmpty;
    if (!_validateEmail && !_validatePassword) {
      // Login logic here
      // If successful, navigate to the next screen
      Navigator.pushReplacementNamed(context, '/home');
    }

    notifyListeners();
  }

  bool _isValidEmail(String email) {
    return email.contains('@');
  }
}
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login',
            style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold)),
        centerTitle: true,),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon in the middle
              Icon(Icons.login, size: 64, color: Color(0xFF060302)),

              // Heading "Welcome Back!"
              SizedBox(height: 16),
              Text(
                'Welcome Back!',
                style: TextStyle(
                  color: Color(0xFF060302),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Email Field
              SizedBox(height: 34),
              Consumer<LoginStateProvider>(
                builder: (context, stateProvider, child) {
                  bool _validateEmail = stateProvider.validateEmail;
                  TextEditingController _emailController = stateProvider.emailController;

                  return _buildInputField(
                    Icons.email,
                    'Email ID (Required)',
                    _emailController,
                    _validateEmail,
                    'Please enter a valid email.',
                    stateProvider,
                  );
                },
              ),

              // Password Field
              SizedBox(height: 13),
              Consumer<LoginStateProvider>(
                builder: (context, stateProvider, child) {
                  bool _isObscure = stateProvider.isObscure;
                  bool _validatePassword = stateProvider.validatePassword;
                  TextEditingController _passwordController = stateProvider.passwordController;

                  return _buildPasswordField(_isObscure, _passwordController, _validatePassword, stateProvider);
                },
              ),

              // Forgot Password Link
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/forgotPassword');
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xFF3787FF),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),


              // Login Button
              SizedBox(height: 16),
              ElevatedButton(
                onPressed:  () {
                  Navigator.pushReplacementNamed(context, '/home');
                  Provider.of<LoginStateProvider>(context, listen: false).validateFields(context);
                  //  await _login(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3787FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              // OR Text
              SizedBox(height: 16),
              Text(
                'OR',
                style: TextStyle(color: Color(0xFF060302)),
              ),

              // Login with Google Button
              SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: () {
                  _showGoogleLoginDialog(context);
                },
                icon: Image.asset(
                  'assets/googlelogo.PNG', // Replace with your actual asset path
                  width: 24,
                  height: 24,
                ),
                label: Text(
                  'Login with Google',
                  style: TextStyle(color: Color(0xFF060302)),
                ),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  side: BorderSide(color: Color(0xFF060302)),
                ),
              ),

              // Sign Up Link
              SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Color(0xFF767372)),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: Color(0xFF3787FF),
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacementNamed(context, '/createAccount');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  /**
      Future<void> _login(BuildContext context) async {
      final loginState = Provider.of<LoginStateProvider>(context, listen: false);
      final email = loginState.emailController.text;
      final password = loginState.passwordController.text;
      final apiUrl = 'http://10.7.112.224:3000/api/login';
      try {
      final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
      );
      print(response);
      if (response.statusCode == 200) {
      print("Login SucessFull");
      Navigator.pushReplacementNamed(context, '/home');
      } else {
      print('Login failed: ${response.statusCode}');
      }
      } catch (error) {
      print('Error during login: $error');
      }
      }
   **/
// Function to show Google login dialog
  void _showGoogleLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: EdgeInsets.all(30),
            height: 350,  // Increase the height
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Main heading
                Text(
                  'Choose an account',
                  style: TextStyle(
                    color: Color(0xFF060302),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Subheading
                SizedBox(height: 8),
                Text(
                  'To continue to Eduitive',
                  style: TextStyle(
                    color: Color(0xFF767372),
                    fontSize: 12,
                  ),
                ),

                // Profile pic and text
                SizedBox(height: 30),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      // You can replace the placeholder with actual user profile picture
                      backgroundImage: AssetImage('assets/Photo.PNG'),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account Name',
                          style: TextStyle(color: Color(0xFF060302), fontSize: 15,),

                        ),
                        Text(
                          'email@gmail.com',
                          style: TextStyle(color: Color(0xFF767372), fontSize: 10,),
                        ),
                      ],
                    ),
                  ],
                ),

                // Horizontal line
                SizedBox(height: 20),
                Divider(
                  color: Color(0xFF767372),
                  height: 1,
                ),

                // Icon and text
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: Color(0xFF060302),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Use another account',
                      style: TextStyle(color: Color(0xFF060302)),
                    ),
                  ],
                ),

                // Horizontal line
                SizedBox(height: 20),
                Divider(
                  color: Color(0xFF767372),
                  height: 1,
                ),

                // Information text
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16), // Adjust the horizontal padding as needed
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'To continue, Google will share your name, email address, and profile picture with Eduitive.',
                      style: TextStyle(color: Color(0xFF767372), fontSize: 12,),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
Widget _buildInputField(
    IconData icon,
    String label,
    TextEditingController controller,
    bool validate,
    String errorMessage,
    LoginStateProvider stateProvider,
    ) {
  return Column(
    children: [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: validate ? Color(0xFFF04438) : Color(0xFF060302)),
          borderRadius: BorderRadius.circular(28),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12),
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Icon(icon, color: Color(0xFF060302)),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: (_) {
                  stateProvider.resetValidation();
                },
                decoration: InputDecoration(
                  hintText: label,
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Color(0xFF060302)),
              ),
            ),
          ],
        ),
      ),
      if (validate)
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
          child: Row(
            children: [
              Icon(
                Icons.error,
                color: Color(0xFFF04438),
              ),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  errorMessage,
                  style: TextStyle(color: Color(0xFFF04438)),
                ),
              ),
            ],
          ),
        ),
    ],
  );
}

Widget _buildPasswordField(
    bool isObscure,
    TextEditingController controller,
    bool validate,
    LoginStateProvider stateProvider,
    ) {
  return Column(
    children: [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: validate ? Color(0xFFF04438) : Color(0xFF060302)),
          borderRadius: BorderRadius.circular(28),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12),
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Icon(Icons.lock, color: Color(0xFF060302)),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                obscureText: isObscure,
                onChanged: (_) {
                  stateProvider.resetValidation();
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Color(0xFF060302)),
              ),
            ),
            IconButton(
              icon: Icon(
                isObscure ? Icons.visibility : Icons.visibility_off,
                color: Color(0xFF060302),
              ),
              onPressed: () {
                stateProvider.togglePasswordVisibility();
              },
            ),
          ],
        ),
      ),
      if (validate)
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
          child: Row(
            children: [
              Icon(
                Icons.error,
                color: Color(0xFFF04438),
              ),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  'Please enter the correct password.',
                  style: TextStyle(color: Color(0xFFF04438)),
                ),
              ),
            ],
          ),
        ),
    ],
  );
}


class CreateAccountStateProvider extends ChangeNotifier {
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;
  bool _isCheckboxChecked = false;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  String _errorMessageUsername = '';
  String get errorMessageUsername => _errorMessageUsername;

  bool _validateUsername = false;
  bool _validateEmail = false;
  bool _validatePassword = false;
  bool _validateConfirmPassword = false;
  bool _validateCheckbox = false;

  bool get isObscurePassword => _isObscurePassword;
  bool get isObscureConfirmPassword => _isObscureConfirmPassword;
  bool get isCheckboxChecked => _isCheckboxChecked;

  TextEditingController get usernameController => _usernameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController => _confirmPasswordController;

  bool get validateUsername => _validateUsername;
  bool get validateEmail => _validateEmail;
  bool get validatePassword => _validatePassword;
  bool get validateConfirmPassword => _validateConfirmPassword;
  bool get validateCheckbox => _validateCheckbox;

  void updateObscurePassword() {
    _isObscurePassword = !_isObscurePassword;
    notifyListeners();
  }

  void updateObscureConfirmPassword() {
    _isObscureConfirmPassword = !_isObscureConfirmPassword;
    notifyListeners();
  }

  void updateCheckbox(bool value) {
    _isCheckboxChecked = value;
    _validateCheckbox = false;
    notifyListeners();
  }

  void validateFields(BuildContext context) {
    _validateUsername = _usernameController.text.isEmpty;
    _validateEmail = !_isValidEmail(_emailController.text);
    _validatePassword = _passwordController.text.length < 8;
    _validateConfirmPassword = _confirmPasswordController.text != _passwordController.text;
    _validateCheckbox = !_isCheckboxChecked;

    if (!_validateUsername &&
        !_validateEmail &&
        !_validatePassword &&
        !_validateConfirmPassword &&
        !_validateCheckbox) {
      // Navigate to the next screen or perform the desired action
      // For example:
      Navigator.pushReplacementNamed(context, '/AccountCreated');
    }
    notifyListeners();
  }

  bool _isValidEmail(String email) {
    return email.contains('@');
  }
}
/**
    Future<void> _signup(BuildContext context) async {
    // Get email, password, and name from your state provider
    final stateProvider = Provider.of<CreateAccountStateProvider>(context, listen: false);
    final email = stateProvider.emailController.text;
    final password = stateProvider.passwordController.text;
    final name = stateProvider.usernameController.text;

    // Your API endpoint
    final apiUrl = 'http://10.7.112.224:3000/api/signup';

    try {
    final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'email': email, 'password': password, 'name': name}),
    );

    if (response.statusCode == 201) {
    // Successful signup, handle the response accordingly
    print('Account created successfully');
    } else {
    // Handle other status codes or errors
    print('Account creation failed: ${response.statusCode}');
    }
    } catch (error) {
    // Handle network or other errors
    print('Error during account creation: $error');
    }
    }

 **/


class CreateAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold)),
        centerTitle: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Consumer<CreateAccountStateProvider>(
            builder: (context, stateProvider, child) {
              return Column(
                children: [
                  Icon(Icons.account_circle, size: 100, color: Colors.blue),
                  SizedBox(height: 7),
                  Text(
                    'Create an Account',
                    style: TextStyle(
                      color: Color(0xFF060302),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tell details to create an account.',
                    style: TextStyle(color: Color(0xFF767372)),
                  ),
                  SizedBox(height: 16),

                  _buildInputField(
                    Icons.person,
                    'Username',
                    stateProvider.usernameController,
                    stateProvider.validateUsername,
                    'Please enter a valid username.',
                  ),

                  _buildInputField(
                    Icons.email,
                    'Email Id',
                    stateProvider.emailController,
                    stateProvider.validateEmail,
                    'Please enter a valid email.',
                  ),

                  _buildPasswordField(
                    stateProvider.passwordController,
                    stateProvider.validatePassword,
                    'Your password must contain 8 characters.',
                    stateProvider.isObscurePassword,
                    stateProvider.updateObscurePassword,
                  ),

                  _buildPasswordField(
                    stateProvider.confirmPasswordController,
                    stateProvider.validateConfirmPassword,
                    'Must match both passwords.',
                    stateProvider.isObscureConfirmPassword,
                    stateProvider.updateObscureConfirmPassword,
                  ),

                  Row(
                    children: [
                      Checkbox(
                        value: stateProvider.isCheckboxChecked,
                        onChanged: (value) {
                          stateProvider.updateCheckbox(value!);
                        },
                        checkColor: Colors.black,
                      ),
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            text: 'By creating an account, you accept Eduitive’s ',
                            style: TextStyle(color: Color(0xFF060302)),
                            children: [
                              TextSpan(
                                text: 'Terms of Services',
                                style: TextStyle(color: Color(0xFF3787FF)),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, '/termsAndConditions');
                                  },
                              ),
                              TextSpan(
                                text: ' and ',
                                style: TextStyle(color: Color(0xFF060302)),
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(color: Color(0xFF3787FF)),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, '/privacyPolicy');
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (stateProvider.validateCheckbox)
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.error,
                            color: Color(0xFFF04438),
                          ),
                          SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              'Please accept the Terms of Services and Privacy Policy.',
                              style: TextStyle(color: Color(0xFFF04438)),
                            ),
                          ),
                        ],
                      ),
                    ),

                  SizedBox(height: 16),

                  ElevatedButton(
                    onPressed: () {
                      stateProvider.validateFields(context);
                      //   await _signup(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3787FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Create Account',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(color: Color(0xFF767372)),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: Color(0xFF3787FF),
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
      IconData icon,
      String label,
      TextEditingController controller,
      bool validate,
      String errorMessage,
      ) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: validate ? Color(0xFFF04438) : Color(0xFF060302)),
            borderRadius: BorderRadius.circular(28),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12),
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Icon(icon, color: Color(0xFF060302)),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: (_) {
                    // Reset validation on change
                    validate = false;
                  },
                  decoration: InputDecoration(
                    hintText: label,
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Color(0xFF060302)),
                ),
              ),
            ],
          ),
        ),
        if (validate)
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
            child: Row(
              children: [
                Icon(
                  Icons.error,
                  color: Color(0xFFF04438),
                ),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    errorMessage,
                    style: TextStyle(color: Color(0xFFF04438)),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildPasswordField(
      TextEditingController controller,
      bool validate,
      String errorMessage,
      bool isObscure,
      VoidCallback toggleObscure,
      ) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: validate ? Color(0xFFF04438) : Color(0xFF060302)),
            borderRadius: BorderRadius.circular(28),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12),
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Icon(Icons.lock, color: Color(0xFF060302)),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: (_) {
                    // Reset validation on change
                    validate = false;
                  },
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Color(0xFF060302)),
                ),
              ),
              IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                  color: Color(0xFF060302),
                ),
                onPressed: toggleObscure,
              ),
            ],
          ),
        ),
        if (validate)
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
            child: Row(
              children: [
                Icon(
                  Icons.error,
                  color: Color(0xFFF04438),
                ),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    errorMessage,
                    style: TextStyle(color: Color(0xFFF04438)),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
class AccountCreatedStateProvider extends ChangeNotifier {
  // You can add any state or methods relevant to this page

  void someMethod() {
    // Some logic here
  }
}
class AccountCreatedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AccountCreatedStateProvider(),
      child: _AccountCreatedPageContent(),
    );
  }
}

class _AccountCreatedPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AccountCreatedStateProvider>(context, listen: false);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 164, color: Colors.green),
            SizedBox(height: 2),
            Text(
              'Account Created Successfully!',
              style: TextStyle(color: Color(0xFF060302), fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Congratulations, you have completed your registration!',
                style: TextStyle(color: Color(0xFF767372)),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // You can call any methods from the provider here
                provider.someMethod();
                Navigator.pushReplacementNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3787FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the grade section page
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        title: Text('Terms & Condition',
            style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading "Condition & Attending"
            Text(
              'Condition & Attending',
              style: TextStyle(
                color: Color(0xFF202244),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Justified text below the heading
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'By accessing our app, you agree to use it solely for educational purposes. '
                    'You are not permitted to alter, distribute, or claim it as your own. '
                    'We reserve the right to revoke access to anyone not adhering to these conditions.',
                style: TextStyle(
                  color: Color(0xFF545454),
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
            ),

            // Heading "Terms & Use"
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Terms & Use',
                style: TextStyle(
                  color: Color(0xFF202244),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Justified text below the heading
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'The app is for educational use only and may not be reproduced, shared, or used for commercial purposes. '
                    'Unauthorized usage may result in legal action. '
                    'We are committed to protecting our intellectual property and maintaining its educational integrity.',
                style: TextStyle(
                  color: Color(0xFF545454),
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          // Navigate to the grade section page
          Navigator.pushReplacementNamed(context, '/home');
        },
      ),
        title: Text('Privacy Policy',
            style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Justified text about privacy
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Your privacy is of utmost importance to us at "Eduitive". This policy outlines our commitment to safeguarding your personal information '
                    'and ensuring a secure and transparent online learning experience.',
                style: TextStyle(
                  color: Color(0xFF545454),
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
            ),

            // Heading "Condition & Attending"
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Information Collection',
                style: TextStyle(
                  color: Color(0xFF202244),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Justified text below the heading
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'When you use our app, we may collect personal information, such as your name, email address, and educational preferences. '
                    'This information helps us personalize your learning journey and enhance our services.  '
                    'We also gather data on user engagement and app usage to improve your experience and offer relevant content. ',
                style: TextStyle(
                  color: Color(0xFF545454),
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
            ),

            // Heading "Terms & Use"
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Use of Information',
                style: TextStyle(
                  color: Color(0xFF202244),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Justified text below the heading
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'When you use our app, we may collect personal information, such as your name, email address, and educational preferences. '
                    'This information helps us personalize your learning journey and enhance our services.  '
                    'We also gather data on user engagement and app usage to improve your experience and offer relevant content. ',
                style: TextStyle(
                  color: Color(0xFF545454),
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the grade section page
            Navigator.pushReplacementNamed(context, '/videoUpload');
          },
        ),
        title: Text('Video Policy',
            style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Justified text below the heading
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'The following policies are made for the well being and benefit of the community please adhere to them.',
                style: TextStyle(
                  color: Color(0xFF545454),
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Upload Rules',
                style: TextStyle(
                  color: Color(0xFF202244),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Justified text below the heading
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                '- Video duration must be between 5 to 18 minutes.'
                    '- The sound and video quality must be in the 480p to 1080p range.'
                    '- The file format should be MP4.',
                style: TextStyle(
                  color: Color(0xFF545454),
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Content Rules',
                style: TextStyle(
                  color: Color(0xFF202244),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Justified text below the heading
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                '- The content should be relevant to the topic'
                    '- The content should not be plagiarized'
                    '- There should not be any type of explicit or immoral content',
                style: TextStyle(
                  color: Color(0xFF545454),
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the grade section page
            Navigator.pushReplacementNamed(context, '/settings');
          },
        ),
        title: Text('About Us',
            style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading "Condition & Attending"
            Text(
              'About Us',
              style: TextStyle(
                color: Color(0xFF202244),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Justified text below the heading
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'We are the driving force behind "Edu-Connect," your trusted educational companion. '
                    'Committed to democratizing learning, we bring students, educators, and innovators together. '
                    'Our passion lies in crafting a unique space where knowledge knows no boundaries.'
                'With a blend of AI-powered solutions and crowd-sourced wisdom, we empower every learner.'
                'We are dedicated to breaking down educational barriers, providing contextually accurate support, and fostering a vibrant community.'
              ' At "Edu-Connect," our mission is to create a global network of learners and educators, united in the pursuit of knowledge. '
                'Join us on this enlightening journey!',
                style: TextStyle(
                  color: Color(0xFF545454),
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
// Define the HomeStateProvider class for state management
class HomeStateProvider extends ChangeNotifier {
  // Add any state variables or functions needed for the Home page
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => HomeStateProvider(),
        child: _buildHomePage(context),
      ),
    );
  }

  Widget _buildHomePage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(context),
          _buildWhatWeDo(context), // Pass the context here
          _buildBanners(context),
          _buildSeparator(),
          _buildSeeAllLink(context),
          _buildTransparentBoxes(context),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
          top: 60.0, bottom: 75.0, left: 20.0, right: 20.0),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Username',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF060302),
                ),
              ),
              Text(
                'Let\'s start learning',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF060302),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/editProfile');
            },
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/Photo.PNG'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhatWeDo(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -55), // Adjust the offset as needed
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: Color(0xFFE4F1F8),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(5, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'What we do?',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF060302),
                ),
              ),
              SizedBox(width: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/homeVideo');
                  },
                  icon: Icon(
                    Icons.play_circle_filled,
                    size: 50,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildBanners(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -35), // Adjust the vertical offset
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        height: 200,
        child: PageView(
          children: [
            _buildBanner(
              color: Color(0xFFBD1CAD),
              title: 'What do you want to learn today?',
              buttonText: 'Get Started',
              image: 'assets/banner_image_1.PNG',
              onTap: () {
                Navigator.pushReplacementNamed(context, '/gradeSection');
              },
            ),
            _buildBanner(
              color: Color(0xFFCEECFE),
              title: 'Want to share any useful video?',
              buttonText: 'Share',
              image: 'assets/banner_image_2.PNG',
              onTap: () {
                Navigator.pushReplacementNamed(context, '/videoUpload');
              },
            ),
            _buildBanner(
              color: Color(0xFF8FAC94),
              title: 'Are you unable to figure out something?',
              buttonText: 'Ask us',
              image: 'assets/banner_image_3b.PNG',
              onTap: () {
                Navigator.pushReplacementNamed(context, '/chatbot');
              },
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildBanner({
    required Color color,
    required String title,
    required String buttonText,
    required String image,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: double.infinity,
      // Banner will take the entire height
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20, // Increase font size for the title
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF060302),
                  ),
                ),
                SizedBox(height: 12),
                // Increase spacing between title and button
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Set button color to blue
                    foregroundColor: Colors.white, // Set button text color to white
                  ),
                  child: Text(buttonText),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeparator() {
    return Transform.translate(
      offset: Offset(0, -20), // Adjust the vertical offset as needed
      child: Container(
        height: 35,
        color: Color(0xFFF7F8F8),
      ),
    );
  }

  Widget _buildSeeAllLink(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -2),
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(right: 30),
          child: GestureDetector(
            onTap: () {
              // Navigate to the grade section page
              Navigator.pushReplacementNamed(context, '/gradeSection');
            },
            child: Text(
              'See all',
              style: TextStyle(
                color: Color(0xFF3787FF),
                fontSize: 17,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildTransparentBoxes(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -5), // Adjust the vertical offset as needed
      child: Row(
        children: [
          SizedBox(width: 16), // Equal margin from the left
          _buildTransparentBox(
            image: 'assets/grade_image_1.PNG',
            text: 'Grade 9',
            onTap: () {
              Navigator.pushReplacementNamed(context, '/subjectSection');
            },
          ),
          SizedBox(width: 8), // Adjust the spacing between boxes
          _buildTransparentBox(
            image: 'assets/grade_image_2.PNG',
            text: 'Grade 10',
            onTap: () {
              Navigator.pushReplacementNamed(context, '/subjectSection');
            },
          ),
          SizedBox(width: 16), // Equal margin from the right
        ],
      ),
    );
  }

  Widget _buildTransparentBox({
    required String image,
    required String text,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 160,
      // Set the desired width for each box
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF3787FF),
          width: 1.3, // Set the desired border thickness
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.symmetric(horizontal: 7.5),
      // Equal margin from left and right
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 80, // Set the desired height for the image
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Image.asset(
                image,
                width: 150, // Set the desired width for the image
                height: 90, // Set the desired height for the image
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 18, // Increase font size for the text
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF060302),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Transform.translate(
        offset: Offset(0, 15), // Adjust the vertical offset as needed
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFooterItem(
                  icon: 'assets/chat_bot_icon.PNG',
                  text: 'Chat Bot',
                  isActive: false,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/chatbotpage');
                  },
                ),
                _buildFooterItem(
                  icon: 'assets/video_upload_icon.png',
                  text: 'Video Upload',
                  isActive: false,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/videoUpload');
                  },
                ),
                _buildFooterItem(
                  icon: 'assets/home_icon.png',
                  text: 'Home',
                  isActive: true,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                ),
                _buildFooterItem(
                  icon: 'assets/favorities_icon.PNG',
                  text: 'Favorites',
                  isActive: false,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/favorites');
                  },
                ),
                _buildFooterItem(
                  icon: 'assets/settings_icon.png',
                  text: 'Settings',
                  isActive: false,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/settings');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooterItem({
    required String icon,
    required String text,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            icon,
            width: 50, // Adjust the size as needed
            height: 50,
            color: isActive ? Color(0xFF3787FF) : Color(0xFF767372),
          ),
          SizedBox(height: 0.1),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? Color(0xFF3787FF) : Color(0xFF767372),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsProvider extends ChangeNotifier {
  bool studyRemindersEnabled = true;


  void toggleStudyReminders() {
    studyRemindersEnabled = !studyRemindersEnabled;
    notifyListeners();
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
            style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the grade section page
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Account'),
            _buildSettingsItem('Profile settings', 'edit', '/editProfile', context),
            _buildSeparator(),
            _buildSectionHeader('Security'),
            _buildSettingsItem('Password change', 'change', '/changePassword', context),
            _buildSeparator(),
            _buildSectionHeader('Study Reminders'),
            _buildToggleItem('Receive reminders', context),
            _buildSeparator(),
            _buildSectionHeader('Networking'),
            _buildSettingsItemWithIcon('Invite friends', Icons.arrow_forward, '/inviteFriends',context),
            _buildSeparator(),
            _buildSectionHeader('Help & Support'),
            _buildSettingsItemWithIcon('About us', Icons.arrow_forward,'/aboutUs',context),
            _buildSettingsItemWithIcon(
                'Terms & Condition', Icons.arrow_forward,'/termsAndConditions',context),
            _buildSettingsItemWithIcon('Privacy Policy', Icons.arrow_forward, '/privacyPolicy',context),
            _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildSettingsItem(String text, String buttonText, String route, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF767372),
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Handle button click based on the provided route
            Navigator.pushReplacementNamed(context, route);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(buttonText),
        ),
      ],
    );
  }


  Widget _buildSettingsItemWithIcon(String text, IconData icon, String route, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          // Handle item click
          Navigator.pushReplacementNamed(context, route);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF767372),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              icon,
              color: Color(0xFF060302),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleItem(String text, BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settingsProvider, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF767372),
                    ),
                  ),
                ],
              ),
            ),
            Switch(
              value: settingsProvider.studyRemindersEnabled,
              onChanged: (newValue) {
                // Handle switch change
                settingsProvider.toggleStudyReminders();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildSeparator() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 1,
      color: Color(0xFFCFD1D4),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        child: ElevatedButton(
          onPressed: () {
            _showLogoutDialog(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: EdgeInsets.all(16.0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.logout, size: 60, color: Colors.black),
                SizedBox(height: 16),
                Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Are you sure you want to sign out of your account?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF767372),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(width: 8), // Add spacing between buttons
                  ElevatedButton(
                    onPressed: () {
                      // Handle logout logic
                      Navigator.of(context).pop(); // Close the dialog
                      Navigator.pushReplacementNamed(
                          context, '/login'); // Navigate to login page
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

// State provider class for Forgot Password Page
class StateProviderForgotPassword extends ChangeNotifier {
  TextEditingController _emailController = TextEditingController();
  bool _validateEmail = false;
  String _errorMessage = ''; // Initialize with an empty string

  TextEditingController get emailController => _emailController;
  bool get validateEmail => _validateEmail;
  String get errorMessage => _errorMessage;

  void resetValidation() {
    _validateEmail = false;
    _errorMessage = '';
    notifyListeners();
  }

  void validateFields(BuildContext context) {
    _validateEmail = _emailController.text.isEmpty || !_isValidEmail(_emailController.text);
    notifyListeners();
  }

  void setErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  bool _isValidEmail(String email) {
    return email.contains('@');
  }
}


class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the grade section page
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
        title: Text('Forgot Password',
            style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Consumer<ForgotPasswordProvider>(
            builder: (context, stateProvider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon in the center
                  SizedBox(height: 3),
                  Icon(Icons.lock_open, size: 100, color: Color(0xFF060302)),

                  // Heading "Forgot Password"
                  SizedBox(height: 3),
                  Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: Color(0xFF060302),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Description "Enter your email linked to your account."
                  SizedBox(height: 4),
                  Text(
                    'Enter your email linked to your account.',
                    style: TextStyle(
                      color: Color(0xFF767372),
                    ),
                  ),

                  // Email Field
                  SizedBox(height: 30),
                  _buildInputField(
                    Icons.email,
                    'Email ID (Required)',
                    stateProvider.emailController,
                    stateProvider.validateEmail,
                    stateProvider.errorMessage,
                    stateProvider,
                  ),

                  // Continue Button
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _handleContinueButton(context, stateProvider);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3787FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      child: Text(
                        'Continue',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }


  // Function to handle the "Continue" button click
  void _handleContinueButton(BuildContext context, ForgotPasswordProvider stateProvider) {
    stateProvider.validateFields(context);

    if (stateProvider.validateEmail) {
      // Display error message for required or invalid email
      stateProvider.setErrorMessage('Please enter a valid email.');
    } else {
      // If email is registered, navigate to the Verification Code Page
      Navigator.pushReplacementNamed(context, '/verificationCode');
    }
  }

  // Widget to build input field
  Widget _buildInputField(
      IconData icon,
      String label,
      TextEditingController controller,
      bool validate,
      String errorMessage,
      ForgotPasswordProvider stateProvider,
      ) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: validate ? Color(0xFFF04438) : Color(0xFF060302)),
            borderRadius: BorderRadius.circular(28),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12),
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Icon(icon, color: Color(0xFF060302)),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: (_) {
                    stateProvider.resetValidation();
                  },
                  decoration: InputDecoration(
                    hintText: label,
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Color(0xFF060302)),
                ),
              ),
            ],
          ),
        ),
        if (validate)
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
            child: Row(
              children: [
                Icon(
                  Icons.error,
                  color: Color(0xFFF04438),
                ),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    errorMessage,
                    style: TextStyle(color: Color(0xFFF04438)),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

// State provider class for Forgot Password Page
class ForgotPasswordProvider extends ChangeNotifier {
  TextEditingController _emailController = TextEditingController();
  bool _validateEmail = false;
  String _errorMessage = '';

  TextEditingController get emailController => _emailController;
  bool get validateEmail => _validateEmail;
  String get errorMessage => _errorMessage;

  void resetValidation() {
    _validateEmail = false;
    _errorMessage = '';
    notifyListeners();
  }

  void validateFields(BuildContext context) {
    _validateEmail = _emailController.text.isEmpty || !_isValidEmail(_emailController.text);
    notifyListeners();
  }

  void setErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  bool _isValidEmail(String email) {
    return email.isNotEmpty && email == 'imanimtiaz2001@gmail.com';
  }
}




class PasswordChangedStateProvider extends ChangeNotifier {
  // You can add any state or methods relevant to this page

  void someMethod() {
    // Some logic here
  }
}
class PasswordChangedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PasswordChangedStateProvider(),
      child: _PasswordChangedPageContent(),
    );
  }
}

class _PasswordChangedPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PasswordChangedStateProvider>(context, listen: false);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 164, color: Colors.green),
            SizedBox(height: 2),
            Text(
              'Password Changed Successfully!',
              style: TextStyle(color: Color(0xFF060302), fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Congratulations, you have changed your password!',
                style: TextStyle(color: Color(0xFF767372)),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // You can call any methods from the provider here
                provider.someMethod();
                Navigator.pushReplacementNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3787FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class VerificationCodeProvider extends ChangeNotifier {
  final List<TextEditingController> codeControllers = List.generate(4, (index) => TextEditingController());
  final List<bool> validateCodes = List.generate(4, (index) => false);
  String errorMessage = '';
  bool isCodeSent = false;
  int resendTimer = 10;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (resendTimer > 0) {
        resendTimer--; notifyListeners(); // Notify listeners here to update UI
      } else {
        timer.cancel();
        if (isCodeSent) {
          isCodeSent = false;
          resendTimer = 10;
          notifyListeners();
        }
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void handleContinueButton(BuildContext context) {
    validateCodes.clear();
    validateCodes.addAll(codeControllers.map((controller) => controller.text.isEmpty));
    errorMessage = validateCodes.any((validate) => validate) ? 'Code is required.' : '';

    notifyListeners();

    if (!validateCodes.any((validate) => validate)) {
      Navigator.pushReplacementNamed(context, '/changePassword');
    }
  }

  void toggleCodeSent() {
    isCodeSent = !isCodeSent;
    resendTimer = 10;
    notifyListeners();
    startTimer();
  }
}

class VerificationCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VerificationCodeProvider(),
      child: _VerificationCodePage(),
    );
  }
}

class _VerificationCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          // Navigate to the grade section page
          Navigator.pushReplacementNamed(context, '/forgotPassword');
        },
      ),
        title: Text('Enter a Code',
            style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Consumer<VerificationCodeProvider>(
            builder: (context, provider, _) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 3),
                Icon(Icons.code, size: 100, color: Color(0xFF060302)),

                SizedBox(height: 3),
                Text(
                  'Enter a Code',
                  style: TextStyle(
                    color: Color(0xFF060302),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 4),
                Text(
                  'We sent a verification code on email',
                  style: TextStyle(
                    color: Color(0xFF767372),
                  ),
                ),

                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/forgotPassword');
                  },
                  child: Text(
                    'Change Email',
                    style: TextStyle(
                      color: Color(0xFF3787FF),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD0D0D0)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: TextField(
                        controller: provider.codeControllers[index],
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24),
                        decoration: InputDecoration(
                          counterText: '', // This will hide the index value
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          provider.validateCodes[index] = value.isEmpty;
                          // ignore: invalid_use_of_visible_for_testing_member
                          provider.notifyListeners();
                        },
                      ),
                    );
                  }),
                ),

                if (provider.validateCodes.any((validate) => validate))
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error,
                          color: Color(0xFFF04438),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Code is required.',
                          style: TextStyle(color: Color(0xFFF04438)),
                        ),
                      ],
                    ),
                  ),


                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    provider.handleContinueButton(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3787FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                InkWell(
                  child: provider.isCodeSent
                      ? Column(
                    children: [
                      Text(
                        'Code sent successfully',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'New Verification code can be requested in ${provider.resendTimer} seconds',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF767372),
                        ),
                      ),
                    ],
                  )
                      :InkWell(
                    onTap: () {
                      provider.toggleCodeSent();
                    },
                    child: Text(
                      'Resend Code',
                      style: TextStyle(
                        color: Color(0xFF3787FF),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ChangePasswordProvider extends ChangeNotifier {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool showNewPassword = false;
  bool showConfirmPassword = false;
  String newPasswordError = '';
  String confirmPasswordError = '';

  void toggleNewPasswordVisibility() {
    showNewPassword = !showNewPassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    showConfirmPassword = !showConfirmPassword;
    notifyListeners();
  }

  void validatePasswords() {
    newPasswordError = newPasswordController.text.length < 8 ? 'Enter a valid password.' : '';
    confirmPasswordError =
    confirmPasswordController.text != newPasswordController.text ? 'Both passwords should match.' : '';

    notifyListeners();
  }
}

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChangePasswordProvider(),
      child: _ChangePasswordPage(),
    );
  }
}

class _ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<_ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChangePasswordProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the grade section page
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
          title: Text('Change Password',
            style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3),
              Icon(Icons.security, size: 100, color: Color(0xFF3787FF)),

              SizedBox(height: 3),
              Text(
                'Change Password',
                style: TextStyle(
                  color: Color(0xFF060302),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 4),
              Text(
                'Your password length consists of 8 characters at least.',
                style: TextStyle(
                  color: Color(0xFF767372),
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20),
              TextField(
                controller: provider.newPasswordController,
                obscureText: !provider.showNewPassword,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'New Password',
                  labelStyle: TextStyle(color: Color(0xFF060302)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF060302)),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(provider.showNewPassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () => provider.toggleNewPasswordVisibility(),
                  ),

                ),
                onChanged: (value) {
                  provider.validatePasswords();
                },
              ),

              SizedBox(height: 16),
              TextField(
                controller: provider.confirmPasswordController,
                obscureText: !provider.showConfirmPassword,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: Color(0xFF060302)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF060302)),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(provider.showConfirmPassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () => provider.toggleConfirmPasswordVisibility(),
                  ),

                ),
                onChanged: (value) {
                  provider.validatePasswords();
                },
              ),

              SizedBox(height: 16),
              /**ElevatedButton(
                  onPressed: () {
                  setState(() {
                  provider.validatePasswords();
                  if (provider.newPasswordError.isEmpty && provider.confirmPasswordError.isEmpty) {
                  Navigator.pushReplacementNamed(context, '/passwordChanged');
                  }
                  else{
                  errorText: provider.newPasswordError.isNotEmpty ? provider.newPasswordError : null,
                  errorStyle: TextStyle(color: Colors.red),
                  errorText: provider.confirmPasswordError.isNotEmpty ? provider.confirmPasswordError : null,
                  errorStyle: TextStyle(color: Colors.red),
                  }
                  });
                  },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3787FF),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  ),
                  ),
                  child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: Text(
                  'Save Password',
                  style: TextStyle(color: Colors.white),
                  ),
                  ),
                  )**/
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    provider.validatePasswords();
                    if (provider.newPasswordError.isEmpty && provider.confirmPasswordError.isEmpty) {
                      Navigator.pushReplacementNamed(context, '/passwordChanged');
                    } else {
                      // Show error messages
                      provider.newPasswordError.isNotEmpty
                          ? provider.newPasswordError
                          : null;
                      provider.confirmPasswordError.isNotEmpty
                          ? provider.confirmPasswordError
                          : null;
                      // Set error styles
                      errorStyle: TextStyle(color: Colors.red);
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3787FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: Text(
                    'Save Password',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}



class GradeSectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the grade section page
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        title: Text(
          'Grade Section',
          style: TextStyle(color: Colors.black, fontSize: 27, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          padding: EdgeInsets.only(top: 20), // Adjust the top padding as needed
          children: [
            Center(
              child: Text(
                'Select your grade.',
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 10),
            _buildGradeBox('Grade 9', 'assets/grade_image_1.PNG', '/subjectSection', context),
            _buildGradeBox('Grade 10', 'assets/grade_image_2.PNG', '/subjectSection', context),
            _buildGradeBox('Grade 11', 'assets/grade_image_3.PNG', '/subjectSection', context),
            _buildGradeBox('Grade 12', 'assets/grade_image_4.PNG', '/subjectSection', context),
          ],
        ),
      ),
    );
  }
}
Widget _buildGradeBox(String grade, String imagePath, String route, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushReplacementNamed(context, route);
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 20, right: 25, left: 25), // Adjust the right margin as needed
      padding: EdgeInsets.only(top: 2, bottom:2, left :30, right: 15 ),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF3787FF), width: 1.5,),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            grade,
            style: TextStyle(
                color: Color(0xFF3787FF),
                fontSize: 23,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(width: 10), // Add spacing between text and image
          Image.asset(
            imagePath,
            width: 120,
            height: 120,
          ),
        ],
      ),
    ),
  );
}

/**
    Widget _buildFooter(BuildContext context) {
    return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Transform.translate(
    offset: Offset(0, -2),
    child: Container(
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(50),
    topRight: Radius.circular(50),
    ),
    ),
    child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    _buildFooterItem(
    icon: 'assets/chat_bot_icon.PNG',
    text: 'Chat Bot',
    isActive: false,
    onTap: () {
    Navigator.pushReplacementNamed(context, '/chatbotpage');
    },
    ),
    _buildFooterItem(
    icon: 'assets/video_upload_icon.png',
    text: 'Video Upload',
    isActive: false,
    onTap: () {
    Navigator.pushReplacementNamed(context, '/videouploadpage');
    },
    ),
    _buildFooterItem(
    icon: 'assets/home_icon.png',
    text: 'Home',
    isActive: false,
    onTap: () {
    Navigator.pushReplacementNamed(context, '/home');
    },
    ),
    _buildFooterItem(
    icon: 'assets/favorities_icon.PNG',
    text: 'Favorites',
    isActive: false,
    onTap: () {
    Navigator.pushReplacementNamed(context, '/favoritespage');
    },
    ),
    _buildFooterItem(
    icon: 'assets/settings_icon.png',
    text: 'Settings',
    isActive: false,
    onTap: () {
    Navigator.pushReplacementNamed(context, '/settings');
    },
    ),
    ],
    ),
    ),
    ),
    ),
    );
    }

    Widget _buildFooterItem({
    required String icon,
    required String text,
    required bool isActive,
    required VoidCallback onTap,
    }) {
    return GestureDetector(
    onTap: onTap,
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    Image.asset(
    icon,
    width: 50,
    height: 50,
    color: isActive ? Color(0xFF3787FF) : Color(0xFF767372),
    ),
    SizedBox(height: 0.1),
    Text(
    text,
    style: TextStyle(
    fontSize: 12,
    color: isActive ? Color(0xFF3787FF) : Color(0xFF767372),
    ),
    ),
    ],
    ),
    );
    }
 **/


class SubjectSectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the grade section page
            Navigator.pushReplacementNamed(context, '/gradeSection');
          },
        ),
        title: Text(
          'Subject Section',
          style: TextStyle(color: Colors.black,fontSize: 27, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          padding: EdgeInsets.only(top: 20), // Adjust the top padding as needed
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0), // Adjust left and right padding as needed
                child: Text(
                  'Select the subject which you want to study.',
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            SizedBox(height: 10),
            _buildSubjectBox('Maths', 'assets/sub_image_1.PNG', '/learningSection', context),
            _buildSubjectBox('Biology', 'assets/sub_image_2.PNG', '/learningSection', context),
            _buildSubjectBox('Chemistry', 'assets/sub_image_3.PNG', '/learningSection', context),
            _buildSubjectBox('Physics', 'assets/sub_image_4.PNG', '/learningSection', context),
          ],
        ),
      ),
    );
  }
}
Widget _buildSubjectBox(String grade, String imagePath, String route, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushReplacementNamed(context, route);
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 20, right: 25, left: 25), // Adjust the right margin as needed
      padding: EdgeInsets.only(top: 2, bottom:2, left :30, right: 15 ),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF3787FF), width: 1.5,),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            grade,
            style: TextStyle(
                color: Color(0xFF3787FF),
                fontSize: 23,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(width: 10), // Add spacing between text and image
          Image.asset(
            imagePath,
            width: 120,
            height: 120,
          ),
        ],
      ),
    ),
  );
}


class LearningSectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the grade section page
            Navigator.pushReplacementNamed(context, '/subjectSection');
          },
        ),
        title: Text(
          'Learning Section',
          style: TextStyle(color: Colors.black, fontSize: 27, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          padding: EdgeInsets.only(top: 20), // Adjust the top padding as needed
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0), // Adjust left and right padding as needed
                child: Text(
                  'Watch videos or test your knowledge through our quizzes.',
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            SizedBox(height: 10),
            _buildLearnBox('Videos', 'assets/learn_image_1.PNG', '/videoSearch', context),
            _buildLearnBox('Quizzes', 'assets/learn_image_2.PNG', '/videoSearch', context),
          ],
        ),
      ),
    );
  }
}
Widget _buildLearnBox(String grade, String imagePath, String route, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushReplacementNamed(context, route);
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 20, right: 25, left: 25), // Adjust the right margin as needed
      padding: EdgeInsets.only(top: 2, bottom:2, left :30, right: 15 ),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF3787FF), width: 1.5,),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            grade,
            style: TextStyle(
                color: Color(0xFF3787FF),
                fontSize: 23,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(width: 10), // Add spacing between text and image
          Image.asset(
            imagePath,
            width: 120,
            height: 120,
          ),
        ],
      ),
    ),
  );
}

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EditProfileProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the grade section page
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        title: Text('Edit Profile',
            style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              // Navigate to the profile edited page
              Navigator.pushReplacementNamed(context, '/profileEdited');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Done',
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
            ),
          ),
        ],

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/Photo.PNG'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle Edit Profile Pic button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric( vertical: 12),
                  child: Text(
                    'Edit Photo',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16),
              _buildInputField('FULL NAME', 'Ayana Nana', 'The username is already taken'),
              _buildInputField('EMAIL', 'ayananana@gmail.com', 'The username is already registered or invalid'),
              _buildSelector('GENDER', 'Optional', ['Male', 'Female', 'Other']),
              _buildSelector('BIRTHDAY', 'Optional', ['Day 1', 'Day 2', 'Day 3']), // Replace with actual date options
              _buildSelector('GRADE', 'Your class/level', ['9', '10', '11', '12']),
              _buildSelector('BOARD', 'Optional', ['Sindh', 'Punjab', 'KPK', 'Balochistan']),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String heading, String hintText, String errorMessage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(
            color: Color(0xFF353945),fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'Poppins',
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF060302)),
            borderRadius: BorderRadius.circular(28),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12),
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Color(0xFF767372)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
       _buildErrorMessage(errorMessage),
      ],
    );
  }

  Widget _buildSelector(String heading, String hintText, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(
            color: Color(0xFF353945),
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'Poppins',
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF060302)),
            borderRadius: BorderRadius.circular(28),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12),
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: DropdownButtonFormField(
                  items: options.map((String option) {
                    return DropdownMenuItem(
                      value: option,
                      child: Text(
                        option,
                        style: TextStyle(color: Color(0xFF353945)),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    // Handle selected value
                  },
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Color(0xFF767372)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildErrorMessage(String errorMessage) {
    if (errorMessage.isEmpty) {
      return SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
      child: Row(
        children: [
          Icon(
            Icons.error,
            color: Color(0xFFF04438),
          ),
          SizedBox(width: 4),
          Expanded(
            child: Text(
              errorMessage,
              style: TextStyle(color: Color(0xFFF04438)),
            ),
          ),
        ],
      ),
    );
  }
}

class EditProfileProvider with ChangeNotifier {
  // Add your state variables here
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // Add other state variables and methods as needed

  // Example method to handle form validation
  void validateFields(BuildContext context) {
    // Add your validation logic here
    // Notify listeners if needed
    notifyListeners();
  }
}

class ProfileeditedProvider extends ChangeNotifier {
  // You can add any state or methods relevant to this page

  void someMethod() {
    // Some logic here
  }
}
class ProfileeditedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileeditedProvider(),
      child: _ProfileeditedContent(),
    );
  }
}

class _ProfileeditedContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProfileeditedProvider>(context, listen: false);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 164, color: Colors.green),
            SizedBox(height: 2),
            Text(
              'Profile edited Successfully!',
              style: TextStyle(color: Color(0xFF060302), fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Congratulations, you have successfully edited your profile!',
                style: TextStyle(color: Color(0xFF767372)),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // You can call any methods from the provider here
                provider.someMethod();
                Navigator.pushReplacementNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3787FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class VideoUploadedProvider extends ChangeNotifier {
  // You can add any state or methods relevant to this page

  void someMethod() {
    // Some logic here
  }
}
class VideoUploadedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VideoUploadedProvider(),
      child: _VideoUploadedPageContent(),
    );
  }
}

class _VideoUploadedPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<VideoUploadedProvider>(context, listen: false);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 164, color: Colors.green),
            SizedBox(height: 2),
            Text(
              'Video Uploaded Successfully!',
              style: TextStyle(color: Color(0xFF060302), fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Congratulations, you have successfully contributed in the community!',
                style: TextStyle(color: Color(0xFF767372)),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // You can call any methods from the provider here
                provider.someMethod();
                Navigator.pushReplacementNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3787FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class VideoUploadProvider with ChangeNotifier {
  double _uploadProgress = 0.0;

  double get uploadProgress => _uploadProgress;

  void updateProgress(double progress) {
    _uploadProgress = progress;
    notifyListeners();
  }
}

class VideoUploadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VideoUploadProvider(),
      child: _VideoUploadPage(),
    );
  }
}

class _VideoUploadPage extends StatefulWidget {
  @override
  __VideoUploadPageState createState() => __VideoUploadPageState();
}

class __VideoUploadPageState extends State<_VideoUploadPage> {
  File? _selectedVideo;
  late VideoUploadProvider _uploadProvider;

  @override
  Widget build(BuildContext context) {
    _uploadProvider = Provider.of<VideoUploadProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(left: 60.0),
                  child: Text(
                    'Video Upload',
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(width: 0),
            GestureDetector(
              onTap: () {
                // Navigate to VideoUploadedPage
                Navigator.pushReplacementNamed(context, '/videoUploaded');
              },
              child: Text('Upload', style: TextStyle(color: Colors.blue, fontSize: 20)),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text(
                  'Upload your videos and contribute to the community',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 19),
                ),
              ),
            ),
            _buildFieldWithIcon('Video guidelines and rules', Icons.arrow_forward_ios),
            _buildFieldWithIcon('Select Video', Icons.video_library, onSelectVideo),
            _buildTextField('Video Title'),
            _buildTextField('Video Description', height: 100.0),
            _buildDropDownField('Select Grade', ['Grade 9', 'Grade 10', 'Grade 11', 'Grade 12']),
            _buildDropDownField('Subject', ['Biology', 'Physics', 'Maths', 'Chemistry']),
            if (_selectedVideo != null) _buildUploadSection(),
          ],
        ),
      ),
      bottomNavigationBar: _buildFooter(context),
    );
  }
  Widget _buildFieldWithIcon(String text, IconData icon, [VoidCallback? onTap]) {
    return GestureDetector(
      onTap: () {
        // Check if the clicked field is "Video guidelines and rules"
        if (text == 'Video guidelines and rules') {
          // Navigate to VideoPolicyPage
          Navigator.pushReplacementNamed(context, '/videoPolicy');
        } else if (onTap != null) {
          // Call the onTap function for other fields
          onTap();
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Color(0xFF9E9E9E), width: 1.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: TextStyle(color: Color(0xFF9E9E9E))),
            Icon(icon, color: Color(0xFF9E9E9E)),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, {double height = 50.0}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Color(0xFF9E9E9E)),
      ),
      child: TextField(
        maxLines: height == 100.0 ? 4 : 1,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildDropDownField(String hintText, List<String> options) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Color(0xFF9E9E9E)),
      ),
      child: DropdownButtonFormField(
        items: options.map((String option) {
          return DropdownMenuItem(
            value: option,
            child: Text(option),
          );
        }).toList(),
        onChanged: (value) {
          // Handle selected value
        },
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Transform.translate(
        offset: Offset(0, -2),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFooterItem(
                  icon: 'assets/chat_bot_icon.PNG',
                  text: 'Chat Bot',
                  isActive: false,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/chatbotpage');
                  },
                ),
                _buildFooterItem(
                  icon: 'assets/video_upload_icon.png',
                  text: 'Video Upload',
                  isActive: true,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/videoUpload');
                  },
                ),
                _buildFooterItem(
                  icon: 'assets/home_icon.png',
                  text: 'Home',
                  isActive: false,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                ),
                _buildFooterItem(
                  icon: 'assets/favorities_icon.PNG',
                  text: 'Favorites',
                  isActive: false,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/favorites');
                  },
                ),
                _buildFooterItem(
                  icon: 'assets/settings_icon.png',
                  text: 'Settings',
                  isActive: false,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/settings');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooterItem({
    required String icon,
    required String text,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            icon,
            width: 50,
            height: 50,
            color: isActive ? Color(0xFF3787FF) : Color(0xFF767372),
          ),
          SizedBox(height: 0.1),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? Color(0xFF3787FF) : Color(0xFF767372),
            ),
          ),
        ],
      ),
    );
  }

  void onSelectVideo() async {
    final pickedFile = await ImagePicker().getVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedVideo = File(pickedFile.path);
      });
    }
  }

  Widget _buildUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 16),
        Text(
          'Video Upload Progress:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        LinearProgressIndicator(
          value: _uploadProvider.uploadProgress,
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: uploadVideo,
          child: Text('Upload Video'),
        ),
      ],
    );
  }

  void uploadVideo() async {
    if (_selectedVideo == null) {
      // Show error message, no video selected
      return;
    }

    try {
      Dio dio = Dio();
      String uploadUrl = 'YOUR_UPLOAD_API_URL'; // Replace with your API endpoint

      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          _selectedVideo!.path,
          filename: 'video.mp4',
        ),
      });

      await dio.post(
        uploadUrl,
        data: formData,
        onSendProgress: (int sent, int total) {
          double progress = sent / total;
          _uploadProvider.updateProgress(progress);
        },
      );

      // Video uploaded successfully, navigate or show a success message
    } catch (e) {
      // Handle upload error
      print('Upload error: $e');
    }
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 27)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Center(
            child: Container(
              margin: EdgeInsets.only(top:10.0,left:25.0, right:25.0), // Adjust the margin as needed
              child: Text(
                'Videos added by you in favorites will be shown here.',
                style: TextStyle(color: Colors.black, fontSize: 17),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          SizedBox(height: 0),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with the actual number of videos
              itemBuilder: (context, index) {
                return _buildVideoItem(
                  thumbnailUrl: 'assets/banner_image_3.jpg', // Replace with the actual thumbnail URL
                  caption: 'Video Caption $index', // Replace with the actual video caption
                  uploaderName: 'Uploader Name', // Replace with the actual uploader name
                  views: '100 views', // Replace with the actual number of views
                  uploadTime: '2 days ago', // Replace with the actual upload time
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildFooter(context),
    );
  }
  Widget _buildVideoItem({
    required String thumbnailUrl,
    required String caption,
    required String uploaderName,
    required String views,
    required String uploadTime,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      padding: EdgeInsets.all(16.0), // Added padding
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.0), // Increased the border radius
        border: Border.all(color: Color(0xFF808191), width:1.3,),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              thumbnailUrl,
              width: 120,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  caption,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 12),
                Text(
                  'By $uploaderName',
                  style: TextStyle(fontSize: 16, color: Color(0xFF808191)),
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Icon(Icons.remove_red_eye, size: 16, color: Color(0xFF808191)),
                    SizedBox(width: 4),
                    Text(
                      views,
                      style: TextStyle(fontSize: 14, color: Color(0xFF808191)),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.fiber_manual_record, size: 6, color: Color(0xFF808191)),
                    SizedBox(width: 8),
                    Text(
                      uploadTime,
                      style: TextStyle(fontSize: 14, color: Color(0xFF808191)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildFooter(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Transform.translate(
        offset: Offset(0, -2),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFooterItem(
                  icon: 'assets/chat_bot_icon.PNG',
                  text: 'Chat Bot',
                  isActive: false,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/chatbot');
                  },
                ),
                _buildFooterItem(
                  icon: 'assets/video_upload_icon.png',
                  text: 'Video Upload',
                  isActive: false,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/videoUpload');
                  },
                ),
                _buildFooterItem(
                  icon: 'assets/home_icon.png',
                  text: 'Home',
                  isActive: false,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                ),
                _buildFooterItem(
                  icon: 'assets/favorities_icon.PNG',
                  text: 'Favorites',
                  isActive: true,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/favorites');
                  },
                ),
                _buildFooterItem(
                  icon: 'assets/settings_icon.png',
                  text: 'Settings',
                  isActive: false,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/settings');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooterItem({
    required String icon,
    required String text,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            icon,
            width: 50,
            height: 50,
            color: isActive ? Color(0xFF3787FF) : Color(0xFF767372),
          ),
          SizedBox(height: 0.1),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? Color(0xFF3787FF) : Color(0xFF767372),
            ),
          ),
        ],
      ),
    );
  }
}

class VideoSearchProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  bool isSearchEmpty = false;

  void updateSearch() {
    isSearchEmpty = searchController.text.isEmpty;
    notifyListeners();
  }
}

class VideoSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VideoSearchProvider(),
      child: _VideoSearchPage(),
    );
  }
}

class _VideoSearchPage extends StatefulWidget {
  @override
  __VideoSearchPageState createState() => __VideoSearchPageState();
}

class __VideoSearchPageState extends State<_VideoSearchPage> {
  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<VideoSearchProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the grade section page
            Navigator.pushReplacementNamed(context, '/learningSection');
          },
        ),
        title: Text('Video Section', style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Learn through the uploaded content',
                style: TextStyle(color: Colors.black, fontSize: 20),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          SizedBox(height: 10),
          _buildSearchBar(context, searchProvider),
          SizedBox(height: 16),
          _buildSearchResults(context, searchProvider),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context,
      VideoSearchProvider searchProvider) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: Colors.blue, width: 1.5),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.blue),
            onPressed: () {
              // Implement search action
              searchProvider.updateSearch();
            },
          ),
          Expanded(
            child: TextField(
              controller: searchProvider.searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                searchProvider.updateSearch();
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.blue),
            onPressed: () {
              // Implement filter action
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNoResults() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 50),
        Image.asset('assets/not_found.PNG'), // Replace with your image asset
        SizedBox(height: 16),
        Text(
          'Video Not Found',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ],
    );
  }

  Widget _buildSearchResults(BuildContext context,
      VideoSearchProvider searchProvider) {
    return searchProvider.isSearchEmpty
        ? _buildNoResults()
        : Expanded(
      child: ListView.builder(
        itemCount: 10, // Replace with the actual number of search results
        itemBuilder: (context, index) {
          return _buildVideoItem(
            thumbnailUrl: 'assets/banner_image_3.jpg',
            // Replace with the actual thumbnail URL
            caption: 'Video Caption $index',
            // Replace with the actual video caption
            uploaderName: 'Uploader Name',
            // Replace with the actual uploader name
            views: '100 views',
            // Replace with the actual number of views
            uploadTime: '2 days ago',
            // Replace with the actual upload time
            context: context,
          );
        },
      ),
    );
  }
  Widget _buildVideoItem({
    required String thumbnailUrl,
    required String caption,
    required String uploaderName,
    required String views,
    required String uploadTime,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        // Handle video item click - navigate to /videoWatch
        Navigator.pushNamed(context, '/videoWatch');
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Color(0xFF808191), width: 1.3),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                thumbnailUrl,
                width: 120,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    caption,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      // Handle uploader name click - navigate to /uploaderProfile
                      Navigator.pushReplacementNamed(context, '/uploaderProfile');
                    },
                    child: Text(
                      'By $uploaderName',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF808191),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Icon(Icons.remove_red_eye, size: 16, color: Color(0xFF808191)),
                      SizedBox(width: 4),
                      Text(
                        views,
                        style: TextStyle(fontSize: 14, color: Color(0xFF808191)),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.fiber_manual_record, size: 6, color: Color(0xFF808191)),
                      SizedBox(width: 8),
                      Text(
                        uploadTime,
                        style: TextStyle(fontSize: 14, color: Color(0xFF808191)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  class UploaderPage extends StatefulWidget {
  @override
  _UploaderPageState createState() => _UploaderPageState();
}

class _UploaderPageState extends State<UploaderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the grade section page
            Navigator.pushReplacementNamed(context, '/videoSearch');
          },
        ),
        title: Text('Uplaoder Profile', style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 25),
          _buildUploaderInfo(),
          SizedBox(height: 16),
          _buildVideoList(),
        ],
      ),
    );
  }

  Widget _buildUploaderInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: CircleAvatar(
            radius: 58,
            backgroundImage: AssetImage('assets/Photo.PNG'), // Replace with actual image
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Text(
              'Uploader Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.video_library, size: 22, color: Color(0xFF808191)),
                SizedBox(width: 4),
                Text(
                  '10 Videos', // Replace with the actual count of videos
                  style: TextStyle(fontSize: 17, color: Color(0xFF808191)),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVideoList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10, // Replace with the actual number of videos
        itemBuilder: (context, index) {
          return _buildVideoItem(
            thumbnailUrl: 'assets/banner_image_3.jpg', // Replace with the actual thumbnail URL
            caption: 'Video Caption $index', // Replace with the actual video caption
            uploaderName: 'Uploader Name', // Replace with the actual uploader name
            views: '100 views', // Replace with the actual number of views
            uploadTime: '2 days ago', // Replace with the actual upload time
            context: context,
          );
        },
      ),
    );
  }

  Widget _buildVideoItem({
    required String thumbnailUrl,
    required String caption,
    required String uploaderName,
    required String views,
    required String uploadTime,
    required BuildContext context, // Pass the context to access the Navigator
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Color(0xFF808191), width: 1.3),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              thumbnailUrl,
              width: 120,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  caption,
                  style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    // Handle uploader name click - navigate to /uploaderProfile
                    Navigator.pushReplacementNamed(context, '/uploaderProfile');
                  },
                  child: Text(
                    'By $uploaderName',
                    style: TextStyle(fontSize: 16,
                        color: Color(0xFF808191),
                        decoration: TextDecoration.underline),
                  ),
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Icon(Icons.remove_red_eye, size: 16,
                        color: Color(0xFF808191)),
                    SizedBox(width: 4),
                    Text(
                      views,
                      style: TextStyle(fontSize: 14, color: Color(0xFF808191)),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.fiber_manual_record, size: 6,
                        color: Color(0xFF808191)),
                    SizedBox(width: 8),
                    Text(
                      uploadTime,
                      style: TextStyle(fontSize: 14, color: Color(0xFF808191)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VideoWatchHomePage extends StatefulWidget {
  @override
  _VideoWatchHomePageState createState() => _VideoWatchHomePageState();
}

class _VideoWatchHomePageState extends State<VideoWatchHomePage> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset('assets/Eduitive.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
    _videoPlayerController.initialize();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the grade section page
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        title: Text('What we Do?',
            style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
      ),
      body: _buildVideoWatchHomePage(
        videoUrl: 'assets/Eduitive.mp4',
        title: 'Sample Video Title',
        uploaderName: 'Uploader Name',
        views: '100 views',
        uploadTime: '2 days ago',
      ),
    );
  }

  Widget _buildVideoWatchHomePage({
    required String videoUrl,
    required String title,
    required String uploaderName,
    required String views,
    required String uploadTime,
  }) {
    return Container(
      padding: EdgeInsets.all(0.0), // Remove the top and bottom padding
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Chewie(controller: _chewieController),
    );
  }
}


class VideoWatchPage extends StatefulWidget {
  @override
  _VideoWatchPageState createState() => _VideoWatchPageState();
}

class _VideoWatchPageState extends State<VideoWatchPage> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  bool isLiked = false;
  int likeCount = 20;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset('assets/Eduitive.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
    _videoPlayerController.initialize();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }

  Future<void> _showReportDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Report Video'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to report this video?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                // TODO: Implement the action to report the video
                Navigator.of(context).pop();
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the grade section page
            Navigator.pushReplacementNamed(context, '/videoSearch');
          },
        ),
        title: Text('Video Watch', style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildVideoWatchPage(
            videoUrl: 'assets/Eduitive.mp4',
            title: 'Sample Video Title',
            uploaderName: 'Uploader Name',
            views: '100 views',
            uploadTime: '2 days ago',
          ),

          Text(
            'Other Recommended Videos',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,

            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with the actual number of videos
              itemBuilder: (context, index) {
                return _buildVideoItem(
                  thumbnailUrl: 'assets/banner_image_3.jpg',
                  // Replace with the actual thumbnail URL
                  caption: 'Video Caption $index',
                  // Replace with the actual video caption
                  uploaderName: 'Uploader Name',
                  // Replace with the actual uploader name
                  views: '100 views',
                  // Replace with the actual number of views
                  uploadTime: '2 days ago', // Replace with the actual upload time
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoWatchPage({
    required String videoUrl,
    required String title,
    required String uploaderName,
    required String views,
    required String uploadTime,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Color(0xFF808191), width: 1.3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 180, child: Chewie(controller: _chewieController)),
          SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/Photo.PNG'),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'By $uploaderName',
                  style: TextStyle(fontSize: 16, color: Color(0xFF808191)),
                ),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: _showReportDialog,
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: Text('Report'),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.favorite),
                color: isLiked ? Colors.red : Colors.grey,
                onPressed: _toggleLike,
              ),
              Text('$likeCount likes'),
              SizedBox(width: 15),
              Icon(
                  Icons.fiber_manual_record, size: 7, color: Color(0xFF808191)),
              SizedBox(width: 15),
              Text(
                views,
                style: TextStyle(fontSize: 14, color: Color(0xFF808191)),
              ),
              SizedBox(width: 15),
              Icon(
                  Icons.fiber_manual_record, size: 7, color: Color(0xFF808191)),
              SizedBox(width: 15),
              Text(
                uploadTime,
                style: TextStyle(fontSize: 14, color: Color(0xFF808191)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVideoListItem({
    required String videoUrl,
    required String title,
    required String uploaderName,
    required String views,
    required String uploadTime,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Color(0xFF808191), width: 1.3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 180, child: Chewie(controller: _chewieController)),
          SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/Photo.PNG'),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'By $uploaderName',
                  style: TextStyle(fontSize: 16, color: Color(0xFF808191)),
                ),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: _showReportDialog,
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: Text('Report'),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.favorite),
                color: isLiked ? Colors.red : Colors.grey,
                onPressed: _toggleLike,
              ),
              Text('$likeCount likes'),
              SizedBox(width: 15),
              Icon(
                  Icons.fiber_manual_record, size: 7, color: Color(0xFF808191)),
              SizedBox(width: 15),
              Text(
                views,
                style: TextStyle(fontSize: 14, color: Color(0xFF808191)),
              ),
              SizedBox(width: 15),
              Icon(
                  Icons.fiber_manual_record, size: 7, color: Color(0xFF808191)),
              SizedBox(width: 15),
              Text(
                uploadTime,
                style: TextStyle(fontSize: 14, color: Color(0xFF808191)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVideoItem({
    required String thumbnailUrl,
    required String caption,
    required String uploaderName,
    required String views,
    required String uploadTime,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      padding: EdgeInsets.all(16.0), // Added padding
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.0),
        // Increased the border radius
        border: Border.all(color: Color(0xFF808191), width: 1.3,),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              thumbnailUrl,
              width: 120,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  caption,
                  style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 12),
                Text(
                  'By $uploaderName',
                  style: TextStyle(fontSize: 16, color: Color(0xFF808191)),
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Icon(Icons.remove_red_eye, size: 16,
                        color: Color(0xFF808191)),
                    SizedBox(width: 4),
                    Text(
                      views,
                      style: TextStyle(fontSize: 14, color: Color(0xFF808191)),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.fiber_manual_record, size: 6,
                        color: Color(0xFF808191)),
                    SizedBox(width: 8),
                    Text(
                      uploadTime,
                      style: TextStyle(fontSize: 14, color: Color(0xFF808191)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

