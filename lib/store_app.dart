import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:store/pages/home_page.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            HomePage.routeName: (context) => const HomePage(),
          },
          initialRoute: HomePage.routeName,
        );
      },
    );
  }
}
