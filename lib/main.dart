import 'package:flutter/material.dart';
import 'package:loja/models/cart.dart';
import 'package:loja/models/order_list.dart';
import 'package:loja/models/product_list.dart';
import 'package:loja/pages/cart_page.dart';
import 'package:loja/pages/orders_page.dart';
import 'package:loja/pages/product_detail_page.dart';
import 'package:loja/pages/product_form_page.dart';
import 'package:loja/pages/products_overview_page.dart';
import 'package:loja/pages/products_page.dart';
import 'package:provider/provider.dart';

import 'utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
      ],
      child: MaterialApp(
        title: 'Loja',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.purple,
            secondary: Colors.deepOrange,
            onError: Colors.red,
          ),
          appBarTheme: const AppBarTheme(
              color: Colors.indigo,
              shadowColor: Colors.blueGrey,
              elevation: 5,
              foregroundColor: Colors.white),
          useMaterial3: true,
        ),
        //home: const ProductsOverviewPage(),
        routes: {
          AppRoutes.home: (ctx) => const ProductsOverviewPage(),
          AppRoutes.productDetail: (ctx) => const ProductDetailPage(),
          AppRoutes.cart: (ctx) => const CartPage(),
          AppRoutes.orders: (ctx) => const OrdersPage(),
          AppRoutes.products: (ctx) => const ProductsPage(),
          AppRoutes.productForm: (ctx) => const ProductFormPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
