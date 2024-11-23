
import 'package:get/get.dart';
import '../../../core/app_routes.dart';
import '../../../helpers/other_helper.dart';
import '../../../services/api_service.dart';
import '../../../utils/app_url.dart';
import '../../../utils/app_utils.dart';

class IdentificationController extends GetxController {
  String? certification;
  String? passport;
  bool isLoading = false;

  openCertification() async {
    certification = await OtherHelper.openGallery();
    update();
  }

  openPassport() async {
    passport = await OtherHelper.openGallery();
    update();
  }

  updateProfileRepo() async {
    isLoading = true;
    update();
    var files = [
      {"name": "identityImage", "file": passport},
      {"name": "certificateImage", "file": certification},
    ];

    var response = await ApiService.multipartRequest(
        url: AppUrls.user, method: "PUT", files: files);

    if (response.statusCode == 200) {
      Get.toNamed(AppRoutes.reviewScreen);
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }
}
