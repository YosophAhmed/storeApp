import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:store/pages/all_products_page.dart';
import 'package:store/pages/electronics_page.dart';
import 'package:store/pages/home_page.dart';
import 'package:store/pages/jewelery_page.dart';
import 'package:store/pages/mens_clothing_page.dart';
import 'package:store/pages/womens_clothing_page.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            HomePage.routeName: (context) => HomePage(),
            AllProductsPage.routeName: (context) => const AllProductsPage(),
            ElectronicsPage.routeName: (context) => const ElectronicsPage(),
            JeweleryPage.routeName: (context) => const JeweleryPage(),
            MenClothingPage.routeName: (context) => const MenClothingPage(),
            WomenClothingPage.routeName: (context) => const WomenClothingPage(),
          },
          initialRoute: HomePage.routeName,
          theme: ThemeData(
            fontFamily: 'Unbounded',
            primarySwatch: Colors.grey,
          ),
        );
      },
    );
  }
}
