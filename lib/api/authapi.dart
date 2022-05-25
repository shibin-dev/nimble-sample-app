import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/usermodel.dart';

class AuthApi with ChangeNotifier {
  static String baseUrl = 'https://randomuser.me/api/?results=5';
  List<UserModel> users = [];
  Future<void> getUsers() async {
    try {
      var url = Uri.parse(baseUrl);
      var response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      // print(response.body);
      users = [];
      if (response.statusCode == 200) {
        extractedData.forEach((key, value) {
          if (key == 'results') {
            final List<dynamic> usersList = value;
            usersList.forEach((element) {
              final login = element["login"];
              users.add(UserModel(
                  username: login["username"], password: login["password"]));
            });
          }
        });
      }
      notifyListeners();
      users.forEach((element) {
        print("name ${element.username}");
        print(element.password);
      });
      //return users;
    } catch (e) {
      log(e.toString());
    }
  }
}
