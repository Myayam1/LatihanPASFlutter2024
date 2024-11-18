import 'package:belajar_pas_flutter_terbaru_2024/controllers/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileRegistrationPage extends StatelessWidget {
  const MobileRegistrationPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final RegistrationController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.blue,
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Heartwarming Title
                  Text(
                    'Create an Account!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'We\'re excited to have you join us. Please fill out the form below.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),

                  // Full Name TextField
                  TextField(
                    onChanged: (value) {
                      controller.full_name.value = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Email TextField
                  TextField(
                    onChanged: (value) {
                      controller.email.value = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: 20),

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

                  // Register Button
                  ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () async {
                      await controller.register();
                    },
                    child: controller.isLoading.value
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text('Register'),
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
              ),
            ),
          );
        }),
      ),
    );
  }
}
