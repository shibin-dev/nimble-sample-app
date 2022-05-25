import 'package:flutter/material.dart';
import 'package:nimble_app/models/usermodel.dart';
import 'package:nimble_app/pages/authpage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final String name;
  final String password;
  const HomePage(this.name,this.password,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(name),
            Text(password),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthPage(),
                    )),
                child: const Text("LogOut"))
          ],
        ),
      ),
    );
  }
}
