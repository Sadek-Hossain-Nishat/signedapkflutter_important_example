import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import 'pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51Lm6gpAyYc99LEqTOPGZqOwSLWC1DyvY4ZXosViktcPWcSalzPNV2jOZolYNz8xbjPScOro3U2uVIR2UnkT28EbU00sZ0Sz4u7'; // Replace with your publishable key
  runApp(GetMaterialApp(
    initialRoute: '/',
    //fade in transition
    transitionDuration: const Duration(milliseconds: 500),
    defaultTransition: Transition.fadeIn,
    getPages: [
      GetPage(
        name: '/',
        page: () => const HomePage(),
      ),
    ],
  ));
}
