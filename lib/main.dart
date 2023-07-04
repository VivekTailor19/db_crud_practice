import 'package:db_crud_practice/screen/addData.dart';
import 'package:db_crud_practice/screen/homeScreen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) =>
            Sizer(
              builder: (context, orientation, deviceType) => GetMaterialApp(
                debugShowCheckedModeBanner: false,
                routes: {
                  "/":(p0) => HomeScreen(),
                  "/add":(p0) => AddInDataBase()
                },
        ),
      ),
    ),
  );
}
