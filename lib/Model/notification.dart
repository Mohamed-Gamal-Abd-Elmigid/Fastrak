// To parse this JSON data, do
//
//     final notifications = notificationsFromJson(jsonString);

import 'dart:convert';

Notifications notificationsFromJson(String str) =>
    Notifications.fromJson(json.decode(str));

String notificationsToJson(Notifications data) => json.encode(data.toJson());

class Notifications {
  Notifications({
    this.data,
  });

  NotificationsData data;

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        data: json["data"] == null
            ? null
            : NotificationsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data.toJson(),
      };
}

class NotificationsData {
  NotificationsData({
    this.notifications,
    this.pagination,
  });

  List<NotificationOne> notifications;
  Pagination pagination;

  factory NotificationsData.fromJson(Map<String, dynamic> json) =>
      NotificationsData(
        notifications: json["notifications"] == null
            ? null
            : List<NotificationOne>.from(
                json["notifications"].map((x) => NotificationOne.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "notifications": notifications == null
            ? null
            : List<dynamic>.from(notifications.map((x) => x.toJson())),
        "pagination": pagination == null ? null : pagination.toJson(),
      };
}

class NotificationOne {
  NotificationOne({
    this.id,
    this.actionType,
    this.actionId,
    this.data,
    this.user,
    this.isRead,
    this.createdAt,
  });

  String id;
  ActionType actionType;
  String actionId;
  NotificationData data;
  dynamic user;
  bool isRead;
  DateTime createdAt;

  factory NotificationOne.fromJson(Map<String, dynamic> json) {
    // print(json);
    return NotificationOne(
      id: json["id"] == null ? null : json["id"],
      actionType: json["action_type"] == null
          ? null
          : actionTypeValues.map[json["action_type"]],
      actionId: json["action_id"] == null ? null : json["action_id"],
      data:
          json["data"] == null ? null : NotificationData.fromJson(json["data"]),
      user: json["user"],
      isRead: json["is_read"] == null ? null : json["is_read"],
      createdAt: json["created_at"] == null
          ? null
          : DateTime.parse(json["created_at"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "action_type":
            actionType == null ? null : actionTypeValues.reverse[actionType],
        "action_id": actionId == null ? null : actionId,
        "data": data == null ? null : data.toJson(),
        "user": user,
        "is_read": isRead == null ? null : isRead,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
      };
}

enum ActionType { ADMIN }

final actionTypeValues = EnumValues({"admin": ActionType.ADMIN});

class NotificationData {
  NotificationData({
    this.title,
    this.body,
  });

  String title;
  String body;

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      NotificationData(
        title: json["title"] == null ? null : json["title"],
        body: json["body"] == null ? null : json["body"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "body": body == null ? null : body,
      };
}

class Pagination {
  Pagination({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
  });

  int total;
  int count;
  int perPage;
  int currentPage;
  int totalPages;

  factory Pagination.fromJson(Map<String, dynamic> json) {
    print("From Pagination FAcrti");
    print(json);
    return Pagination(
      total: json["total"] == null ? null : json["total"],
      count: json["count"] == null ? null : json["count"],
      perPage: json["per_page"] == null ? null : json["per_page"],
      currentPage: json["current_page"] == null ? null : json["current_page"],
      totalPages: json["total_pages"] == null ? null : json["total_pages"],
    );
  }

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "count": count == null ? null : count,
        "per_page": perPage == null ? null : perPage,
        "current_page": currentPage == null ? null : currentPage,
        "total_pages": totalPages == null ? null : totalPages,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
