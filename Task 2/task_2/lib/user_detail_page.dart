import 'package:flutter/material.dart';
import 'package:task_2/user_model.dart';

class UserDetailPage extends StatelessWidget {
  final UserModel users;
  const UserDetailPage({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              child: Stack(
                children: [
                  Container(
                    width: screenWidth,
                    height: screenWidth,
                    color: Colors.grey.shade300,
                    child: Image.network(
                      users.image,
                      fit: BoxFit.cover,
                      width: screenWidth,
                      // height: screenWidth,
                    ),
                  ),
                  Positioned(
                    top: screenWidth - 125,
                    left: screenWidth / 2 - 80,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4.0),
                      ),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(users.image),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${users.firstName} ${users.lastName}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              users.email,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent
                    ),
                  ),
                  Text(
                    '${users.firstName} ${users.lastName}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Divider(color: Colors.deepPurpleAccent,),
                  SizedBox(height: 5),
                  Text(
                    'Email',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent
                    ),
                  ),
                  Text(
                    '${users.email}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Divider(color: Colors.deepPurpleAccent,),
                  SizedBox(height: 5),
                  Text(
                    'Username',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent
                    ),
                  ),
                  Text(
                    '${users.username}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Divider(color: Colors.deepPurpleAccent,),
                  SizedBox(height: 5),
                  Text(
                    'Password',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent
                    ),
                  ),
                  Text(
                    '${users.password}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Divider(color: Colors.deepPurpleAccent,),
                  SizedBox(height: 5),
                  Text(
                    'Phone No',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent
                    ),
                  ),
                  Text(
                    '${users.phone}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
