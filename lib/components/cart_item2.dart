import 'package:fa_71/models/cart2.dart';
import 'package:fa_71/models/shoe2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem2 extends StatefulWidget {
  Shoe shoe;
  CartItem2({
    super.key,
    required this.shoe,
  });

  @override
  State<CartItem2> createState() => _CartItem2State();
}

class _CartItem2State extends State<CartItem2> {

  //remove from cart:
  void removeItemFromCart(){
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(6),
      ),
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath,),
        title: Text(widget.shoe.name),
        subtitle: Text('\￥' + widget.shoe.price),
        trailing: IconButton(
          icon:Icon(Icons.delete),
          onPressed: removeItemFromCart,
        ),
      ),
    );
  }
}
