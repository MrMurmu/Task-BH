import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:task_2/home_page.dart';
import 'package:task_2/user_detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      // home: UserDetailPage(users: ,),
    );
  }
}