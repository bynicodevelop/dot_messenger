const functions = require("firebase-functions");
const admin = require("firebase-admin");
const dayjs = require("dayjs");

admin.initializeApp();

exports.onChannelCreated = functions.firestore
  .document("users/{userId}/channels/{channelId}")
  .onCreate(async (snapshot, context) => {
    const { title, followers = [] } = snapshot.data();
    const { userId, channelId } = context.params;

    await admin
      .firestore()
      .doc(`channels/${channelId}`)
      .set({
        title,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
        lastUpdated: admin.firestore.FieldValue.serverTimestamp(),
        userRef: admin.firestore().doc(`users/${userId}`),
        followers,
      });

    await admin
      .firestore()
      .doc(`channels/${channelId}`)
      .update({
        followers: admin.firestore.FieldValue.arrayUnion(
          admin.firestore().doc(`users/${userId}`)
        ),
      });
  });

exports.onChannelDeleted = functions.firestore
  .document("users/{userId}/channels/{channelId}")
  .onDelete(async (snapshot, context) => {
    const { channelId } = context.params;

    await admin.firestore().doc(`channels/${channelId}`).delete();
  });

exports.onMessageSentInChannel = functions.firestore
  .document("channels/{channelId}/messages/{messageId}")
  .onCreate(async (snapshot, context) => {
    const { content } = snapshot.data();
    const { channelId, messageId } = context.params;

    await admin
      .firestore()
      .collection(`channels/${channelId}/messages`)
      .doc(messageId)
      .update({
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
      });

    await admin.firestore().collection("channels").doc(channelId).update({
      lastUpdated: admin.firestore.FieldValue.serverTimestamp(),
      lastMessage: content,
    });
  });

if (process.env.FUNCTIONS_EMULATOR) {
  exports.createchannels = functions.https.onRequest(
    async (request, response) => {
      await admin.auth().createUser({
        email: "john@domain.tld",
        password: "123456",
        uid: "mNoXIF3cXPK6kly0eV0skOfM46Gu",
      });

      await admin
        .firestore()
        .collection("users")
        .doc("mNoXIF3cXPK6kly0eV0skOfM46Gu")
        .collection("channels")
        .add({
          title: "General",
          createdAt: dayjs(new Date()).toDate(),
          lastUpdated: dayjs(new Date()).toDate(),
          lastMessage: "Hey, how are you?",
          image: "https://picsum.photos/200/300?random=1",
          followers: [
            admin.firestore().doc("users/mNoXIF3cXPK6kly0eV0skOfM46Gu"),
          ],
        });

      await admin.auth().createUser({
        email: "jane@domain.tld",
        password: "123456",
        uid: "2cStQVZp2ZgmcJAD1tgS5ZIfeSuw",
      });

      await admin
        .firestore()
        .collection("users")
        .doc("2cStQVZp2ZgmcJAD1tgS5ZIfeSuw")
        .collection("channels")
        .add({
          title: "League of Legends",
          createdAt: dayjs(new Date()).subtract(11, "hours").toDate(),
          lastUpdated: dayjs(new Date()).subtract(11, "hours").toDate(),
          lastMessage: "Salut ! Je suis en train de jouer à League of Legends",
        });

      await admin
        .firestore()
        .collection("users")
        .doc("2cStQVZp2ZgmcJAD1tgS5ZIfeSuw")
        .collection("channels")
        .add({
          title: "CS:GO",
          createdAt: dayjs(new Date()).subtract(2, "days").toDate(),
          lastUpdated: dayjs(new Date()).subtract(2, "days").toDate(),
          lastMessage:
            "Non je ne suis pas en train de jouer à CS:GO. Et puis ? Tu ne peux pas me dire ?",
          followers: [
            admin.firestore().doc("users/mNoXIF3cXPK6kly0eV0skOfM46Gu"),
          ],
        });

      response.json({
        message: "ok",
      });
    }
  );
}
