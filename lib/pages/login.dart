import 'package:deliveryapp/pages/bottom_nav_bar.dart';
import 'package:deliveryapp/pages/forgotpassword.dart';
// import 'package:deliveryapp/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:deliveryapp/pages/signup.dart';
import 'package:deliveryapp/widgets/widget_support.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  Future<void> userLogin() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );

      if (userCredential.user != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNav()));
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred';
      if (e.code == 'user-not-found') {
        errorMessage = 'No User Found for this Email';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Incorrect Password';
      } else {
        errorMessage = e.message ?? 'Something went wrong';
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage, style: const TextStyle(fontSize: 16, color: Colors.white)),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFff5c30), Color(0xFFe74b1a)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // White Container for Form
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
          ),

          // Login Form
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 80),
                Image.asset('images/logo.png', width: MediaQuery.of(context).size.width / 2),
                const SizedBox(height: 50),
                Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Text('Login', style: AppWidget.headlineTextFeildStyle()),
                          const SizedBox(height: 30),

                          // Email Field
                          TextFormField(
                            controller: emailController,
                            validator: (value) => value!.isEmpty ? 'Enter your email' : null,
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: AppWidget.semiBoldTextFeildStyle(),
                              prefixIcon: const Icon(Icons.email_outlined),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Password Field
                          TextFormField(
                            controller: passController,
                            validator: (value) => value!.isEmpty ? 'Enter your password' : null,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: AppWidget.semiBoldTextFeildStyle(),
                              prefixIcon: const Icon(Icons.lock_outline),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Forgot Password
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPassword()));
                            },
                            child: Container(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text('Forgot Password?', style: AppWidget.semiBoldTextFeildStyle()),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),

                          // Login Button
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                userLogin();
                              }
                            },
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0xffff5722),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),

                // Signup Navigation
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
                  },
                  child: Text(
                    'Don\'t have an account? Sign up',
                    style: AppWidget.semiBoldTextFeildStyle(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
