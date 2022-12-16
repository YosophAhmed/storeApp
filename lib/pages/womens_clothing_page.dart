import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../models/product_model.dart';
import '../services/product_by_category_service.dart';
import '../widgets/custom_card.dart';

class WomenClothingPage extends StatelessWidget {
  static const String routeName = 'WomenClothingPage';

  const WomenClothingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Women\'s Clothing',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 24.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.grey,
              size: 24.sp,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 4.w,
          right: 4.w,
          top: 15.h,
          bottom: 10.h,
        ),
        child: FutureBuilder<List<ProductModel>>(
          future: ProductByCategoryService().getCategoryProducts(
            categoryName: ModalRoute.of(context)!.settings.arguments as String,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  mainAxisSpacing: 20.h,
                  crossAxisSpacing: 2.w,
                ),
                itemBuilder: (context, index) => CustomCard(
                  product: products[index],
                ),
                itemCount: products.length,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
