
import 'package:get/get.dart';

import '../../utils/app_images.dart';

class CategoryListController extends GetxController {
  String selectedCategory = '';
  bool isLoading = false;

  List doctors = [
    {
      "name": "Katryn Murphy".tr,
      "image": AppImages.jennifar,
      "categories": "Cardiologist",
      "rating": 4.7,
      "chat": 4335,
      "price": 5000
    },
    {
      "name": "Katryn Murphy".tr,
      "image": AppImages.jennifar,
      "categories": "Cardiologist",
      "rating": 4.7,
      "chat": 4335,
      "price": 5000
    },
    {
      "name": "Katryn Murphy".tr,
      "image": AppImages.jennifar,
      "categories": "Cardiologist",
      "rating": 4.7,
      "chat": 4335,
      "price": 5000
    },
    {
      "name": "Katryn Murphy".tr,
      "image": AppImages.jennifar,
      "categories": "Cardiologist",
      "rating": 4.7,
      "chat": 4335,
      "price": 5000
    },
    {
      "name": "Katryn Murphy".tr,
      "image": AppImages.jennifar,
      "categories": "Cardiologist",
      "rating": 4.7,
      "chat": 4335,
      "price": 5000
    },
    {
      "name": "Katryn Murphy".tr,
      "image": AppImages.jennifar,
      "categories": "Cardiologist",
      "rating": 4.7,
      "chat": 4335,
      "price": 5000
    },
  ];

  selectCategory(String category) {
    isLoading = true;
    update();
    selectedCategory = category;
    update();

    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        isLoading = false;
        update();
      },
    );
  }
}
