import 'dart:async';
import 'dart:io';

import 'package:dabata_mobile/models/app_notif.dart';
import 'package:dabata_mobile/tools/web/data_response.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class NotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static StreamSubscription? _fcmSubscription;
  static bool _isListening = false;
  static final FlutterLocalNotificationsPlugin _localNotifPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> setup() async {
    await _initializeFirebaseNotification();
    await _initializeLocalNotif();
  }

  static Future<void> _initializeFirebaseNotification() async {
    var settings = await _messaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (Platform.isIOS) {
        await _messaging.setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
      }

      FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    } else {
      throw Exception("Permission not granted for notification");
    }
  }

  static Future<void> showNotif(AppNotif notif) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'lebedoo_channel',
      'LeBedoo channel',
      importance: Importance.max,
      priority: Priority.high,
      // ticker: 'ticker',
    );

    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      presentBanner: true,
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await _localNotifPlugin.show(
      notif.idOrRandom,
      notif.title,
      notif.body,
      platformChannelSpecifics,
    );
  }

  static Future<void> _initializeLocalNotif() async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingsIOS = const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    _localNotifPlugin.initialize(initializationSettings);
  }

  static Future<void> onListen({
    void Function(RemoteMessage? message, AppNotif notif)? handler,
  }) async {
    if (_isListening) return;
    _isListening = true;

    await stopListenNotif();
    _fcmSubscription = FirebaseMessaging.onMessage.listen(
      (message) {
        var notif = AppNotif.fromRemonteMessage(message);

        if (Platform.isAndroid) showNotif(notif);

        if (handler != null) handler(message, notif);
      },
    );
  }

  static Future<String?> getFcmToken() async {
    try {
      return _messaging.getToken();
    } catch (e, st) {
      DataResponse.error(systemError: e, systemtraceError: st);
      return null;
    }
  }

  static Future<DataResponse<bool>> stopListenNotif() async {
    try {
      if (_fcmSubscription != null) {
        return _fcmSubscription!.cancel().then((e) {
          if (kDebugMode) print(">>> Arrêt de l'écoute des messages FCM");
          _fcmSubscription = null;
          return DataResponse.success(data: true);
        }).onError(
          (e, st) => DataResponse.error(
            systemError: e,
            systemtraceError: st,
          ),
        );
      }
      return DataResponse.success(data: true);
    } catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    }
  }
}

@pragma('vm:entry-point')
Future<void> onBackgroundMessage(RemoteMessage message) async {
  if (message.data.isNotEmpty) {
    var notif = AppNotif(
      title: message.data["title"],
      body: message.data["body"],
    );
    NotificationService.showNotif(notif);
  }
}
