import '../helper/api.dart';

class AllCategoriesService {
  static List<dynamic> categoryName = [];

  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products/categories',
    );
    for (int i = 0; i < data.length; i++) {
      categoryName.add(
        data[i],
      );
    }
    return data;
  }
}
