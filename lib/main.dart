import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(MyApp());
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
        '/createAccount': (context) => CreateAccountPage(),
        '/AccountCreated': (context) => AccountCreatedPage(),
    '/termsAndConditions': (context) => TermsAndConditionsPage(),
        '/privacyPolicy': (context) => PrivacyPolicyPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
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
      body: Stack(
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
                  textAlign: TextAlign.center, // Center align the text
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
                    textAlign: TextAlign.center, // Center align the text
                  ),
                ),
                SizedBox(height: 26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyApp()._buildDot(true), // Active dot
                    MyApp()._buildDot(false),
                    MyApp()._buildDot(false),
                    MyApp()._buildDot(false),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
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
      ),
    );
  }
}

class SplashScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
              'Community Learning',
              style: TextStyle(
                color: Color(0xFF060302),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,  // Center align the text
            ),
            SizedBox(height: 5),
            Container(
              height: 2,
              width: 60,
              color: Color(0xFF3787FF),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),  // Equal margins from left and right
              child: Text(
                'Engage with a Community of Learners and Experts!',
                style: TextStyle(
                  color: Color(0xFF767372),
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,  // Center align the text
              ),
            ),
            SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyApp()._buildDot(false),
                MyApp()._buildDot(true), // Active dot
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
      ),
    );
  }
}
class SplashScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                  'Test Yourself',
                  style: TextStyle(
                    color: Color(0xFF060302),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center, // Center align the text
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
                    textAlign: TextAlign.center, // Center align the text
                  ),
                ),
                SizedBox(height: 26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyApp()._buildDot(false),
                    MyApp()._buildDot(false),
                    MyApp()._buildDot(true), // Active dot
                    MyApp()._buildDot(false),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/splash4');
                  },
                  child: Text('Next'), // Add a child widget here
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
      ),
    );
  }
}

class SplashScreen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
              textAlign: TextAlign.center, // Center align the text
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
              // Equal margins from left and right
              child: Text(
                'Unlock Solutions to Complex Questions with our Friendly Chatbot Samora to facilitate your Learning.',
                style: TextStyle(
                  color: Color(0xFF767372),
                  fontSize: 14,
                ),
                textAlign: TextAlign.center, // Center align the text
              ),
            ),
            SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyApp()._buildDot(false),
                MyApp()._buildDot(false),
                MyApp()._buildDot(false),
                MyApp()._buildDot(true),
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
      ),
    );
  }
}
class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;
  bool _isCheckboxChecked = false; // Added state variable for checkbox

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool _validateUsername = false;
  bool _validateEmail = false;
  bool _validatePassword = false;
  bool _validateConfirmPassword = false;
  bool _validateCheckbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            children: [
              Icon(Icons.account_circle, size: 100, color: Colors.blue),
              SizedBox(height: 2),
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

              _buildInputField(Icons.person, 'Username', _usernameController,
                  _validateUsername, 'Username is a required field or already taken.'),

              _buildInputField(Icons.email, 'Email Id', _emailController, _validateEmail,
                  'Please enter a valid email.'),

              _buildPasswordField(
                _passwordController,
                _validatePassword,
                'Your password must contain 8 characters.',
                _isObscurePassword,
                    () {
                  setState(() {
                    _isObscurePassword = !_isObscurePassword;
                  });
                },
              ),

              _buildPasswordField(
                _confirmPasswordController,
                _validateConfirmPassword,
                'Must match both passwords.',
                _isObscureConfirmPassword,
                    () {
                  setState(() {
                    _isObscureConfirmPassword = !_isObscureConfirmPassword;
                  });
                },
              ),

              Row(
                children: [
                  Checkbox(
                    value: _isCheckboxChecked,
                    onChanged: (value) {
                      setState(() {
                        _isCheckboxChecked = value!;
                        _validateCheckbox = false;
                      });
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
              if (_validateCheckbox)
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
                  _validateFields();
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
                    setState(() {
                      // Reset validation on change
                      validate = false;
                    });
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
                    setState(() {
                      // Reset validation on change
                      validate = false;
                    });
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

  void _validateFields() {
    setState(() {
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
        Navigator.pushReplacementNamed(context, '/AccountCreated');
      }
    });
  }

  bool _isValidEmail(String email) {
    return email.contains('@');
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _validateEmail = false;
  bool _validatePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
              SizedBox(height: 16),
              _buildInputField(
                Icons.email,
                'Email ID (Required)',
                _emailController,
                _validateEmail,
                'Please enter a valid email.',
              ),

              // Password Field
              SizedBox(height: 16),
              _buildPasswordField(),

              // Forgot Password Link
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: Color(0xFF3787FF),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),

              // Login Button
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _validateFields();
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
                  // Handle login with Google
                },
                icon: Image.asset(
                  'assets/chatbot.PNG', // Replace with your actual asset path
                  width: 24,
                  height: 24,
                  color: Color(0xFF060302),
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
                    setState(() {
                      // Reset validation on change
                      validate = false;
                    });
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

  Widget _buildPasswordField() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: _validatePassword ? Color(0xFFF04438) : Color(0xFF060302)),
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
                  obscureText: _isObscure,
                  onChanged: (_) {
                    setState(() {
                      // Reset validation on change
                      _validatePassword = false;
                    });
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
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: Color(0xFF060302),
                ),
                onPressed: () {
                  setState(() {
                    // Toggle password visibility
                    _isObscure = !_isObscure;
                  });
                },
              ),
            ],
          ),
        ),
        if (_validatePassword)
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

  void _validateFields() {
    setState(() {
      _validateEmail = _emailController.text.isEmpty || !_isValidEmail(_emailController.text);
      _validatePassword = _passwordController.text.isEmpty || _passwordController.text != '12345678';

      if (!_validateEmail && !_validatePassword) {
        // Login logic here
        // If successful, navigate to the next screen
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }


  bool _isValidEmail(String email) {
    return email.contains('@');
  }
}


class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Terms and Conditions Page'),
            // Add your terms and conditions UI widgets here
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Privacy Policy Page'),
            // Add your privacy policy UI widgets here
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
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Page'),
            // Add your terms and conditions UI widgets here
          ],
        ),
      ),
    );
  }
}
class AccountCreatedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              textAlign: TextAlign.center,  // Center align the text
            ),
            SizedBox(height: 8),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),  // Equal margins from left and right
              child: Text(
                'Congratulations, you have completed your registration!',
                style: TextStyle(color: Color(0xFF767372)),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
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

