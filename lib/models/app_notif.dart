import 'dart:math';

import 'package:dabata_mobile/tools/extensions/types/map.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AppNotif {
  String? id;
  String? title;
  String? body;
  String? userId;
  bool? isRead;
  String? createdAt;
  String? updatedAt;
  Json? data;

  AppNotif({this.id, this.title, this.body, this.userId, this.isRead});

  AppNotif.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['message'];
    userId = json['user_id'];
    isRead = json['is_read'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    data = json["data"];
  }

  AppNotif.fromRemonteMessage(RemoteMessage notification) {
    if (notification.notification != null) {
      title = notification.notification!.title;
      body = notification.notification!.body;
    } else {
      title = notification.data["title"];
      body = notification.data["body"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['message'] = body;
    data['user_id'] = userId;
    data['is_read'] = isRead;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['data'] = data;
    return data;
  }

  int get idOrRandom => Random().nextInt(9999);
}
