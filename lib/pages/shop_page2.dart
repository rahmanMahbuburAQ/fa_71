import 'package:fa_71/components/course_tile2.dart';
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
  String searchQuery = ''; // Variable to hold the search query

  @override
  void initState() {
    super.initState();
    // Fetch the courses when the widget is initialized
    Provider.of<Cart>(context, listen: false).fetchCourses();
  }

  // Add course to cart and disable the "+" button for that course
  void addCourseToCart(Course course) {
    Provider.of<Cart>(context, listen: false).addItemToCart(course);

    // Alert user, course successfully added to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Successfully added!'),
        content: Text('Check your cart!'),
      ),
    );

    // Close the dialog after 1 second
    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pop(); // Close the dialog
    });
  }



  // Function to filter courses based on the search query
  List<Course> filterCourses(List<Course> courses) {
    if (searchQuery.isEmpty) {
      return courses; // Return all courses if search query is empty
    }
    return courses.where((course) {
      final lowerCaseQuery = searchQuery.toLowerCase();
      return course.language.toLowerCase().contains(lowerCaseQuery) ||
          course.description.toLowerCase().contains(lowerCaseQuery);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        // Get filtered courses based on search query
        List<Course> filteredCourses = filterCourses(cart.getCourseList());

        return Padding(
          padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
          child: Column(
            children: [
              // Search bar
              Container(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(9),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value; // Update the search query
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search your favorite course!',
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),

              // Message
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Text(
                  'Learn Programming. Here you can learn popular programming languages. Buy now.',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),

              // Hot picks section
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
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Courses List
              Expanded(
                child: ListView.builder(
                  itemCount: filteredCourses.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // Get the current course
                    Course course = filteredCourses[index];

                    return CourseTile2(
                      course: course,
                      onTap: cart.isCourseAdded(course.id)
                          ? null // Disable if already added to cart
                          : () => addCourseToCart(course), // Add to cart otherwise
                      isAddedToCart: cart.isCourseAdded(course.id), // Pass whether it's added to cart
                    );
                  },
                ),
              ),

              // Padding(
              //   padding: EdgeInsets.only(top: 20, left: 25, right: 25),
              //   child: Divider(
              //     color: Colors.white,
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}



