import 'package:flutter/material.dart';
import 'package:nimble_app/api/authapi.dart';
import 'package:nimble_app/models/usermodel.dart';
import 'package:nimble_app/pages/homepage.dart';
import 'package:nimble_app/widgets/customtextfield.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController namectrl = TextEditingController();
  TextEditingController pasCtrl = TextEditingController();

  @override
  void initState() {
    fetchUserList();
    super.initState();
  }

  fetchUserList() {
    Provider.of<AuthApi>(context, listen: false).getUsers();
  }

  void saveFoirm() {
    String name = namectrl.text.trim();
    String password = pasCtrl.text.trim();
    List<UserModel> users = Provider.of<AuthApi>(context, listen: false).users;
    users.forEach((element) {
      if (element.username == name && element.password == password) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                name,
                password,
              ),
            ));
      } else {
        print("popup area");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final api = Provider.of<AuthApi>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              textCtrller: namectrl,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              textCtrller: pasCtrl,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: saveFoirm, child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
