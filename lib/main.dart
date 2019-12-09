import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart_bloc/bloc/cart_bloc.dart';
import 'package:flutter_cart_bloc/bloc/cart_provider.dart';
import 'package:flutter_cart_bloc/catalog.dart';
import 'package:bloc/bloc.dart';

void main() => runApp(MyApp());

// 최상위에서 선언 해줘야됨.
// 최상단에 선언해서 다른 다트파일에서도 쓰는데
// 다른 모든 라이브러리에서는 이렇게 구현하지 않고 전달하는 형식임.
// final cartBloc = CartBloc();

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CartProvider(
      child: MaterialApp(
        title: 'Flutter Code Sample for material.Scaffold',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Enter'),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Catalog()));
            }),
      ),
    );
  }
}
