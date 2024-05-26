import 'package:get/get.dart';
import '../controllers/auth/forget_password_controller.dart';
import '../controllers/auth/sign_up_controller.dart';
import '../controllers/doctor/appointment_history_controller.dart';
import '../controllers/doctor/info/Personal_information_controller.dart';
import '../controllers/doctor/info/added_experience_controller.dart';
import '../controllers/doctor/info/availability_controller.dart';
import '../controllers/doctor/info/identification_controller.dart';
import '../controllers/doctor/info/professional_qualifications_controller.dart';
import '../controllers/doctor/patients_details/patients_details_controller.dart';
import '../controllers/doctor/patients_info/appointment_list_controller.dart';
import '../controllers/doctor/patients_info/doctor_home_controller.dart';
import '../controllers/doctor/patients_info/patients_list_controller.dart';
import '../controllers/doctor/profile/doctor_profile.dart';
import '../controllers/patients/Booking/Book_appointment_controller.dart';
import '../controllers/patients/Booking/ambulance_booking_controller.dart';
import '../controllers/patients/Booking/home_care_controller.dart';
import '../controllers/patients/health_rocords_controller.dart';
import '../controllers/patients/home_controller.dart';
import '../controllers/patients/Booking/lab_booking_controller.dart';
import '../controllers/patients/message_controller.dart';
import '../controllers/patients/Booking/my_booking_controller.dart';
import '../controllers/patients/notifications_controller.dart';
import '../controllers/patients/profile_controller.dart';
import '../controllers/patients/send_review_controller.dart';
import '../controllers/patients/setting_controller.dart';

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
  }
}
