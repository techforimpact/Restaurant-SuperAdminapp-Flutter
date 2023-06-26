import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../layout.dart';
import 'general_controller.dart';
import 'login_controller.dart';

class FirebaseAuthentication {
  void signInWithEmailAndPassword() async {
    try {
      final User? user =
          (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: Get.find<LoginLogic>().emailController.text,
        password: Get.find<LoginLogic>().passwordController.text,
      ))
              .user;
      Get.find<GeneralController>().updateFormLoader(false);
      if (user != null) {
        log(user.uid.toString());
        QuerySnapshot query = await FirebaseFirestore.instance
            .collection('restaurants')
            .where("uid_id", isEqualTo: user.uid)
            .get();

        if (query.docs.isNotEmpty) {
          Get.find<GeneralController>()
              .boxStorage
              .write('uid', user.uid.toString());
          Get.find<GeneralController>()
              .boxStorage
              .write('id', query.docs[0].get('id'));
          log('user exist');
          Get.find<GeneralController>().boxStorage.write('session', 'active');

          Get.offAll(SiteLayout());
          Get.find<LoginLogic>().emailController.clear();
          Get.find<LoginLogic>().passwordController.clear();
        } else {
          Get.find<GeneralController>().updateFormLoader(false);
          Get.snackbar(
            'FAILED!',
            'User Not Found..',
          );
        }
      } else {
        log('user not found');
        Get.find<GeneralController>().boxStorage.remove('session');
      }
    } on FirebaseAuthException catch (e) {
      Get.find<GeneralController>().updateFormLoader(false);
      Get.snackbar(
        e.code,
        '',
      );
    }
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.find<GeneralController>().boxStorage.remove('uid');
    Get.find<GeneralController>().boxStorage.remove('session');
  }
}
