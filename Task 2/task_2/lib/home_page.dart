import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:task_2/api_controller.dart';
import 'package:task_2/user_detail_page.dart';
import 'package:task_2/user_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    final apiController = Get.put(ApiController());
    apiController.getUser();
    return Scaffold(
      body: Obx((){
        if (apiController.userList.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: apiController.userList.length,
          itemBuilder: (context, index){
            UserModel users = apiController.userList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDetailPage(users: users)));
                },
                child: Card(
                  child: ListTile(
                    leading: (users.image.isNotEmpty)? CircleAvatar(backgroundImage: NetworkImage(users.image),):null,
                    title: Row(
                      children: [
                        Text(users.firstName),
                        SizedBox(width: 10),
                        Text(users.lastName),
                      ],
                    ),
                    subtitle: Text(users.email),
                    trailing: Icon(Icons.camera_alt_outlined),
                  ),
                ),
              ),
            );
        });
      }),
    );
  }
}