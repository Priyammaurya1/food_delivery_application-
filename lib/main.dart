import 'package:deliveryapp/pages/bottom_nav_bar.dart';
import 'package:deliveryapp/widgets/app_constant.dart';
import 'package:deliveryapp/widgets/app_constant.dart' as Stripe;
import 'package:flutter/material.dart';
// import 'package:deliveryapp/pages/onboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = publishableKey;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: BottomNav());
  }
}
