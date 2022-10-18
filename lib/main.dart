import 'package:flutter/material.dart';

import 'ui/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Shop',
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.deepOrange,
        ),
      ),
      // home: SafeArea(
      //   child: ProductDetailScreen(ProductsManager().items[0],),
      // ),
      home: const SafeArea(
        child: ProductsOverviewScreen(),
        // child: UserProducScreen(),
        // child: CartScreen(),
        // child: OrderScreen(),
      ),
      // home: const ProductsOverviewScreen(),
      routes: {
        CartScreen.routeName: (ctx) => const CartScreen(),
        OrderScreen.routeName: (ctx) => const OrderScreen(),
        UserProductScreen.routeName: (context) => const UserProductScreen()
      },
      onGenerateRoute: (settings) {
        if (settings.name == ProductDetailScreen.routeName) {
          final productId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (ctx) {
              return ProductDetailScreen(
                ProductsManager().findById(productId),
              );
            },
          );
        }
        return null;
      },
    );
  }
}
