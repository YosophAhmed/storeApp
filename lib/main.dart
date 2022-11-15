import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType){
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(),
          );
        },
    );
  }
}
