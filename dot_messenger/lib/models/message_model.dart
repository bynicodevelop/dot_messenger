import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  final String uid;
  final String content;
  final DateTime createdAt;

  const MessageModel({
    required this.uid,
    required this.content,
    required this.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      uid: json['id'],
      content: json['content'],
      createdAt: Timestamp.fromMicrosecondsSinceEpoch(
        (json["createdAt"] as Timestamp).microsecondsSinceEpoch,
      ).toDate(),
    );
  }

  @override
  List<Object> get props => [
        uid,
        content,
      ];
}
