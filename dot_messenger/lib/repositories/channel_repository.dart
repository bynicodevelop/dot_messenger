import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dot_messenger/models/channel_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChannelRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth authentication;

  const ChannelRepository({
    required this.firestore,
    required this.authentication,
  });

  Stream<List<ChannelModel>> get canals => firestore
          .collection("channels")
          .where(
            "followers",
            arrayContains:
                firestore.doc("users/${authentication.currentUser!.uid}"),
          )
          .orderBy(
            "lastUpdated",
            descending: true,
          )
          .snapshots()
          .map((snapshot) {
        return snapshot.docs
            .map(
              (doc) => ChannelModel.fromJson({
                "id": doc.id,
                "title": doc.get("title"),
                "image": doc.data()["image"] ?? "",
                "isPersonal":
                    doc.data()["userRef"].id == authentication.currentUser!.uid,
                "lastMessage": doc.data()["lastMessage"] ?? "",
                "lastUpdated": doc.data()["lastUpdated"],
                "createdAt": doc.data()["createdAt"],
              }),
            )
            .toList();
      });

  Future<void> createChannel(Map<String, dynamic> canal) async {
    await firestore
        .collection("users")
        .doc(authentication.currentUser!.uid)
        .collection("channels")
        .add(
      {
        ...canal,
        "lastMessage": "",
        "createdAt": FieldValue.serverTimestamp(),
        "lastUpdated": FieldValue.serverTimestamp(),
      },
    );
  }

  Future<void> deleteChannel(String channelId) async {
    await firestore
        .collection("users")
        .doc(authentication.currentUser!.uid)
        .collection("channels")
        .doc(channelId)
        .delete();
  }

  Future<void> leaveChannel(String channelId) async {
    await firestore.collection("channels").doc(channelId).update({
      "followers": FieldValue.arrayRemove([
        firestore.doc("users/${authentication.currentUser!.uid}"),
      ]),
    });
  }
}
