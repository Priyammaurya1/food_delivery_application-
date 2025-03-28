import 'package:deliveryapp/pages/bottom_nav_bar.dart';
import 'package:deliveryapp/services/database.dart';
import 'package:deliveryapp/services/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:deliveryapp/pages/login.dart';
import 'package:deliveryapp/widgets/widget_support.dart';
import 'package:random_string/random_string.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = '';
  String password = '';
  String name = '';
  String phoneNumber = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  registration() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        email = emailController.text;
        name = nameController.text;
        phoneNumber = phoneNumberController.text;
        password = passwordController.text;
      });

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Registration Success',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );

        String Id = randomAlphaNumeric(10);

        Map<String, dynamic> addUserInfo ={
          'Name': nameController.text,
          "Email": emailController.text,
          "Wallet": "0",
          'Id': Id,
        };

        await DataBaseMethods().addUserDetail(addUserInfo, Id);
        await SharedPreferenceHelper().saveUserName(nameController.text);
        await SharedPreferenceHelper().saveUserEmail(emailController.text);
        await SharedPreferenceHelper().saveUserWallet('0');
        await SharedPreferenceHelper().saveUserId(Id);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BottomNav()));
      } on FirebaseAuthException catch (e) {
        String errorMessage = 'An error occurred';
        if (e.code == 'weak-password') {
          errorMessage = 'Password is too weak';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'Email is already in use';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(errorMessage, style: TextStyle(fontSize: 20)),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Fixes overflow issue
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFff5c30), Color(0xFFe74b1a)],
                ),
              ),
              child: Center(
                child: Image.asset(
                  'images/logo.png',
                  width: MediaQuery.of(context).size.width / 1.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Ensures it adapts to content size
                  children: [
                    SizedBox(height: 30),
                    Text('Sign Up', style: AppWidget.headlineTextFeildStyle()),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: nameController,
                      hintText: "Name",
                      icon: Icons.person_2_outlined,
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your Name' : null,
                    ),
                    _buildTextField(
                      controller: emailController,
                      hintText: "Email",
                      icon: Icons.email_outlined,
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your Email' : null,
                    ),
                    _buildTextField(
                      controller: phoneNumberController,
                      hintText: "Phone Number",
                      icon: Icons.phone_android_outlined,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your Phone Number' : null,
                    ),
                    _buildTextField(
                      controller: passwordController,
                      hintText: "Password",
                      icon: Icons.password_outlined,
                      obscureText: true,
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your Password' : null,
                    ),
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: registration,
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          width: 200,
                          decoration: BoxDecoration(
                            color: Color(0xffff5722),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text(
                        'Already have an account? Login',
                        style: AppWidget.semiBoldTextFeildStyle(),
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppWidget.semiBoldTextFeildStyle(),
          prefixIcon: Icon(icon),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
