import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart_bloc/bloc/cart_bloc.dart';
import 'package:flutter_cart_bloc/item.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List<Item> _itemList = itemList;

  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Catalog'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.archive),
              onPressed: () {},
            )
          ],
        ),
        body: BlocProvider(
          builder: (context) => CartBloc(),
          child: BlocBuilder(
              bloc: _cartBloc,
              builder: (BuildContext context, List state) {
                return ListView(
                  // 리스트뷰 아이템을 받아서 빌드 해준다는 것임.
                  // toList() 해줘야 다시 children 에 들어감
                  children: _itemList.map((item) => _buildItem(item, state, _cartBloc)).toList(),
                );
              }),
        ));
  }

  Widget _buildItem(Item item, List state, CartBloc cartBloc) {
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
            icon: isChecked ? Icon(Icons.check, color: Colors.red,
            ) : Icon(Icons.check),
            onPressed: () {
             setState(() {
               if(isChecked) {
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
