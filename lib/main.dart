import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:async';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StateProviderClass()),
        ChangeNotifierProvider(create: (context) => CreateAccountStateProvider()),
        ChangeNotifierProvider(create: (context) => ForgotPasswordProvider()),
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
    _validatePassword = _passwordController.text.isEmpty || _passwordController.text != '12345678';

    if (!_validateEmail && !_validatePassword) {
      // Login logic here
      // If successful, navigate to the next screen
      Navigator.pushReplacementNamed(context, '/home'); // Note: You need to provide a valid context here.
    }

    notifyListeners();
  }

  bool _isValidEmail(String email) {
    return email.contains('@');
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


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
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
              Consumer<StateProviderClass>(
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
              Consumer<StateProviderClass>(
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
                onPressed: () {
                  Provider.of<StateProviderClass>(context, listen: false).validateFields(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF3787FF),
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
      StateProviderClass stateProvider,
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
      StateProviderClass stateProvider,
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

class CreateAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
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
                    'A small explanation about creating an account.',
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
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF3787FF),
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
                primary: Color(0xFF3787FF),
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
        title: Text('Terms and Conditions'),
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
      appBar: AppBar(
        title: Text('Privacy Policy'),
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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your home page content here
            Text('Home Page Content'),
          ],
        ),
      ),
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
        title: Text('Forgot Password'),
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
                      primary: Color(0xFF3787FF),
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

class VerificationCodePage extends StatefulWidget {
  @override
  _VerificationCodePageState createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  List<TextEditingController> _codeControllers = List.generate(4, (index) => TextEditingController());
  List<bool> _validateCodes = List.generate(4, (index) => false);
  String _errorMessage = '';
  bool _isCodeSent = true; // Set to true initially to display the green message
  int _resendTimer = 10;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_resendTimer > 0) {
        setState(() {
          _resendTimer--;
        });
      } else {
        _timer?.cancel();
        if (_isCodeSent) {
          // Automatically switch to "Resend Code" when the timer reaches 0
          setState(() {
            _isCodeSent = false;
            _resendTimer = 60;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter a Code'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon in the center
              SizedBox(height: 3),
              Icon(Icons.code, size: 100, color: Color(0xFF060302)),

              // Heading "Enter a Code"
              SizedBox(height: 3),
              Text(
                'Enter a Code',
                style: TextStyle(
                  color: Color(0xFF060302),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Description "We sent a verification code on email"
              SizedBox(height: 4),
              Text(
                'We sent a verification code on email',
                style: TextStyle(
                  color: Color(0xFF767372),
                ),
              ),

              // Change Email
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  // Navigate to the forgot password screen
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

              // Code Fields
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
                      controller: _codeControllers[index],
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                      onChanged: (value) {
                        setState(() {
                          _validateCodes[index] = value.isEmpty;
                        });
                      },
                    ),
                  );
                }),
              ),

              // Error Message
              if (_validateCodes.any((validate) => validate))
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

              // Continue Button
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _handleContinueButton(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF3787FF),
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

              // Resend Code
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  // Toggle between showing success message and timer or "Resend Code"
                  setState(() {
                    _isCodeSent = !_isCodeSent;
                    _resendTimer = 60;
                  });
                  startTimer();
                },
                child: _isCodeSent
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
                      'New Verification code can be requested in $_resendTimer seconds',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF767372),
                      ),
                    ),
                  ],
                )
                    : Text(
                  'Resend Code',
                  style: TextStyle(
                    color: Color(0xFF3787FF),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to handle the "Continue" button click
  void _handleContinueButton(BuildContext context) {
    setState(() {
      _validateCodes = _codeControllers.map((controller) => controller.text.isEmpty).toList();
      _errorMessage = _validateCodes.any((validate) => validate) ? 'Code is required.' : '';
    });

    if (!_validateCodes.any((validate) => validate)) {
      // Perform the desired action on successful validation
      // For example, navigate to the next screen:
      Navigator.pushReplacementNamed(context, '/home');
    }
  }
}