import 'package:dime/view/screen/consultant/blog/my_blog.dart';
import 'package:dime/view/screen/consultant/blog/upload_blog.dart';
import 'package:dime/view/screen/consultant/transaction/transaction_details.dart';
import 'package:dime/view/screen/consultant/transaction/transaction_screen.dart';
import 'package:dime/view/screen/consultant/transaction/withdraw_screen.dart';
import 'package:dime/view/screen/user/Booking/booking_details.dart';
import 'package:dime/view/screen/user/Booking/schedule_reply.dart';
import 'package:dime/view/screen/user/blog/blog_screen.dart';
import 'package:dime/view/screen/user/blog/read_blog_screen.dart';
import 'package:dime/view/screen/user/message/video_call_screen.dart';
import 'package:dime/view/screen/user/payment/peigo_payment_screen.dart';
import 'package:dime/view/screen/user/setting/privacy_policy_screen.dart';
import 'package:dime/view/screen/user/setting/terms_of_services_screen.dart';
import 'package:get/get.dart';

import '../view/screen/consultant/history/appointment_history_screen.dart';
import '../view/screen/consultant/info/added_experience_screen.dart';
import '../view/screen/consultant/info/availability_screen.dart';
import '../view/screen/consultant/info/identification_screen.dart';
import '../view/screen/consultant/info/personal_information_screen.dart';
import '../view/screen/consultant/info/review_screen.dart';
import '../view/screen/consultant/patients_details/patients_details_screen.dart';
import '../view/screen/consultant/patients_info/appointment_list_screen.dart';
import '../view/screen/consultant/patients_info/doctor_home_screen.dart';
import '../view/screen/consultant/patients_info/patients_list_screen.dart';
import '../view/screen/consultant/profile/doctor_profile.dart';
import '../view/screen/no_role/auth/change_password/change_password_screen.dart';
import '../view/screen/no_role/auth/forgot password/create_password.dart';
import '../view/screen/no_role/auth/forgot password/forgot_password.dart';
import '../view/screen/no_role/auth/forgot password/verify_screen.dart';
import '../view/screen/no_role/auth/sign in/sign_in_screen.dart';
import '../view/screen/no_role/auth/sign up/sign_up_screen.dart';
import '../view/screen/no_role/auth/sign up/verify_user.dart';
import '../view/screen/no_role/onboarding_screen/onboarding_screen.dart';
import '../view/screen/no_role/splash/splash_screen.dart';
import '../view/screen/test_screen.dart';
import '../view/screen/user/Booking/book_appointment.dart';
import '../view/screen/user/Booking/my_booking_screen.dart';
import '../view/screen/user/Booking/schedule_call.dart';
import '../view/screen/user/Booking/select_date.dart';
import '../view/screen/user/categories/cotegorise_list.dart';
import '../view/screen/user/doctor/consultant_details_screen.dart';
import '../view/screen/user/favorite/favorite_screen.dart';
import '../view/screen/user/health/health_records.dart';
import '../view/screen/user/home/patients_home.dart';
import '../view/screen/user/message/chat_screen.dart';
import '../view/screen/user/message/message_screen.dart';
import '../view/screen/user/notifications/notifications_screen.dart';
import '../view/screen/user/payment/payment_info_screen.dart';
import '../view/screen/user/payment/payment_screen.dart';
import '../view/screen/user/payment/peigo_info_screen.dart';
import '../view/screen/user/payment/select_payment_method_screen.dart';
import '../view/screen/user/profile/edit_profile.dart';
import '../view/screen/user/profile/profile_screen.dart';
import '../view/screen/user/review/send_review.dart';
import '../view/screen/user/setting/setting_screen.dart';

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
  static const String doctorDetails = "/consultant_details_screen.dart";
  static const String bookAppointment = "/book_appointment.dart";
  static const String scheduleVideoCall = "/schedule_call.dart";
  static const String myBooking = "/my_booking_screen.dart";
  static const String chat = "/chat_screen.dart";
  static const String message = "/message_screen.dart";
  static const String sendReview = "/send_review.dart";
  static const String favorite = "/favorite_screen.dart";
  static const String selectData = "/select_date.dart";
  static const String notifications = "/notifications_screen.dart";
  static const String patientsProfile = "/profile_screen.dart";
  static const String editProfile = "/edit_profile.dart";
  static const String healthRecords = "/health_records.dart";
  static const String setting = "/setting_screen.dart";
  static const String changePassword = "/change_password_screen.dart";
  static const String personalInformation = "/personal_information_screen.dart";

  static const String addedExperience = "/added_experience_screen.dart";
  static const String availability = "/availability_screen.dart";
  static const String identificationScreen = "/identification_screen.dart";
  static const String reviewScreen = "/review_screen.dart";
  static const String doctorHome = "/doctor_home_screen.dart";
  static const String patientsList = "/patients_list_screen.dart";
  static const String appointmentList = "/appointment_list_screen.dart";
  static const String patientsDetails = "/patients_details_screen.dart";
  static const String doctorProfile = "/doctor_profile.dart";
  static const String appointmentHistory = "/appointment_history_screen.dart";
  static const String paymentMethod = "/select_payment_method_screen.dart";
  static const String payment = "/payment_screen.dart";
  static const String bookingDetails = "/booking_details.dart";
  static const String blog = "/blog_screen.dart";
  static const String readBlog = "/read_blog_screen.dart";
  static const String transactions = "/transaction_screen.dart";
  static const String transactionDetails = "/transaction_details.dart";
  static const String uploadBlog = "/upload_blog.dart";
  static const String myBlog = "/my_blog.dart";
  static const String scheduleReply = "/schedule_reply.dart";
  static const String videoCall = "/video_call_screen.dart";
  static const String privacyPolicy = "/privacy_policy_screen.dart";
  static const String termsOfServices = "/terms_of_services_screen.dart";
  static const String withdraw = "/withdraw_screen.dart";
  static const String peigo = "/peigo_payment_screen.dart";
  static const String paymentInfo = "/payment_info_screen.dart";
  static const String peigoPaymentInfo = "/peigo_info_screen.dart";

  static List<GetPage> routes = [
    GetPage(name: test, page: () =>  const TestScreen()),
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(name: forgotPassword, page: () => const ForgotPasswordScreen()),
    GetPage(name: verifyEmail, page: () => const VerifyScreen()),
    GetPage(name: createPassword, page: () => CreatePassword()),
    GetPage(name: patientsHome, page: () => const PatientsHomeScreen()),
    GetPage(name: verifyUser, page: () => const VerifyUser()),
    GetPage(name: cotegoriseList, page: () => const CategoriseListScreen()),
    GetPage(name: doctorDetails, page: () => const ConsultantDetailsScreen()),
    GetPage(name: bookAppointment, page: () => BookingAppointmentScreen()),
    GetPage(name: scheduleVideoCall, page: () => const SelectDataTime()),
    GetPage(name: myBooking, page: () => const MyBookingScreen()),
    GetPage(name: chat, page: () => const ChatListScreen()),
    GetPage(name: message, page: () => const MessageScreen()),
    GetPage(name: sendReview, page: () => const SendReview()),
    GetPage(name: favorite, page: () => const FavoriteScreen()),
    GetPage(name: selectData, page: () => const SelectDataScreen()),
    GetPage(name: notifications, page: () => const NotificationScreen()),
    GetPage(name: patientsProfile, page: () => const ProfileScreen()),
    GetPage(name: editProfile, page: () => EditProfile()),
    GetPage(name: healthRecords, page: () => const HealthRecords()),
    GetPage(name: setting, page: () => const SettingScreen()),
    GetPage(name: changePassword, page: () => ChangePasswordScreen()),
    GetPage(name: personalInformation, page: () => PersonalInformationScreen()),
    GetPage(name: addedExperience, page: () => AddedExperienceScreen()),
    GetPage(name: availability, page: () => AvailabilityScreen()),
    GetPage(name: identificationScreen, page: () => const IdentificationScreen()),
    GetPage(name: reviewScreen, page: () => const ReviewScreen()),
    GetPage(name: doctorHome, page: () => const DoctorHomeScreen()),
    GetPage(name: patientsList, page: () => const PatientsListScreen()),
    GetPage(name: appointmentList, page: () => const AppointmentListScreen()),
    GetPage(name: patientsDetails, page: () => const PatientsDetailsScreen()),
    GetPage(name: doctorProfile, page: () => const DoctorProfile()),
    GetPage(name: appointmentHistory, page: () => const AppointmentHistoryScreen()),
    GetPage(name: paymentMethod, page: () => const SelectPaymentMethodScreen()),
    GetPage(name: payment, page: () => PaymentScreen()),
    GetPage(name: bookingDetails, page: () => const BookingDetails()),
    GetPage(name: blog, page: () => const BlogScreen()),
    GetPage(name: readBlog, page: () => const ReadBlogScreen()),
    GetPage(name: transactions, page: () => const TransactionScreen()),
    GetPage(name: transactionDetails, page: () => const TransactionDetails()),
    GetPage(name: uploadBlog, page: () => const UploadBlog()),
    GetPage(name: myBlog, page: () => const MyBlog()),
    GetPage(name: scheduleReply, page: () => const ScheduleReply()),
    GetPage(name: videoCall, page: () => const VideoCallScreen()),
    GetPage(name: privacyPolicy, page: () => const PrivacyPolicyScreen()),
    GetPage(name: termsOfServices, page: () => const TermsOfServicesScreen()),
    GetPage(name: withdraw, page: () =>  WithdrawScreen()),
    GetPage(name: peigo, page: () =>  PeigoPaymentScreen()),
    GetPage(name: paymentInfo, page: () =>  PaymentMethodFinal()),
    GetPage(name: peigoPaymentInfo, page: () =>  PeigoInfoScreen()),
  ];
}
