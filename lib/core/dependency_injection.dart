import 'package:dime/controllers/consultant/blog/my_blog_controller.dart';
import 'package:get/get.dart';
import '../controllers/auth/change_password_controller.dart';
import '../controllers/auth/forget_password_controller.dart';
import '../controllers/auth/signIn_controller.dart';
import '../controllers/auth/sign_up_controller.dart';

import '../controllers/consultant/appointment_history_controller.dart';
import '../controllers/consultant/blog/upload_blog_controller.dart';
import '../controllers/consultant/info/Personal_information_controller.dart';
import '../controllers/consultant/info/added_experience_controller.dart';
import '../controllers/consultant/info/availability_controller.dart';
import '../controllers/consultant/info/identification_controller.dart';
import '../controllers/consultant/info/professional_qualifications_controller.dart';
import '../controllers/consultant/patients_details/patients_details_controller.dart';
import '../controllers/consultant/patients_info/appointment_list_controller.dart';
import '../controllers/consultant/patients_info/doctor_home_controller.dart';
import '../controllers/consultant/patients_info/patients_list_controller.dart';
import '../controllers/consultant/profile/doctor_profile.dart';
import '../controllers/user/Booking/Book_appointment_controller.dart';
import '../controllers/user/Booking/Booking_details_controller.dart';
import '../controllers/user/Booking/ambulance_booking_controller.dart';
import '../controllers/user/Booking/home_care_controller.dart';
import '../controllers/user/Booking/lab_booking_controller.dart';
import '../controllers/user/Booking/my_booking_controller.dart';
import '../controllers/user/category_list_controller.dart';
import '../controllers/user/health_rocords_controller.dart';
import '../controllers/user/home_controller.dart';
import '../controllers/user/message_controller.dart';
import '../controllers/user/notifications_controller.dart';
import '../controllers/user/payment/payment_controller.dart';
import '../controllers/user/payment/select_payment_method_controller.dart';
import '../controllers/user/profile_controller.dart';
import '../controllers/user/send_review_controller.dart';
import '../controllers/user/setting_controller.dart';


class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => HomeControllerPatients(), fenix: true);
    Get.lazyPut(() => BookAppointmentController(), fenix: true);
    Get.lazyPut(() => MyBookingController(), fenix: true);
    Get.lazyPut(() => MessageController(), fenix: true);
    Get.lazyPut(() => SendReviewController(), fenix: true);
    Get.lazyPut(() => LabBookingController(), fenix: true);
    Get.lazyPut(() => HomeCareController(), fenix: true);
    Get.lazyPut(() => AmbulanceBookingController(), fenix: true);
    Get.lazyPut(() => NotificationsController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => HealthRecordController(), fenix: true);
    Get.lazyPut(() => SettingController(), fenix: true);
    Get.lazyPut(() => PersonalInformationController(), fenix: true);
    Get.lazyPut(() => ProfessionalQualificationsController(), fenix: true);
    Get.lazyPut(() => AddedExperienceController(), fenix: true);
    Get.lazyPut(() => AvailabilityController(), fenix: true);
    Get.lazyPut(() => IdentificationController(), fenix: true);
    Get.lazyPut(() => DoctorHomeController(), fenix: true);
    Get.lazyPut(() => PatientsListController(), fenix: true);
    Get.lazyPut(() => AppointmentListController(), fenix: true);
    Get.lazyPut(() => PatientsDetailsController(), fenix: true);
    Get.lazyPut(() => DoctorProfileController(), fenix: true);
    Get.lazyPut(() => AppointmentHistoryController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => CategoryListController(), fenix: true);
    Get.lazyPut(() => SelectPaymentMethodController(), fenix: true);
    Get.lazyPut(() => PaymentController(), fenix: true);
    Get.lazyPut(() => BookingDetailsController(), fenix: true);
    Get.lazyPut(() => UploadBlogController(), fenix: true);
    Get.lazyPut(() => MyBlogController(), fenix: true);
    Get.lazyPut(() => ChangePasswordController(), fenix: true);
  }
}
