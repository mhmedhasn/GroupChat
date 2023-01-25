import 'package:armando/models/my_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseUtils {
  static CollectionReference<MyUser> getUserCollction() {
    return FirebaseFirestore.instance
        .collection(MyUser.CollctionName)
        .withConverter<MyUser>(
            fromFirestore: (snapshot, options) =>
                MyUser.fromJson(snapshot.data()!),
            toFirestore: (value, options) => value.toJson());
  }

  static Future<void> AddUserToFirestore(MyUser myUser) {
    return getUserCollction().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> ReadUserToFirestore(String id) async {
    var userRefrence = await getUserCollction().doc(id).get();
    return userRefrence.data();
  }

}
