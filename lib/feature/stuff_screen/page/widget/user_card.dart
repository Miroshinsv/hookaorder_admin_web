import 'package:flutter/material.dart';
import 'package:hookahorder_admin_web/feature/stuff_screen/model/user_model.dart';

Widget userCardWidget(UserModel model) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Text("user id: ${model.id}"),
          Text("user name: ${model.name}"),
          Text("user phone: ${model.phone}"),
          Text("user email: ${model.email}"),
        ],
      ),
    ),
  );
}