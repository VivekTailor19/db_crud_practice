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


}