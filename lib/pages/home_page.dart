import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:store/pages/jewelery_page.dart';
import 'package:store/pages/mens_clothing_page.dart';
import 'package:store/pages/womens_clothing_page.dart';
import '../models/product_model.dart';
import '../services/all_categories_service.dart';
import '../services/all_products_service.dart';
import '../widgets/category_item.dart';
import '../widgets/custom_card.dart';
import 'electronics_page.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'HomePage';
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Function()> function = [
      () {
        Navigator.pushNamed(
          context,
          ElectronicsPage.routeName,
          arguments: AllCategoriesService.categoryName[0],
        );
      },
      () {
        Navigator.pushNamed(
          context,
          JeweleryPage.routeName,
          arguments: AllCategoriesService.categoryName[1],
        );
      },
      () {
        Navigator.pushNamed(
          context,
          MenClothingPage.routeName,
          arguments: AllCategoriesService.categoryName[2],
        );
      },
      () {
        Navigator.pushNamed(
          context,
          WomenClothingPage.routeName,
          arguments: AllCategoriesService.categoryName[3],
        );
      },
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Shopping',
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
              color: Colors.grey,
              size: 24.sp,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 3.h,
              ),
              child: Text(
                'All Categories',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 40.h,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.h,
                ),
                child: FutureBuilder<List<dynamic>>(
                  future: AllCategoriesService().getAllCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<dynamic> category = snapshot.data!;
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2,
                          mainAxisSpacing: 3.h,
                          crossAxisSpacing: 4.w,
                        ),
                        itemBuilder: (context, index) => CategoryItem(
                          name: category[index],
                          onTap: function[index],
                        ),
                        itemCount: category.length,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h,),
              child: Text(
                'All Products',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 100.h,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 4.w,
                  right: 4.w,
                  top: 25.h,
                  bottom: 10.h,
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
                          mainAxisSpacing: 15.h,
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
            ),
          ],
        ),
      ),
    );
  }
}
