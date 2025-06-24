import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';
import 'package:ziya_attendance_ui/controller/Auth_Controller.dart';
import 'package:ziya_attendance_ui/models/Forgot_Password_Model.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final ForgotPasswordController _controller = ForgotPasswordController();
  bool _isLoading = false;

  void _submitResetEmail() {
    final model = ForgotPasswordModel(email: emailController.text);
    _controller.sendResetEmail(
      model: model,
      context: context,
      formKey: _formKey,
      setLoading: (val) => setState(() => _isLoading = val),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),

              const SizedBox(height: 20),
              const Text(
                "Forgot Your Password?",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF164171)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "Enter your registerd email address \nto reset your password.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Reset Password',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2094e5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _isLoading ? null : _submitResetEmail,
                  label: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(' Reset Password',style: TextStyle(color: Colors.white,fontSize: 18),),
                ),
              ),
              SizedBox(height: 20,),
              Text("Back To Login",style: TextStyle(color: Color(0xFF65b24c),fontSize: 20,fontWeight: FontWeight.w500),)
            ],
          ),
        ),
      ),
    );
  }
}
