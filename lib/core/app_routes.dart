import 'package:dime/view/screen/patients/payment/payment_screen.dart';
import 'package:dime/view/screen/patients/payment/select_payment_method_screen.dart';
import 'package:get/get.dart';

import '../view/screen/doctor/history/appointment_history_screen.dart';
import '../view/screen/doctor/info/added_experience_screen.dart';
import '../view/screen/doctor/info/availability_screen.dart';
import '../view/screen/doctor/info/identification_screen.dart';
import '../view/screen/doctor/info/personal_information_screen.dart';
import '../view/screen/doctor/info/professional_qualifications_screen.dart';
import '../view/screen/doctor/info/review_screen.dart';
import '../view/screen/doctor/patients_details/additional_details_screen.dart';
import '../view/screen/doctor/patients_details/patients_details_screen.dart';
import '../view/screen/doctor/patients_info/appointment_list_screen.dart';
import '../view/screen/doctor/patients_info/doctor_home_screen.dart';
import '../view/screen/doctor/patients_info/patients_list_screen.dart';
import '../view/screen/doctor/profile/doctor_profile.dart';
import '../view/screen/no_role/auth/change_password/change_password_screen.dart';
import '../view/screen/no_role/auth/forgot password/create_password.dart';
import '../view/screen/no_role/auth/forgot password/forgot_password.dart';
import '../view/screen/no_role/auth/forgot password/verify_screen.dart';
import '../view/screen/no_role/auth/sign in/sign_in_screen.dart';
import '../view/screen/no_role/auth/sign up/sign_up_screen.dart';
import '../view/screen/no_role/auth/sign up/verify_user.dart';
import '../view/screen/no_role/onboarding_screen/onboarding_screen.dart';
import '../view/screen/no_role/splash/splash_screen.dart';
import '../view/screen/patients/Booking/ambulance_booking_screen.dart';
import '../view/screen/patients/Booking/book_appointment.dart';
import '../view/screen/patients/Booking/booking_list.dart';
import '../view/screen/patients/Booking/home_care_screen.dart';
import '../view/screen/patients/Booking/lab_book.dart';
import '../view/screen/patients/Booking/my_booking_screen.dart';
import '../view/screen/patients/Booking/select_data_time.dart';
import '../view/screen/patients/Booking/select_date.dart';
import '../view/screen/patients/Booking/select_home_care_data_time.dart';
import '../view/screen/patients/categories/cotegorise_list.dart';
import '../view/screen/patients/doctor/doctor_details_screen.dart';
import '../view/screen/patients/favorite/favorite_screen.dart';
import '../view/screen/patients/health/health_records.dart';
import '../view/screen/patients/home/patients_home.dart';
import '../view/screen/patients/message/chat_screen.dart';
import '../view/screen/patients/message/message_screen.dart';
import '../view/screen/patients/notifications/notifications_screen.dart';
import '../view/screen/patients/profile/edit_profile.dart';
import '../view/screen/patients/profile/profile_screen.dart';
import '../view/screen/patients/review/send_review.dart';
import '../view/screen/patients/setting/setting_screen.dart';
import '../view/screen/test_screen.dart';

class AppRoutes {
  static const String test = "/test_screen.dart";
  static const String splash = "/splash_screen.dart";
  static const String onboarding = "/onboarding_screen.dart";
  static const String signUp = "/sign_up_screen.dart";
  static const String signIn = "/sign_in_screen.dart";
  static const String forgotPassword = "/forgot_password.dart";
  static const String verifyEmail = "/verify_screen.dart";
  static const String createPassword = "/vcreate_password.dart";
  static const String patientsHome = "/patients_home.dart";
  static const String verifyUser = "/verify_user.dart";
  static const String cotegoriseList = "/cotegorise_list.dart";
  static const String doctorDetails = "/doctor_details_screen.dart";
  static const String bookAppointment = "/book_appointment.dart";
  static const String selectDataTime = "/select_data_time.dart";
  static const String myBooking = "/my_booking_screen.dart";
  static const String chat = "/chat_screen.dart";
  static const String message = "/message_screen.dart";
  static const String sendReview = "/send_review.dart";
  static const String favorite = "/favorite_screen.dart";
  static const String labBooking = "/lab_book.dart";
  static const String selectData = "/select_date.dart";
  static const String homeCare = "/home_care_screen.dart";
  static const String selectDataHomeCare = "/select_home_care_data_time.dart";
  static const String ambulanceBooking = "/ambulance_booking_screen.dart";
  static const String notifications = "/notifications_screen.dart";
  static const String patientsProfile = "/profile_screen.dart";
  static const String editProfile = "/edit_profile.dart";
  static const String healthRecords = "/health_records.dart";
  static const String bookingList = "/booking_list.dart";
  static const String setting = "/setting_screen.dart";
  static const String changePassword = "/change_password_screen.dart";
  static const String personalInformation = "/personal_information_screen.dart";
  static const String professionalQualifications =
      "/professional_qualifications_screen.dart";
  static const String addedExperience = "/added_experience_screen.dart";
  static const String availability = "/availability_screen.dart";
  static const String identificationScreen = "/identification_screen.dart";
  static const String reviewScreen = "/review_screen.dart";
  static const String doctorHome = "/doctor_home_screen.dart";
  static const String patientsList = "/patients_list_screen.dart";
  static const String appointmentList = "/appointment_list_screen.dart";
  static const String patientsDetails = "/patients_details_screen.dart";
  static const String additionalDetails = "/additional_details_screen.dart";
  static const String doctorProfile = "/doctor_profile.dart";
  static const String appointmentHistory = "/appointment_history_screen.dart";
  static const String paymentMethod = "/select_payment_method_screen.dart";
  static const String payment = "/payment_screen.dart";

  static List<GetPage> routes = [
    GetPage(name: test, page: () => TestScreen()),
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: onboarding, page: () => OnboardingScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(name: forgotPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: verifyEmail, page: () => VerifyScreen()),
    GetPage(name: createPassword, page: () => CreatePassword()),
    GetPage(name: patientsHome, page: () => PatientsHomeScreen()),
    GetPage(name: verifyUser, page: () => VerifyUser()),
    GetPage(name: cotegoriseList, page: () => CategoriseListScreen()),
    GetPage(name: doctorDetails, page: () => DoctorDetailsScreen()),
    GetPage(name: bookAppointment, page: () => BookingAppointmentScreen()),
    GetPage(name: selectDataTime, page: () => SelectDataTime()),
    GetPage(name: myBooking, page: () => MyBookingScreen()),
    GetPage(name: chat, page: () => ChatListScreen()),
    GetPage(name: message, page: () => MessageScreen()),
    GetPage(name: sendReview, page: () => SendReview()),
    GetPage(name: favorite, page: () => FavoriteScreen()),
    GetPage(name: labBooking, page: () => LabBookIngScreen()),
    GetPage(name: selectData, page: () => SelectDataScreen()),
    GetPage(name: homeCare, page: () => HomeCare()),
    GetPage(name: selectDataHomeCare, page: () => SelectHomeCareDataTime()),
    GetPage(name: ambulanceBooking, page: () => AmbulanceBookIngScreen()),
    GetPage(name: notifications, page: () => NotificationScreen()),
    GetPage(name: patientsProfile, page: () => ProfileScreen()),
    GetPage(name: editProfile, page: () => EditProfile()),
    GetPage(name: healthRecords, page: () => HealthRecords()),
    GetPage(name: bookingList, page: () => BookingListScreen()),
    GetPage(name: setting, page: () => SettingScreen()),
    GetPage(name: changePassword, page: () => ChangePasswordScreen()),
    GetPage(name: personalInformation, page: () => PersonalInformationScreen()),
    GetPage(
        name: professionalQualifications,
        page: () => ProfessionalQualificationsScreen()),
    GetPage(name: addedExperience, page: () => AddedExperienceScreen()),
    GetPage(name: availability, page: () => AvailabilityScreen()),
    GetPage(name: identificationScreen, page: () => IdentificationScreen()),
    GetPage(name: reviewScreen, page: () => ReviewScreen()),
    GetPage(name: doctorHome, page: () => DoctorHomeScreen()),
    GetPage(name: patientsList, page: () => PatientsListScreen()),
    GetPage(name: appointmentList, page: () => AppointmentListScreen()),
    GetPage(name: patientsDetails, page: () => PatientsDetailsScreen()),
    GetPage(name: additionalDetails, page: () => AdditionalDetailsScreen()),
    GetPage(name: doctorProfile, page: () => DoctorProfile()),
    GetPage(name: appointmentHistory, page: () => AppointmentHistoryScreen()),
    GetPage(name: paymentMethod, page: () => SelectPaymentMethodScreen()),
    GetPage(name: payment, page: () => PaymentScreen()),
  ];
}
