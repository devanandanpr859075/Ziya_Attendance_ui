import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';
import 'package:ziya_attendance_ui/constants/Text_Constants.dart';
import 'package:ziya_attendance_ui/View/Auth_View/Forgot_Password_Page.dart';
import 'package:ziya_attendance_ui/View/Auth_View/Signup_Page.dart';
import 'package:ziya_attendance_ui/controller/Auth_Controller.dart';
import 'package:ziya_attendance_ui/models/Login_Model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _handleLogin(BuildContext context) {
    final loginModel = LoginModel(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    final controller = Provider.of<LoginController>(context, listen: false);

    controller.login(
      context: context,
      formKey: _formKey,
      loginModel: loginModel,
      onStart: () => controller.setLoading(true),
      onComplete: () => controller.setLoading(false),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Positioned(top: -260, left: -100, child: _buildCircle(400, AppColors.punchInColor)),
          Positioned(top: -200, left: -170, child: _buildCircle(400, AppColors.primaryColor)),
          Positioned(bottom: -270, right: -80, child: _buildCircle(300, AppColors.successGreen)),
          Positioned(bottom: -300, right: -240, child: _buildCircle(400, AppColors.secondaryGreen)),

          SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: size.height - MediaQuery.of(context).padding.top,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            TextConstants.appName,
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textBlack,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            TextConstants.appSubtitle,
                            style: TextStyle(
                              color: AppColors.subtitleGreen,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 30),

                          _buildInputField(emailController, TextConstants.email, inputType: TextInputType.emailAddress),
                          const SizedBox(height: 16),
                          _buildInputField(passwordController, TextConstants.password, obscure: true),
                          const SizedBox(height: 5),

                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => const ForgotPasswordPage()),
                                );
                              },
                              child: Text(
                                TextConstants.forgotPassword,
                                style: TextStyle(color: AppColors.Textred.withOpacity(0.8)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: controller.isLoading ? null : () => _handleLogin(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              child: controller.isLoading
                                  ? const CircularProgressIndicator(color: AppColors.cardColor)
                                  : const Text(
                                TextConstants.login,
                                style: TextStyle(fontSize: 16, color: AppColors.cardColor),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => const SignupPage()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(TextConstants.dontHaveAccount, style: TextStyle(color: AppColors.textBlack)),
                                const Text(TextConstants.signUp, style: TextStyle(color: AppColors.textBlack, fontSize: 20)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(
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
        if (val == null || val.isEmpty) return "Enter $hintText";
        if (hintText == TextConstants.email && !val.contains('@')) return TextConstants.enterValidEmail;
        if (hintText == TextConstants.password && val.length < 6) return TextConstants.passwordLength;
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        hintStyle: const TextStyle(fontSize: 16),
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

  Widget _buildCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
