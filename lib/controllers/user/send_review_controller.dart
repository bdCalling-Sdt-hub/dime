import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SendReviewController extends GetxController {
  List<num> ratings = [4000, 1500, 400, 0, 22];

  num totalRating = 5922;

  TextEditingController reviewController = TextEditingController();

  rating(int index) {
    double percentage = (ratings[index] / totalRating) * 100;
    print(totalRating);
    print(percentage);

    return percentage.floor();
  }
}
