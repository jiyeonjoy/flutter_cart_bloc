import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart_bloc/bloc/cart_bloc.dart';
import 'package:flutter_cart_bloc/cart.dart';
import 'package:flutter_cart_bloc/item.dart';

import 'main.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Catalog'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.archive),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Cart()));
              },
            )
          ],
        ),
        body: StreamBuilder(
            stream: cartBloc.cartList,
            builder: (context, snapshot) {
              return ListView(
                children: cartBloc.itemList
                    .map((item) => _buildItem(item, snapshot.data))
                    .toList(),
              );
            }));
  }

  Widget _buildItem(Item item, List state) {
    final isChecked = state.contains(item);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          item.title,
          style: TextStyle(fontSize: 31.0),
        ),
        subtitle: Text(
          // int 이기 때문에 String 으로 하기 위해 '${}' 해준 것임.
          '${item.price}',
        ),
        // 오른쪽 끝에 생성됨.
        trailing: IconButton(
            icon: isChecked
                ? Icon(
                    Icons.check,
                    color: Colors.red,
                  )
                : Icon(Icons.check),
            onPressed: () {
              setState(() {
                if (isChecked) {
                  cartBloc.add(CartEvent(CartEventType.remove, item));
                } else {
                  cartBloc.add(CartEvent(CartEventType.add, item));
                }
              });
            }),
      ),
    );
  }
}
