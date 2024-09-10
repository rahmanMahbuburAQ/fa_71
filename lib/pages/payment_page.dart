import 'package:fa_71/pages/api_screen.dart';
import 'package:flutter/material.dart';
import 'package:fa_71/controllers/stripe_service.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key

  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String amount = '5500';
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
        title: Text('Payment Screen3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              'Payment section', // The text you want to display
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Total payment', // The text you want to display
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) =>
            //             ApiResponses(),
            //       ),
            //     );
            //   },
            //   child: Text("Go to API response"),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.blue, // Background color
            //     foregroundColor: Colors.white, // Text color
            //     padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Button padding
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8), // Rounded corners
            //     ),
            //   ),
            // ),
            SizedBox(height: 50,),

            ElevatedButton(
              onPressed: () async {
                try {
                  await StripeService.initPaymentSheet(amount, currency);
                  await StripeService.presentPaymentSheet();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Congratulations!!! Payment successful!')),
                  );
                } catch (e) {
                  print('Payment error: $e');
                  handlePaymentError(e);
                }
              },
              child: Text("Pay JPY $amount"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Background color
                foregroundColor: Colors.white, // Text color
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




