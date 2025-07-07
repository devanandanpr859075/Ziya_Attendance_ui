import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/View/Auth_View/Login_Page.dart';
import 'package:ziya_attendance_ui/View/MainNavigationPage.dart';
import 'package:ziya_attendance_ui/controller/Shared_Preference_Helper.dart';
import 'package:ziya_attendance_ui/models/Forgot_Password_Model.dart';
import 'package:ziya_attendance_ui/models/Login_Model.dart';
import 'package:ziya_attendance_ui/models/Signup_Model.dart';


class SignupController with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final SharedPreferenceHelper _prefs = SharedPreferenceHelper();

  bool isLoading = false;
  String? errorMessage;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<String?> registerUser(
      SignupModel userModel,
      String confirmPassword,
      BuildContext context,
      ) async {
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
        'mobile': userModel.mobile,
        'createdAt': FieldValue.serverTimestamp(),
      });

      await _prefs.saveUserDetails(
        uid: uid,
        name: userModel.name,
        email: userModel.email,
      );

      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return "Email already in use";
        case 'invalid-email':
          return "Invalid email";
        case 'weak-password':
          return "Password should be at least 6 characters";
        default:
          return "Signup failed: ${e.message}";
      }
    } catch (e) {
      return "Unexpected error: $e";
    }
  }
}


class LoginController with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final SharedPreferenceHelper _prefs = SharedPreferenceHelper();

  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

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
        email: loginModel.email.trim(),
        password: loginModel.password.trim(),
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
      if (e.code == 'user-not-found') {
        message = 'No user found with this email';
      } else if (e.code == 'wrong-password') {
        message = 'Incorrect password';
      } else {
        message = e.message ?? message;
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    } finally {
      onComplete();
    }
  }
}

class ForgotPasswordController with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoading = false;
  String? errorMessage;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> sendResetEmail({
    required ForgotPasswordModel model,
    required BuildContext context,
    required GlobalKey<FormState> formKey,
  }) async {
    if (!formKey.currentState!.validate()) return;

    setLoading(true);

    try {
      await _auth.sendPasswordResetEmail(email: model.email.trim());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password reset email sent")),
      );
      errorMessage = null;
    } on FirebaseAuthException catch (e) {
      errorMessage = "Error: ${e.message}";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage!), backgroundColor: Colors.red),
      );
    } catch (e) {
      errorMessage = "Unexpected error: $e";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage!), backgroundColor: Colors.red),
      );
    } finally {
      setLoading(false);
    }
  }
}

