import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});


  void openLocationSearchBox(BuildContext context){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Your location'),
          content: TextField(
            decoration: InputDecoration(hintText: 'Search address...'),
          ),
          actions: [
            //cancel button:
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),

            //save button:
            MaterialButton(
                onPressed: ()=> Navigator.pop(context),
                child: Text('Save'),
            ),
          ],

        ),
    );


  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Deliver Now!', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          GestureDetector(
              onTap: ()=> openLocationSearchBox(context),
              child: Row(
                children: [
                  //address
                  Text(
                      'Itabashi, 34/7 Tokyo',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold)),

                  //drop down menu
                  Icon(Icons.keyboard_arrow_down_rounded),
                ],
              ),
          )
        ],
      )
    );
  }
}
