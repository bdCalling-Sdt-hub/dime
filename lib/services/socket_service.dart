import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../helpers/prefs_helper.dart';
import '../utils/app_url.dart';
import 'notification_service.dart';

class SocketServices {
  static late io.Socket socket;
  bool show = false;

  ///<<<============ Connect with socket ====================>>>
  static void connectToSocket() {
    Map<String, String> headers = {
      'Authorization': "Bearer ${PrefsHelper.token}",
    };
    socket = io.io(
        AppUrls.socketUrl,
        io.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .setExtraHeaders(headers)
            .build());

    socket.onConnect((data) {
      if (kDebugMode) {
        print("=============================> Connection $data");
      }
    });
    socket.onConnectError((data) {
      if (kDebugMode) {
        print("============================>Connection Error $data");
      }
    });

    socket.connect();

    socket.on("user-notification::${PrefsHelper.userId}", (data) {
      if (kDebugMode) {
        print("================> get Data on socket: $data");
      }
      NotificationService.showNotification(data);
    });
  }
}
