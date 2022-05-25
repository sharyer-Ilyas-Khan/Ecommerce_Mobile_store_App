


import 'package:mobile_app/Screens/Dashboard.dart';
import 'login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user.dart';

class Wraper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user= Provider.of<User>(context);
    if(user==null){
      return Dashboard();
    }
    else
      {
        print(user.uid);
        return Dashboard();
      }
  }
}
