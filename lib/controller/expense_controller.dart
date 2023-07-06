import 'dart:typed_data';

import 'package:db_crud_practice/utills/db_helper.dart';
import 'package:get/get.dart';

class ExpenseController extends GetxController
{

  RxList dataList = [].obs;

  Future<void> loadDB()
  async {
    dataList.value = await DB_helper.db_helper.readDB();
  }


  RxString imgPath = "".obs;

  Uint8List? imgByte;


}