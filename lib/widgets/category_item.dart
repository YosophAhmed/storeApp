import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  Function() onTap;

  CategoryItem({
    Key? key,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 40,
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              offset: const Offset(10, 10),
            ),
          ],
        ),
        child: Card(
          elevation: 6,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 3.w,
              vertical: 2.h,
            ),
            child: Center(
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
