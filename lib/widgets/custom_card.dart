import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:store/models/product_model.dart';

import '../pages/update_product_page.dart';

class CustomCard extends StatelessWidget {
  final ProductModel product;

  const CustomCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProductPage.routeName);
      },
      child: Stack(
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
                      product.title.substring(0,10),
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
                          r'$' + product.price.toString(),
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
              product.image,
              height: 15.h,
              width: 35.w,
            ),
          ),
        ],
      ),
    );
  }
}
