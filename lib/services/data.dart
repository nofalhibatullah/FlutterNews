import 'package:flutternews/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = CategoryModel();

  // Business
  categoryModel.categoryName = "Business";
  categoryModel.imageUrl =
      "assets/images/Business.png";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  // Entertainment
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl =
      "assets/images/Entertainment.png";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  //General
  categoryModel.categoryName = "General";
  categoryModel.imageUrl =
      "assets/images/General.png";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  // Health
  categoryModel.categoryName = "Health";
  categoryModel.imageUrl =
      "assets/images/Health.png";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  // Sports
  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl =
      "assets/images/Sports.png";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  // Science
  categoryModel.categoryName = "Science";
  categoryModel.imageUrl =
      "assets/images/Science.png";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  // Technology
  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl =
      "assets/images/Technology.png";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  return category;
}
