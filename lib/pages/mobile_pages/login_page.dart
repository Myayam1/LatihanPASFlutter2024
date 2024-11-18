import 'package:belajar_pas_flutter_terbaru_2024/controllers/login_controller.dart';
import 'package:belajar_pas_flutter_terbaru_2024/pages/mobile_pages/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileLoginPage extends StatelessWidget {
  const MobileLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Heartwarming Title
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                'We missed you. Please log in to continue.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),

              // Username TextField
              TextField(
                onChanged: (value) {
                  controller.username.value = value;
                },
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),

              // Password TextField
              TextField(
                obscureText: controller.isObscured.value,
                onChanged: (value) {
                  controller.password.value = value;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(controller.isObscured.value
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: controller.changeObscured,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Register prompt with TextButton
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {
                      // Navigate to the RegistrationPage
                      Get.to(() => MobileRegistrationPage());
                    },
                    child: Text('Register now'),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Login Button
              ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : () async {
                  await controller.login();
                },
                child: controller.isLoading.value
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('Login'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),

              // Error Message (if any)
              if (controller.errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    controller.errorMessage.value,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
