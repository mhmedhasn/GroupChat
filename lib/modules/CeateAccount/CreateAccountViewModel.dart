import 'package:armando/base.dart';
import 'package:armando/modules/CeateAccount/CreateAccountNavigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CreateAccountViewModel extends BaseViewModel<CreateAccountNavigator> {
  void CreatAccountButton(String emailAddress, String password) async {
    try {
      navigator!.showLoding();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      navigator!.hidenDialog();
      navigator!.ShowMassage('Create account is successfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        navigator!.hidenDialog();
        navigator!.ShowMassage('The password provided is too weak.');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        navigator!.hidenDialog();
        navigator!.ShowMassage('The account already exists for that email..');
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    SizedBox(
      height: 12,
    );
  }
}
