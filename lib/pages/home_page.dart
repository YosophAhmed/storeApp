import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:store/models/product_model.dart';
import '../services/all_products_service.dart';
import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'New Trend',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
              size: 24.sp,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 4.w,
          right: 4.w,
          top: 12.h,
        ),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductsService().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  mainAxisSpacing: 13.h,
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
