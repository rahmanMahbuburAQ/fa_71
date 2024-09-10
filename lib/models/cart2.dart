import 'package:flutter/foundation.dart';

import 'shoe2.dart';

class Cart extends ChangeNotifier{
  //list of shoes for sale:

  List<Shoe> shoeShop = [
    Shoe(
        name: 'Python Learning',
        price: '20',
        imagePath: 'lib/images/python.jpeg',
        description: 'If you’re looking for a programming language that’s flexible and easy to read, try learning Python. '
    ),
    Shoe(
        name: 'Dart Learning',
        price: '18',
        imagePath: 'lib/images/dart.png',
        description: 'If you’re looking for a programming language that’s flexible and easy to read, try learning Python. '
    ),
    Shoe(
        name: 'Swift Learning',
        price: '22',
        imagePath: 'lib/images/swift.jpg',
        description: 'If you’re looking for a programming language that’s flexible and easy to read, try learning Python. '
    ),
    Shoe(
        name: 'Javascript Learning',
        price: '30',
        imagePath: 'lib/images/js1.jpg',
        description: 'If you’re looking for a programming language that’s flexible and easy to read, try learning Python. '
    )
  ];

  //list of items in user cart
List<Shoe> userCart = [];

  // get list of shoes for sale
List<Shoe> getShoeList(){
  return shoeShop;
}

  //get cart
List<Shoe> getUserCart(){
  return userCart;
}

  //add items to cart
void addItemToCart(Shoe shoe){
  userCart.add(shoe);
  notifyListeners();
}

  //remove item from cart:
void removeItemFromCart(Shoe shoe){
  userCart.remove(shoe);
  notifyListeners();
}

}