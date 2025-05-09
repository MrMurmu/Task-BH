import 'package:demo/Screen/Auth%20Page/login_page.dart';
import 'package:demo/Screen/user_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    bool isLoggedIn = box.read('isLoggedIn') ?? false;

    // Navigate to the appropriate page based on login state
    return isLoggedIn ? UserDetailPage() : LoginPage();
  }
}