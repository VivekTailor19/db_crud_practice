import 'package:db_crud_practice/utills/db_helper.dart';
import 'package:get/get.dart';

class ExpenseController extends GetxController
{
  RxList<String> categorylist = <String>[
    'Food','Vehicle','Home','Study','Travel'
  ].obs;

  RxString selCategory = 'Food'.obs;

  List<String> paymentlist = [
    'Cash','Card','Online'
  ];

  RxString selPayMethod = 'Cash'.obs;

  RxList dataList = [].obs;

  Future<void> loadDB()
  async {
    dataList.value = await DB_helper.db_helper.readDB();
  }


}