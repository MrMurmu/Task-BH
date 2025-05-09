import 'dart:convert';

import 'package:get/get.dart';
import 'package:task_2/user_model.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  var userList = <UserModel>[].obs;

  Future<void> getUser()async{
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/users'));
      if(response.statusCode == 200){
        var data = jsonDecode(response.body)['users']  as List;
        userList.value = data.map((e)=>UserModel.fromMap(e)).toList();
      }else{
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error $e');
    }
  }
}