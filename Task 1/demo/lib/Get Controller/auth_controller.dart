import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../Model/auth_model.dart';

class AuthController extends GetxController {
  final box = GetStorage();

  // Store the user information in storage after sign-up
  void store(String username, String email, String password) {
    final user = AuthModel(userName: username, password: password, email: email);
    box.write('user', user.toMap());
  }

  // Authenticate user during login
  bool login(String username, String password) {
    final storedUser = box.read('user');
    if (storedUser != null) {
      final user = AuthModel.fromMap(storedUser);
      return user.userName == username && user.password == password;
    }
    return false;
  }
}
