import 'package:demo/Screen/Auth%20Page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({super.key});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  final box = GetStorage();

  void _logout() {
    box.write('isLoggedIn', false);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("User Details"),
      //   backgroundColor: Colors.green.shade600,
      //   elevation: 0,
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.logout),
      //       onPressed: _logout,
      //       tooltip: 'Logout',
      //     )
      //   ],
      // ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 10, 60, 32)
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.green.shade200,
          //     Colors.green.shade700,
          //   ],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Login Successful",
                  style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _logout,
                    style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                    child: const Text(
                      "LOG OUT",
                      style: TextStyle(
                              color: Color.fromARGB(255, 10, 60, 32),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
