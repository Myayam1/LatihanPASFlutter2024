import 'package:belajar_pas_flutter_terbaru_2024/services/auth_service.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  var isLoading = false.obs;
  var username = "".obs;
  var password = "".obs;
  var full_name = "".obs;
  var email = "".obs;
  var registrationSuccess = false.obs;
  var errorMessage = "".obs;
  var isObscured = true.obs;

  void changeObscured(){
    isObscured.value = !isObscured.value;
  }

  Future<void> register() async {
    isLoading.value = true;
    try {
      final response = await AuthService.register(username.value, password.value, full_name.value, email.value);

      if (response['status'] == true) {
        registrationSuccess.value = true;
        errorMessage.value = "";

        Get.snackbar("Registration Success", response['message']);
      } else {
        registrationSuccess.value = false;
        errorMessage.value = response['message'] ?? 'Registration failed';

        Get.snackbar("Error", errorMessage.value);
      }
    } catch (e) {
      registrationSuccess.value = false;
      errorMessage.value = "An error occurred: $e";
      
      Get.snackbar("Error", errorMessage.value);
    }
    isLoading.value = false;
  }
}