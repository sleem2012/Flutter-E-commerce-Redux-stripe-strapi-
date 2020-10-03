import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Pages/register_page.dart';
import 'package:flutter_ecommerce/models/app_state.dart';
import 'package:flutter_ecommerce/redux/actions.dart';
import 'package:flutter_ecommerce/redux/reducers.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'Pages/login_page.dart';
import 'Pages/products_page.dart';

void main() {
  final store=Store<AppState>(appReducer, initialState: AppState.initial(),middleware: [thunkMiddleware]);
  runApp(MyApp(store :store));
}

class MyApp extends StatelessWidget {
  final Store<AppState>store;
 
  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: 'Flutter E-commerce',
        routes: {
          '/products': (BuildContext context) => ProductsPage(onInit: (){
            //dispatch an actions (getUserActions) to grab user data
            StoreProvider.of<AppState>(context).dispatch(getUserAction);

          },),
          '/login': (BuildContext context) => LoginPage(),
          '/register': (BuildContext context) => RegisterPage(),
        },
        theme: ThemeData(
            brightness: Brightness.dark,
            textTheme: TextTheme(
              headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              body1: TextStyle(fontSize: 18),
            ),
            primaryColor: Colors.cyan[400],
            accentColor: Colors.deepOrange[200]),
        home: LoginPage(),
      ),
    );
  }
}
