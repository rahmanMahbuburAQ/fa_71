import 'package:fa_71/components/cart_item2.dart';
import 'package:fa_71/models/cart2.dart';
import 'package:fa_71/models/shoe2.dart';
import 'package:fa_71/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage2 extends StatefulWidget {
  const CartPage2({super.key});

  @override
  State<CartPage2> createState() => _CartPage2State();
}

class _CartPage2State extends State<CartPage2> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder:(context, value, child) => Padding(
        padding: EdgeInsets.fromLTRB(25, 40, 25, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //heading
            const Text(
              'My Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 0,),
            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index){
              //get individual shoe
              Shoe individualShoe = value.getUserCart()[index];

              //return the cart item:
              return CartItem2(shoe: individualShoe);

                },
              ),
            ),
            //SizedBox(height: 100,),
            Center(
              child: ElevatedButton(
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
                style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Background color
                      foregroundColor: Colors.white, // Text color
                      padding: EdgeInsets.symmetric(horizontal: 104, vertical: 12), // Button padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                      ),
              ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

//Center(child: Text('Cart page')