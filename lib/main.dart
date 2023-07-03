import 'package:db_crud_practice/screen/addData.dart';
import 'package:db_crud_practice/screen/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(p0) => HomeScreen(),
        "/add":(p0) => AddInDataBase()
      },
    ),
  );
}
