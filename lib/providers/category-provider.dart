import 'package:clickoncustomer/interfaces/category-interface.dart';
import 'package:flutter/cupertino.dart';

import '../models/category.dart';

class CategoryProvider extends ChangeNotifier {
  List<Categories>? categoriesList;
  Future<List<Categories>?> fetchCategory() async {
    categoriesList = await CategoryInterface.fetchCategory();
    notifyListeners();
    return categoriesList ?? [];
  }

}
