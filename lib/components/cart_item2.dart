import 'package:fa_71/models/api.dart';
import 'package:fa_71/models/cart2.dart';
import 'package:fa_71/models/cart2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem2 extends StatefulWidget {
  final Course course;

  CartItem2({
    super.key,
    required this.course,
  });

  @override
  State<CartItem2> createState() => _CartItem2State();
}

class _CartItem2State extends State<CartItem2> {

  // Remove from cart:
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.course);
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
        leading: widget.course.image != null
            ? Image.network(widget.course.image!)
            : Icon(Icons.person),
        title: Text(widget.course.title),
        subtitle: Text('￥${widget.course.price}'),

        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: removeItemFromCart,
        ),
      ),
    );
  }
}

