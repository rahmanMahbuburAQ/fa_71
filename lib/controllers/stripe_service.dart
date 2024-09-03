import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripeService {
 static String apiBase = 'https://api.stripe.com/v1';
 static String paymentApiUrl = '${StripeService.apiBase}/payment_intents';

 static String secret = "sk_test_51PuUXrKN112apsOO197bwMkFvY9gLITiZyjDPNIUGJ3bFFRmh99le1uyoWKqFW1T8AjFvXWv6ULo5IYPv4cPw2f600EK9PCAKz";

 static Map<String, String> headers = {
  "Authorization": "Bearer $secret",
  "Content-Type": "application/x-www-form-urlencoded"
 };

 static void init() {
  Stripe.publishableKey = "pk_test_51PuUXrKN112apsOONCQMSWUoWmhWpDMOxp76CYznvH3KDT9CQbYYjiR2cH0A2934vzoBL9LISEKaKPeT0eGkDHUo00LuEEnIdu";
 }

 static Future<Map<String, dynamic>> createPaymentIntent(String amount, String currency) async {
  try {
   Map<String, dynamic> body = {
    'amount': amount,
    'currency': currency,
    'payment_method_types[]': 'card',
   };

   var response = await http.post(
    Uri.parse(paymentApiUrl),
    body: body,
    headers: headers,
   );

   if (response.statusCode == 200) {
    return jsonDecode(response.body);
   } else {
    print('Error response: ${response.body}');
    throw Exception('Failed to create payment intent: ${response.body}');
   }
  } catch (e) {
   print('Exception during payment intent creation: $e');
   throw Exception('Failed to create payment intent: $e');
  }
 }

 static Future<void> initPaymentSheet(String amount, String currency) async {
  try {
   final paymentIntent = await createPaymentIntent(amount, currency);

   if (paymentIntent.containsKey('client_secret')) {
    await Stripe.instance.initPaymentSheet(
     paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntent['client_secret'],
      merchantDisplayName: 'Hey my customer',
      style: ThemeMode.system,
     ),
    );
   } else {
    throw Exception('Failed to retrieve client secret');
   }
  } catch (e) {
   print('Exception during payment sheet initialization: $e');
   throw Exception('Failed to initialize payment sheet: $e');
  }
 }

 static Future<void> presentPaymentSheet() async {
  try {
   await Stripe.instance.presentPaymentSheet();
  } catch (e) {
   print('Exception during payment sheet presentation: $e');
   throw Exception('Failed to present payment sheet: $e');
  }
 }
}
