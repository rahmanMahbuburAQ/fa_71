import 'package:fa_71/components/cart_item2.dart';
import 'package:fa_71/models/api.dart';
import 'package:fa_71/models/cart2.dart';
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
              Course getCourseData = value.getUserCart()[index];

              //return the cart item:
              return CartItem2(course: getCourseData);

                },
              ),
            ),
            //SizedBox(height: 100,),

            // Display total price
            Column(
              mainAxisSize: MainAxisSize.min, // Adjusts column size to fit children
              children: [
                Text(
                  'Total \￥${value.getTotalPrice().toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4), // Adds some spacing between texts
                // Text(
                //   '\￥${value.getTotalPrice().toStringAsFixed(2)}',
                //   style: const TextStyle(
                //     fontSize: 16,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ],
            ),

            Center(
              child: ElevatedButton(
                onPressed: value.getTotalPrice() > 0 ? ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(),
                    ),
                  );
                }
                : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: value.getTotalPrice() > 0 ? Colors.blue : Colors.grey, // Change color when disabled
                  foregroundColor: Colors.white, // Text color
                  padding: const EdgeInsets.symmetric(horizontal: 124, vertical: 15), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2), // Rounded corners
                  ),
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Checkout',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

//Center(child: Text('Cart page')