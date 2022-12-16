import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:store/models/product_model.dart';

class CustomCard extends StatefulWidget {
  final ProductModel product;

  const CustomCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isFavourite = false;

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
                horizontal: 3.w,
                vertical: 2.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title.substring(0,9),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$' + widget.product.price.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                        ),
                      ),
                      IconButton(
                        icon: isFavourite ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ) : const Icon(
                          Icons.favorite_border,
                        ),
                        onPressed: (){
                          isFavourite = !isFavourite;
                          setState(() {});
                        },
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
          bottom: 15.h,
          child: Image.network(
            widget.product.image,
            height: 15.h,
            width: 35.w,
          ),
        ),
      ],
    );
  }
}
