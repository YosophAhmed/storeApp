import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';
import 'package:store/services/update_product.dart';
import 'package:store/widgets/custom_button.dart';
import 'package:store/widgets/custom_text_form_field.dart';

import '../models/product_model.dart';
import '../widgets/show_snackbar.dart';

class UpdateProductPage extends StatefulWidget {
  static const String routeName = 'UpdateProductPage';


  UpdateProductPage({Key? key}) : super(key: key);

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String name = '';
  String description = '';
  String image = '';
  String price = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                    price = data;
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
                    isLoading = true;
                    setState(() {});
                    try {
                      UpdateProductService().updateProduct(
                        title: name,
                        price: price,
                        description: description,
                        image: image,
                        category: product.category,
                      );
                      showSnackBar(
                        context: context,
                        message: 'Product Updated',
                      );
                    } catch (error) {
                      showSnackBar(
                        context: context,
                        message: error.toString(),
                      );
                    }
                    isLoading = false;
                    setState(() {});
                  },
                  label: 'Update',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
