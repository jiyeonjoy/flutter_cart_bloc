import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_cart_bloc/item.dart';

// 카트에 사용하는 이벤트 정의 - 상태 정의할때 enum 사용(상태 제한 기능)
enum CartEventType {
  add, remove
}

class CartEvent {
  final CartEventType type;
  final Item item;

  CartEvent(this.type, this.item);
}


class CartBloc extends Bloc<CartEvent, List<Item>> {
  List<Item> items = [];

  // 초기값
  @override
  List<Item> get initialState => [];

  // 이벤트 발생 시 어떻게 할 지 작성 해준다.
  // async* 뜻 Stream 형태로 계속 방출한다는 뜻임.
  // yield 현재 상태를 스트림으로 계속 전달한 다는 뜻임. - 이벤트 발생할 때마다
  @override
  Stream<List<Item>> mapEventToState(CartEvent event) async* {
    switch(event.type) {
      case CartEventType.add:
        items.add(event.item);
        break;
      case CartEventType.remove:
        items.remove(event.item);
        break;
    }
    yield items;
  }
}