import 'dart:convert';
import 'package:dime/core/app_routes.dart';
import 'package:dime/models/reviews_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/api_response_model.dart';
import '../../services/api_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class SendReviewController extends GetxController {
  num totalRating = 0;
  Status status = Status.loading;

  num sendRating = 0;
  bool isLoading = false;

  ReviewModel reviewModel = ReviewModel.fromJson({});

  TextEditingController reviewController = TextEditingController();

  rating(int index) {
    num value = 0;
    if (index == 0) {
      value = reviewModel.data.attributes.fiveStarReviews;
    } else if (index == 1) {
      value = reviewModel.data.attributes.fourStarReviews;
    } else if (index == 2) {
      value = reviewModel.data.attributes.threeStarReviews;
    } else if (index == 3) {
      value = reviewModel.data.attributes.twoStarReviews;
    } else {
      value = reviewModel.data.attributes.oneStarReviews;
    }
    double percentage = (value / totalRating) * 100;
    return percentage.floor();
  }

  getReviewRepo(String id) async {
    status = Status.loading;
    update();

    var response = await ApiService.getApi("${AppUrls.avgReviews}/$id");

    if (response.statusCode == 200) {
      reviewModel = ReviewModel.fromJson(jsonDecode(response.body));
      setTotalRating();

      status = Status.completed;
      update();
    } else {
      status = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  setTotalRating() {
    totalRating = (reviewModel.data.attributes.fiveStarReviews +
        reviewModel.data.attributes.fourStarReviews +
        reviewModel.data.attributes.threeStarReviews +
        reviewModel.data.attributes.twoStarReviews +
        reviewModel.data.attributes.oneStarReviews);
  }

  Future<void> sendRatingRepo(id) async {
    isLoading = true;
    update();

    Map<String, String> body = {
      "consultant": id,
      "rating": sendRating.toString(),
      "comment": reviewController.text
    };

    var response = await ApiService.postApi(
      AppUrls.reviews,
      body,
    );

    if (response.statusCode == 200) {
      reviewController.clear();
      isLoading = false;
      update();
      Get.offNamed(AppRoutes.patientsHome, preventDuplicates: false);
    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
      isLoading = false;
      update();
    }

    isLoading = false;
    update();
  }
}
