import 'package:fa_71/pages/payment_page.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Cart')
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // Center the column content
            children: [
              Text(
                'Welcome to MyCart', // The text you want to display
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // Add some space between the text and the button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PaymentPage(),
                    ),
                  );
                },
                child: Text('Go to payment'),
              ),
              //card

            ],
          )
      ),
    );
  }
}