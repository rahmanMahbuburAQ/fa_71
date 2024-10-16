import 'package:fa_71/models/cart2.dart';
import 'package:fa_71/pages/home_page2.dart';
import 'package:flutter/material.dart';
import 'package:fa_71/controllers/stripe_service.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key

  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String currency = 'JPY';

  @override
  void initState() {
    super.initState();
    StripeService.init(); // Initialize the Stripe publishable key
  }

  void handlePaymentError(dynamic error) {
    String errorMessage = error.toString();
    if (errorMessage.contains('Failed to create payment intent')) {
      errorMessage = 'Payment intent creation failed. Please check your network or Stripe credentials.';
    } else if (errorMessage.contains('Failed to initialize payment sheet')) {
      errorMessage = 'Payment sheet initialization failed. Please check your Stripe integration.';
    } else if (errorMessage.contains('Failed to present payment sheet')) {
      errorMessage = 'Payment sheet presentation failed. Please try again.';
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        centerTitle: true,  // This centers the title
      ),
      body: Center(
        child: Consumer<Cart>(
          builder: (context, value, child){
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start, // Aligns all children to the left
              children: [
                SizedBox(height: 50),
                Text(
                  'Summary:', // The text you want to display
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,decoration: TextDecoration.underline)
                ),
                SizedBox(height: 10),
                Text(
                  'Original Price: \￥${value.getTotalPrice().toStringAsFixed(0)} ', // The text you want to display
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 6),
                Text(
                  'Discounts: ￥0', // The text you want to display
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 70),
                // Divider( // Horizontal line after the text
                //   color: Colors.grey,
                //   thickness: 1, // You can adjust the thickness of the line
                // ),
                Text(
                  'Total: \￥${value.getTotalPrice().toStringAsFixed(0)} ', // The text you want to display
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 150),

                ElevatedButton(
                  onPressed: () async {
                    try {
                      // Extracting the total price as a double and converting it to a string
                      double totalPrice = value.getTotalPrice();
                      String amount = totalPrice.toStringAsFixed(0); // Convert to string without decimals
                      await StripeService.initPaymentSheet(amount, currency);
                      await StripeService.presentPaymentSheet();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Congratulations!!! Payment successful!')),
                      );
                      // On successful login, navigate to the home page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage2(),
                        ),
                      );
                    } catch (e) {
                      print('Payment error: $e');
                      handlePaymentError(e);
                    }
                  },
                  child: Text("Complete Checkout"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Background color
                    foregroundColor: Colors.white, // Text color
                    padding: EdgeInsets.symmetric(horizontal: 94, vertical: 16), // Button padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                  ),
                ),
              ],
            );
          }
        ),

      ),
    );
  }
}




