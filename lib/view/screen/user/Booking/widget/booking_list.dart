import 'package:dime/controllers/user/payment/payment_controller.dart';
import 'package:dime/controllers/user/payment/peigo_payment_controller.dart';
import 'package:dime/controllers/user/payment/select_payment_method_controller.dart';
import 'package:dime/core/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controllers/user/Booking/my_booking_controller.dart';
import '../../../../../models/api_response_model.dart';
import '../../../../../models/my_booking_model.dart';
import '../../../../common_widgets/custom_loader.dart';
import '../../../../common_widgets/doctor/doctor_book_item.dart';
import '../../../../common_widgets/error_screen.dart';
import '../../../../common_widgets/no_data.dart';

class BookingList extends StatelessWidget {
  const BookingList({
    super.key,
    required this.buttonText,
    this.isLoading = false,
    this.isPayment = false,
  });

  final String buttonText;
  final bool isLoading;
  final bool isPayment;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyBookingController>(
      builder: (controller) => switch (controller.status) {
        Status.loading => const CustomLoader(),
        Status.error => ErrorScreen(
            onTap: () => controller.getAppointmentsRepo(),
          ),
        Status.completed => controller.appointmentList.isEmpty
            ? const NoData()
            : ListView.builder(
                itemCount: controller.appointmentList.length,
                itemBuilder: (context, index) {
                  Appointment item = controller.appointmentList[index];
                  return doctorBookItem(
                      item: item,
                      buttonText: isPayment
                          ? "$buttonText \$${item.amount}"
                          : buttonText,
                      isLoading: isLoading,
                      onTap: isPayment
                          ? () {
                              SelectPaymentMethodController.instance.amount = item.amount.toString();
                              SelectPaymentMethodController.instance.productName = 'Appointment';
                              PaymentController.instance.consultant = item.consultant.id;
                              PaymentController.instance.appointment = item.id;
                              PaymentController.instance.amountController.text = item.amount.toString();
                               PeigoPaymentController.instance.consultant = item.consultant.id;
                              PeigoPaymentController.instance.appointment = item.id;
                              PeigoPaymentController.instance.amountController.text = item.amount.toString();




                              Get.toNamed(AppRoutes.paymentMethod);
                            }
                          : () => Get.toNamed(AppRoutes.bookingDetails,
                              parameters: {'id': item.id}));
                },
              ),
      },
    );
  }
}
