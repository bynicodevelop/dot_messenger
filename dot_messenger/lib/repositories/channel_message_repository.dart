import "package:cloud_firestore/cloud_firestore.dart";
import "package:dot_messenger/models/message_model.dart";
import "package:firebase_auth/firebase_auth.dart";

class ChannelMessageRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth authentication;

  const ChannelMessageRepository({
    required this.firestore,
    required this.authentication,
  });

  Stream<List<MessageModel>> messages(String channelId) => firestore
      .collection("channels")
      .doc(channelId)
      .collection("messages")
      .orderBy(
        "createdAt",
        descending: false,
      )
      .snapshots()
      .map(
        (snapshot) => snapshot.docs
            .map(
              (doc) => MessageModel.fromJson({
                ...doc.data(),
                "id": doc.id,
              }),
            )
            .toList(),
      );

  Future<void> sendMessage(
    String channelId,
    Map<String, dynamic> content,
  ) async {
    await firestore
        .collection("channels")
        .doc(channelId)
        .collection("messages")
        .add(
          content,
        );
  }
}
