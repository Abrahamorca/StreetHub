import 'package:flutter/material.dart';
import 'package:g3_project/models/user.dart';
import 'package:g3_project/screens/Login/sign_in.dart';
import 'package:provider/provider.dart';
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel?>(context);
    return const SignIn();
  }
}