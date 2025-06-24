// signup_controller.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ziya_attendance_ui/View/MainNavigationPage.dart';
import 'package:ziya_attendance_ui/controller/Shared_Preference_Helper.dart';
import 'package:ziya_attendance_ui/models/Forgot_Password_Model.dart';
import 'package:ziya_attendance_ui/models/Login_Model.dart';
import '../models/signup_model.dart';

class SignupController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final SharedPreferenceHelper _prefs = SharedPreferenceHelper();

  Future<String?> registerUser(SignupModel userModel, String confirmPassword, BuildContext context) async {
    if (userModel.password != confirmPassword) {
      return "Passwords do not match";
    }

    try {
      final userCred = await _auth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );

      final uid = userCred.user!.uid;

      await _firestore.collection('users').doc(uid).set({
        'uid': uid,
        'name': userModel.name,
        'email': userModel.email,
        'createdAt': FieldValue.serverTimestamp(),
      });


      await _prefs.saveUserDetails(
        uid: uid,
        name: userModel.name,
        email: userModel.email,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainNavigationPage()),
      );

      return null;
    } on FirebaseAuthException catch (e) {
      return switch (e.code) {
        'email-already-in-use' => "Email already in use",
        'invalid-email' => "Invalid email",
        'weak-password' => "Weak password",
        _ => "Signup failed: ${e.message}",
      };
    } catch (e) {
      return "Error: $e";
    }
  }
}
class LoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final SharedPreferenceHelper _prefs = SharedPreferenceHelper();

  void login({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required LoginModel loginModel,
    required VoidCallback onStart,
    required VoidCallback onComplete,
  }) async {
    if (!formKey.currentState!.validate()) return;

    onStart();

    try {
      final userCred = await _auth.signInWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      );

      final uid = userCred.user!.uid;


      final snapshot = await _firestore.collection('users').doc(uid).get();
      final userData = snapshot.data();

      if (userData != null) {
        await _prefs.saveUserDetails(
          uid: userData['uid'],
          name: userData['name'],
          email: userData['email'],
        );
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainNavigationPage()),
      );
    } on FirebaseAuthException catch (e) {
      String message = 'Login failed';
      if (e.code == 'user-not-found') message = 'No user found with this email';
      else if (e.code == 'wrong-password') message = 'Incorrect password';

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    } finally {
      onComplete();
    }
  }
}





class ForgotPasswordController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendResetEmail({
    required ForgotPasswordModel model,
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required Function(bool) setLoading,
  }) async {
    if (!formKey.currentState!.validate()) return;

    setLoading(true);
    try {
      await _auth.sendPasswordResetEmail(email: model.email.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password reset email sent")),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: \${e.message}")),
      );
    } finally {
      setLoading(false);
    }
  }
}
