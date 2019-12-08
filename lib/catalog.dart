import 'package:flutter/material.dart';
import 'package:flutter_cart_bloc/item.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List<Item> _itemList = itemList;

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: _itemList.map((item) => _buildItem(item)).toList(),
      ),
    );
  }

  Widget _buildItem(Item item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
          title: Text(
        item.title,
        style: TextStyle(fontSize: 31.0),
      )),
    );
  }
}
