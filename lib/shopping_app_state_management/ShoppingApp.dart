
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_playground/shopping_app_state_management/models/cart.dart';
import 'package:flutter_playground/shopping_app_state_management/screens/Login.dart';
import 'package:flutter_playground/shopping_app_state_management/screens/MyCart.dart';
import 'package:flutter_playground/shopping_app_state_management/screens/MyCatalog.dart';

import 'models/catalog.dart';

class ShoppingAppExample extends StatelessWidget {
  const ShoppingAppExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.
        Provider(create: (context) => CatalogModel()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
            create: (context) => CartModel(),
            update: (context, catalog, cart) {
              if (cart == null) ArgumentError.notNull('Cart');
              cart?.catalog = catalog;
              return cart!;
            }
        )
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/' : (context) => const Login(),
          '/catalog' : (context) => const MyCatalog(),
          '/cart' : (context) => const MyCart()
        },
      ),
    );
  }
}

final appTheme = ThemeData(
  primarySwatch: Colors.green,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Corben',
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.black,
    ),
  ),
);
