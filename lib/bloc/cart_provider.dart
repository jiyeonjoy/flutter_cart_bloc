import 'package:flutter/widgets.dart';
import 'package:flutter_cart_bloc/bloc/cart_bloc.dart';

class CartProvider extends InheritedWidget {
  final CartBloc cartBloc;

  // 생성자인데 모든 파라미터 옵셔널. 단, 카트블록이 널이면 카트블록 무조건 생성되게 함.
  CartProvider({Key key, CartBloc cartBloc, Widget child})
      : cartBloc = cartBloc ?? CartBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return null;
  }

  // CartBloc 을 얻을 수 있음.
  static CartBloc of(BuildContext context) =>
      // inheritFrom... 타입 검사하는 것임.
      // CartProvider 로 캐스팅 을 하고 같은 컨텍스트라면 cartBloc 을 얻는 것임.
      (context.inheritFromWidgetOfExactType(CartProvider) as CartProvider).cartBloc;
}
