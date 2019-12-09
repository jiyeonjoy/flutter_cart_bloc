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
            onPressed: () {

            },
          )
        ],
      ),
      body: ListView(
        // 리스트뷰 아이템을 받아서 빌드 해준다는 것임.
        // toList() 해줘야 다시 children 에 들어감
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
        ),
        subtitle: Text(
          // int 이기 때문에 String 으로 하기 위해 '${}' 해준 것임.
          '${item.price}',
        ),
        // 오른쪽 끝에 생성됨.
        trailing: IconButton(icon: Icon(Icons.check), onPressed: () {}),
      ),
    );
  }
}
