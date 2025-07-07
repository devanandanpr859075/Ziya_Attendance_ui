import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ziya_attendance_ui/View/Auth_View/Login_Page.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';
import 'package:ziya_attendance_ui/constants/Text_Constants.dart';
import 'package:ziya_attendance_ui/controller/Auth_Controller.dart';
import 'package:ziya_attendance_ui/models/Signup_Model.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> _signUp(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    final controller = Provider.of<SignupController>(context, listen: false);
    controller.setLoading(true);

    try {
      final model = SignupModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        mobile: mobileController.text.trim(),
      );

      final error = await controller.registerUser(
        model,
        confirmPasswordController.text.trim(),
        context,
      );

      if (error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error), backgroundColor: AppColors.errorRed),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(TextConstants.signupSuccess),
            backgroundColor: AppColors.successGreen,
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginPage()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Unexpected error: $e"), backgroundColor: AppColors.errorRed),
      );
    } finally {
      controller.setLoading(false);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SignupController>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          _buildBackgroundCircles(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      TextConstants.appName,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textBlack,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      TextConstants.createAccount,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.subtitleGreen,
                      ),
                    ),
                    const SizedBox(height: 30),

                    _buildInput(nameController, TextConstants.name),
                    const SizedBox(height: 16),
                    _buildInput(emailController, TextConstants.email, inputType: TextInputType.emailAddress),
                    const SizedBox(height: 16),
                    _buildInput(mobileController, TextConstants.mobile, inputType: TextInputType.phone),
                    const SizedBox(height: 16),
                    _buildInput(passwordController, TextConstants.password, obscure: true),
                    const SizedBox(height: 16),
                    _buildInput(confirmPasswordController, TextConstants.confirmPassword, obscure: true),

                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: controller.isLoading ? null : () => _signUp(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: controller.isLoading
                            ? const CircularProgressIndicator(color: AppColors.cardColor)
                            : const Text(
                          TextConstants.signUp,
                          style: TextStyle(fontSize: 16, color: AppColors.cardColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    TextButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      ),
                      child: const Text(
                        TextConstants.alreadyHaveAccount,
                        style: TextStyle(fontSize: 16, color: AppColors.subtitleGreen),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInput(
      TextEditingController controller,
      String hintText, {
        TextInputType inputType = TextInputType.text,
        bool obscure = false,
      }) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      obscureText: obscure,
      validator: (val) {
        if (val == null || val.isEmpty) {
          if (hintText == TextConstants.name) return TextConstants.enterName;
          if (hintText == TextConstants.email) return TextConstants.enterEmail;
          if (hintText == TextConstants.mobile) return TextConstants.enterMobile;
          if (hintText == TextConstants.password) return TextConstants.enterPassword;
          if (hintText == TextConstants.confirmPassword) return TextConstants.enterConfirmPassword;
        }
        if (hintText == TextConstants.email && !val!.contains('@')) return TextConstants.enterValidEmail;
        if (hintText == TextConstants.mobile && val!.length != 10) return TextConstants.enterValidMobile;
        if (hintText == TextConstants.confirmPassword && val != passwordController.text) {
          return TextConstants.passwordMismatch;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        filled: true,
        fillColor: AppColors.cardColor,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.lightGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:  BorderSide(color: AppColors.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.errorRed),
        ),
      ),
    );
  }

  Widget _buildBackgroundCircles() {
    return Stack(
      children: [
        _circle(-260, -100, 400, AppColors.punchInColor),
        _circle(-200, -170, 400, AppColors.primaryColor),
        _circle(null, -80, 300, AppColors.successGreen, bottom: -270),
        _circle(null, -240, 400, AppColors.secondaryGreen, bottom: -300),
      ],
    );
  }

  Widget _circle(double? top, double? left, double size, Color color, {double? bottom}) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
