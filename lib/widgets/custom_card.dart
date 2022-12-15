import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomCard extends StatelessWidget {


  const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
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
                horizontal: 5.w,
                vertical: 2.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'HandBag LV',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$225',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                        ),
                      ),
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 5.w,
          bottom: 11.h,
          child: Image.network(
            'https://m.media-amazon.com/images/I/81IbZPZhUeS._AC_SX679_.jpg',
            height: 15.h,
          ),
        ),
      ],
    );
  }
}
