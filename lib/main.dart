import 'package:deliveryapp/admin/add_food.dart';
import 'package:deliveryapp/widgets/app_constant.dart'; // Ensure publishableKey is in this file
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_stripe/flutter_stripe.dart'; // Import Stripe
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Ensure publishableKey is properly set
  Stripe.publishableKey = AppConstant.publishableKey; 

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AddFood());
  }
}
