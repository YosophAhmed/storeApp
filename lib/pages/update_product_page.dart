import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:store/widgets/custom_button.dart';
import 'package:store/widgets/custom_text_form_field.dart';

class UpdateProductPage extends StatelessWidget {
  static const String routeName = 'UpdateProductPage';

  String name = '';
  String description = '';
  String image = '';
  int price = 0;

  UpdateProductPage({Key? key}) : super(key: key);

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                hintText: 'Product Name',
                onChanged: (data) {
                  name = data;
                },
              ),
              SizedBox(
                height: 2.h,
              ),
               CustomTextField(
                hintText: 'Description',
                onChanged: (data) {
                  description = data;
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                hintText: 'Price',
                onChanged: (data) {
                  price = int.parse(data);
                },
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                hintText: 'Image',
                onChanged: (data) {
                  image = data;
                },
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
      ),
    );
  }
}
