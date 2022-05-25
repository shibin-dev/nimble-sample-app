import 'package:flutter/material.dart';
import 'package:nimble_app/models/usermodel.dart';
import 'package:nimble_app/pages/authpage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: Column(
          children: [
            // Text(userDetail.username!),
            // Text(userDetail.password!),
            SizedBox(height: 30,),
               ElevatedButton(
                onPressed: () =>
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthPage(),)),
                child: const Text("LogOut"))
          ],
        ),
      ),
    );
  }
}
