import "package:cloud_firestore/cloud_firestore.dart";
import "package:equatable/equatable.dart";

class ChannelModel extends Equatable {
  final String id;
  final String title;
  final String image;
  final String lastMessage;
  final DateTime lastUpdated;
  final DateTime createdAt;
  final bool isPersonal;

  const ChannelModel({
    required this.id,
    required this.title,
    required this.image,
    required this.lastMessage,
    required this.lastUpdated,
    required this.createdAt,
    this.isPersonal = false,
  });

  factory ChannelModel.fromJson(Map<String, dynamic> json) => ChannelModel(
        id: json["id"],
        title: json["title"],
        image: json["image"] ?? "",
        lastMessage: json["lastMessage"] ?? "",
        isPersonal: json["isPersonal"] ?? false,
        lastUpdated: Timestamp.fromMicrosecondsSinceEpoch(
          (json["lastUpdated"] as Timestamp).microsecondsSinceEpoch,
        ).toDate(),
        createdAt: Timestamp.fromMicrosecondsSinceEpoch(
          (json["createdAt"] as Timestamp).microsecondsSinceEpoch,
        ).toDate(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "lastUpdated": lastUpdated,
        "lastMessage": lastMessage,
        "isPersonal": isPersonal,
        "createdAt": createdAt.toIso8601String(),
      };

  @override
  List<Object?> get props => [
        id,
        title,
        image,
        isPersonal,
        lastMessage,
        createdAt,
      ];
}
