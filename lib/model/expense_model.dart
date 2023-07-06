
import 'package:flutter/services.dart';

class ExpenseModel
{
  int? id,amount;
  String? category,status,date;
  Uint8List? img;

  ExpenseModel({this.id, this.amount, this.category, this.status,this.date,this.img});
}