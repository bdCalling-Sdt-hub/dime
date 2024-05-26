import 'package:get/get.dart';

import '../../../core/app_routes.dart';

class DoctorProfileController extends GetxController {
  List info = [
    "Personal Information",
    "Professional Qualification",
    "Experience Details",
    "Availability"
  ];

  List routeScreen = [
    AppRoutes.personalInformation,
    AppRoutes.professionalQualifications,
    AppRoutes.addedExperience,
    AppRoutes.availability
  ];

  String selectedInfo = "Edit Information";

  selectLanguage(int index) {
    Get.back();
    String selectedInfo = info[index];

    Get.toNamed(routeScreen[index], parameters: {"type": "back"});

    print(selectedInfo);
    update();
  }
}
