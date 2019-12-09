import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart_bloc/bloc/cart_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_cart_bloc/bloc/cart_provider.dart';
import 'bloc/cart_bloc.dart';
import 'item.dart';
import 'main.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
 
  @override
  Widget build(BuildContext context) {

    CartBloc cartBloc = CartProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: StreamBuilder(
        stream: cartBloc.cartList,
          builder: (context, snapshot) {
            var sum = 0;
            if (snapshot.data.length > 0) {
              // 누적되서 더한다는 뜻임.
              sum = snapshot.data.map((item) => item.price).reduce((x, y) => x + y);
            }
            return Center(
              child: Text('합계 : $sum'),
            );
          })
      );
  }
}
