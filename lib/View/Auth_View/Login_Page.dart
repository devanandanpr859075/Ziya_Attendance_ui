import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
  bool _isLoading = false;

  final LoginController controller = LoginController();

  void _handleLogin() {
    final model = LoginModel(
      email: emailController.text,
      password: passwordController.text,
    );

    controller.login(
      context: context,
      formKey: _formKey,
      loginModel: model,
      onStart: () => setState(() => _isLoading = true),
      onComplete: () => setState(() => _isLoading = false),
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Decorative Circles
          Positioned(
            top: -260,
            left: -100,
            child: _buildCircle(400, Colors.green),
          ),
          Positioned(
            top: -200,
            left: -170,
            child: _buildCircle(400, Colors.blueAccent),
          ),
          Positioned(
            bottom: -270,
            right: -80,
            child: _buildCircle(300, const Color(0xFF4CAF50)),
          ),
          Positioned(
            bottom: -300,
            right: -240,
            child: _buildCircle(400, Color(0xFF88c347)),
          ),

          // Foreground Content
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
                          const Text(
                            'ZiyaAttend',
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const Text(
                            'Smart Attendance Maintainer',
                            style: TextStyle(color: Colors.green, fontSize: 20,fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 30),

                          _buildInputField(
                            emailController,
                            'Email',
                            inputType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 16),
                          _buildInputField(
                            passwordController,
                            'Password',
                            obscure: true,
                          ),
                          const SizedBox(height: 5),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                        const ForgotPasswordPage()),
                                  );
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: Colors.red.withOpacity(0.8)),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),

                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _handleLogin,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: _isLoading
                                  ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                                  : const Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const SignupPage()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Don't have an account?",
                                    style: TextStyle(color: Colors.black)),
                                Text(" Sign Up",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20)),
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
        if (hintText == 'Email' && !val.contains('@')) return "Enter a valid email";
        if (hintText == 'Password' && val.length < 6)
          return "Password must be at least 6 characters";
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
        const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        hintStyle: const TextStyle(fontSize: 16),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
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
        color: color
      ),
    );
  }
}
