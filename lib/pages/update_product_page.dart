import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:store/widgets/custom_button.dart';
import 'package:store/widgets/custom_text_form_field.dart';

class UpdateProductPage extends StatelessWidget {
  static const String routeName = 'UpdateProductPage';

  const UpdateProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Product',
          style: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTextFormField(
              hintText: 'Product Name',
            ),
            SizedBox(
              height: 2.h,
            ),
            const CustomTextFormField(
              hintText: 'Description',
            ),
            SizedBox(
              height: 2.h,
            ),
            const CustomTextFormField(
              hintText: 'Price',
            ),
            SizedBox(
              height: 2.h,
            ),
            const CustomTextFormField(
              hintText: 'Image',
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomButton(
              onTap: () {

              },
              label: 'Update',
            ),
          ],
        ),
      ),
    );
  }
}
