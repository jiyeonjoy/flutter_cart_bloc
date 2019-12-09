import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_cart_bloc/item.dart';
// flutter_bloc 라이브러리에 rxdart 있음.
import 'package:rxdart/rxdart.dart';


// 카트에 사용하는 이벤트 정의 - 상태 정의할때 enum 사용(상태 제한 기능)
enum CartEventType {
  add, remove
}

class CartEvent {
  final CartEventType type;
  final Item item;

  CartEvent(this.type, this.item);
}


class CartBloc {
  final itemList = [
    Item('맥북', 2000000),
    Item('생존코딩', 32000),
    Item('수학책', 5000),
    Item('새우깡', 1500),
    Item('맥북 파우치', 50000),
  ];

  // 카트리스트 누적되고
  final _cartList = List<Item>();

  // 카트리스트에 누적된 것이 들어옴.
  final _cartListSubject = BehaviorSubject<List<Item>>.seeded([]);

  // 카트리스트에 누적된 것이 들어와서 빠져나감.
  Stream<List<Item>> get cartList => _cartListSubject.stream;

  void add(CartEvent event) {
    switch(event.type) {
      case CartEventType.remove:
        _cartList.remove(event.item);
        break;
      case CartEventType.add:
        _cartList.add(event.item);
        break;
    }
    _cartListSubject.add(_cartList);
  }
}