import 'package:get/get.dart';

import '../../../helpers/other_helper.dart';

class IdentificationController extends GetxController {
  String? certification;
  String? passport;

  openCertification() async {
    certification = await OtherHelper.openGallery();
    update();
  }

  openPassport() async {
    passport = await OtherHelper.openGallery();
    update();
  }
}
