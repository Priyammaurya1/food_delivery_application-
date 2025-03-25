import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:deliveryapp/pages/login.dart';
import 'package:deliveryapp/widgets/widget_support.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFff5c30), Color(0xFFe74b1a)],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 3,
              ),
              height: MediaQuery.of(context).size.height / 1,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              
            ),
            Container(
              margin: EdgeInsets.only(top: 60, left: 20, right: 20),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      'images/logo.png',
                      width: MediaQuery.of(context).size.width / 1.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 50),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          Text(
                            'Sign Up',
                            style: AppWidget.headlineTextFeildStyle(),
                          ),
                          SizedBox(height: 30),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Name",
                              hintStyle: AppWidget.semiBoldTextFeildStyle(),
                              prefixIcon: Icon(Icons.person_2_outlined),
                            ),
                          ),
                          SizedBox(height: 30),
                            TextField(
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: AppWidget.semiBoldTextFeildStyle(),
                              prefixIcon: Icon(Icons.email_outlined),
                            ),
                            ),
                            SizedBox(height: 30),
                            TextField(
                            keyboardType: TextInputType.phone,  // Set the keyboard type
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly, // Allow only digits
                              LengthLimitingTextInputFormatter(10),  // Limit to 10 digits
                            ],
                            decoration: InputDecoration(
                              hintText: "Phone Number",
                              hintStyle: AppWidget.semiBoldTextFeildStyle(),
                              prefixIcon: Icon(Icons.phone_android_outlined),
                            ),
                            ),
                          SizedBox(height: 30),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: AppWidget.semiBoldTextFeildStyle(),
                              prefixIcon: Icon(Icons.password_outlined),
                            ),
                          ),
                          SizedBox(height: 90),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              width: 200,
                              decoration: BoxDecoration(
                                color: Color(0xffff5722),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: 
                            Center(
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 80),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                            },
                            child: Text('Already have an account? Login',
                            style: AppWidget.semiBoldTextFeildStyle(),
                            ),
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