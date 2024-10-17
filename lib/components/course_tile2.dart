import 'package:fa_71/models/api.dart';
import 'package:fa_71/pages/course_detail.dart';
import 'package:flutter/material.dart';

class CourseTile2 extends StatelessWidget {
  final Course course;
  void Function()? onTap;
  final bool isAddedToCart;

  // Constructor to receive the course and onTap function
  CourseTile2({
    super.key,
    required this.course,
    required this.onTap,
    required this.isAddedToCart,  // Track whether it's added to cart
  });

  // Function to get the first 'n' words from a string
  String getShortDescription(String text, int wordLimit) {
    List<String> words = text.split(' ');
    if (words.length > wordLimit) {
      return words.sublist(0, wordLimit).join(' ') + '...'; // Add ellipsis if the text is longer
    } else {
      return text; // Return full text if less than wordLimit
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 25),
        width: 285,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CourseDetailScreen(course: course), // Pass the course data
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 285,  // Set your desired width
                  height: 160, // Set your desired height
                  child: course.image != null
                      ? Image.network(
                    course.image!, // Use the API image URL
                    fit: BoxFit.cover, // Adjust how the image fits the box
                  )
                      : Image.asset(
                    'lib/images/default.png', // Use a placeholder if no image is available
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          
              //description
              Padding(
                padding: EdgeInsets.symmetric(horizontal:20,vertical: 10),
                child: Text(
                  getShortDescription(course.description, 30), // Display first 50 words
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
          
              //price + details
          
              Padding(
                padding: EdgeInsets.only(left: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //shoe name:
                        Text(
                            course.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                        ),
                        // Text(
                        //   'Instructor Name: '+ course.instructor.name,
                        //   style: TextStyle(
                        //       color: Colors.grey
                        //   ),
                        // ),
                        SizedBox(height:7),
                        //price
                        Text(
                            '\￥'+ course.price,
                            style: TextStyle(
                              color: Colors.grey
                            ),
                        ),
                        SizedBox(height:7),
                        //price
          
          
                      ],
                    ),
                    //plus button
                    GestureDetector(
                      //onTap: isAddedToCart ? null : onTap, // Disable button if added
                      onTap: onTap,
                      child: Container(
                        padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: isAddedToCart ? Colors.grey
          
          
                                  : Colors.black, // Change color when disabled
                              // color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomRight:Radius.circular(12),
                              )
                          ),
                          child: Icon(Icons.add, color: Colors.white,),
                      ),
                    )
                  ],
                ),
              )
            ],
            //button to add to cart
          ),
        ),
      ),
    );
  }
}



//https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg