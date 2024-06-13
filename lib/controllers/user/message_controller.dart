import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/chat_message_model.dart';
import '../../utils/app_images.dart';

class MessageController extends GetxController {
  bool isLoading = false;
  bool isMoreLoading = false;
  bool isCallConnected = true;
  bool isVideoCall = false;
  bool isVolumeMute = false;
  bool isMicMute = false;
  double dragVertical = 20.0;
  double dragHorizontal = 80.0;
  String? video;

  List messages = [
    ChatMessageModel(
        image: AppImages.doctorSarah, text: "hello", isMe: false, time: "9:30"),
    ChatMessageModel(
        image: AppImages.profile, text: "hello", isMe: true, time: "9:30"),
    ChatMessageModel(
        image: AppImages.profile,
        text: "Join Video Call \n At 10:30",
        isMe: true,
        time: "9:30",
        isCall: true),
    ChatMessageModel(
        image: AppImages.doctorSarah, text: "hello", isMe: false, time: "9:30")
  ];

  ScrollController scrollController = ScrollController();
  TextEditingController messageController = TextEditingController();

  getVideo() async {


    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp4'],
    );

    if (result != null && result.paths.isNotEmpty) {
      video = result.paths[0];
      update();
    }
  }
}



class TherapistController extends GetxController{

  TextEditingController searchPatentName = TextEditingController();

  TextEditingController messageController = TextEditingController();

  RxInt index = 0.obs;
  RxString sendMessage = ''.obs;
  File? selectedMessageImage;
  RxBool isCallConnected = true.obs;
  RxBool isVideoCall = false.obs;
  RxBool isVolumeMute = false.obs;
  RxBool isMicMute = false.obs;
  Rx<Offset> position = Offset(80.0, 20.0).obs;
  RxDouble dragHorizontal = 20.0.obs;
  RxDouble dragVertical = 80.0.obs;

  Map sessionListMap =
  {
    "totalSessions" : 26,
    "completeSessions" : 03
  };


  Future openGallery() async {
    final pickImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedMessageImage = File(pickImage!.path);
    update();
  }

// Future<void> openCamera() async{
//   final cameras = await availableCameras();
//   Get.to(VideoCallScreen(cameras: cameras));
// }

}