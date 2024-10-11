import 'package:fa_71/components/shoe_tile2.dart';
import 'package:fa_71/models/api.dart';
import 'package:fa_71/models/cart2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage2 extends StatefulWidget {
  const ShopPage2({super.key});

  @override
  State<ShopPage2> createState() => _ShopPage2State();
}

class _ShopPage2State extends State<ShopPage2> {
  @override
  void initState() {
    super.initState();

    // Fetch the courses when the widget is initialized
    Provider.of<Cart>(context, listen: false).fetchCourses();
  }


  //add shoe to cart
  void addCourseToCart(Course course){
    Provider.of<Cart>(context, listen: false).addItemToCart(course);

    //alert user, course successfully added to cart
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Successfully added!'),
          content: Text('Check your cart!'),
        ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder:(context, cart, child)=> Padding(
          padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
          child: Column(
            children: [
              //search bar
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(9)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const[
                    Text(
                      'Search your favorite course!',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ],
                ),

              ),

              //message
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                  child: Text(
                    '45Learn Programming. Here you can learn popular programming languages. Buy now.',
                    style: TextStyle(color: Colors.grey[600]),
                  )
              ),
              //hot picks
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Hot picks',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),

              ),
              SizedBox(height:10),

              Expanded(
                  child: ListView.builder(
                    itemCount: cart.getCourseList().length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      //create a shoe
                      // Shoe2 shoeDisplay = Shoe2(
                      //     name: 'Air Jordan',
                      //     price: '40000',
                      //     imagePath:'lib/images/two.png',
                      //     description: 'Lorem Ipsum',
                      // );
                      Course course = cart.getCourseList()[index];
                      return ShoeTile2(
                        course: course,
                        onTap: ()=> addCourseToCart(course),
                      );
                    },
                  )
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 25, right:25),
                child: Divider(
                  color: Colors.white,
                ),
              ),


            ],
          ),
        ),
    );
  }
}
