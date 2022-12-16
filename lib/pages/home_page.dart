import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:store/pages/jewelery_page.dart';
import 'package:store/pages/mens_clothing_page.dart';
import 'package:store/pages/womens_clothing_page.dart';
import '../services/all_categories_service.dart';
import '../widgets/category_item.dart';
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
        );
      },
      () {
        Navigator.pushNamed(
          context,
          JeweleryPage.routeName,
        );
      },
      () {
        Navigator.pushNamed(
          context,
          MenClothingPage.routeName,
        );
      },
      () {
        Navigator.pushNamed(
          context,
          WomenClothingPage.routeName,
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
      body: Padding(
        padding: EdgeInsets.only(
          left: 4.w,
          right: 4.w,
          top: 15.h,
          bottom: 10.h,
        ),
        child: FutureBuilder<List<dynamic>>(
          future: AllCategoriesService().getAllCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic> category = snapshot.data!;
              return GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  mainAxisSpacing: 4.h,
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
    );
  }
}
