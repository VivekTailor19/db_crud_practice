import 'package:db_crud_practice/controller/expense_controller.dart';
import 'package:db_crud_practice/model/expense_model.dart';
import 'package:db_crud_practice/utills/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ExpenseController control = Get.put(ExpenseController());

  @override
  void initState() {
    super.initState();
    control.loadDB();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:  Obx(
            () =>  ListView.builder(
                itemCount: control.dataList.length,
                itemBuilder: (context, index) {
                return  GestureDetector(

                  onDoubleTap: () async {
                    DB_helper db_helper = DB_helper();
                   int delId = control.dataList[index]['id'];
                  await  db_helper.deleteDB(delId);
                  await  control.loadDB();
                  },


                  onLongPress: () {
                    Get.toNamed("/add",arguments: {"option":0,"index":index});
                  },

                  child: ListTile(
                      leading: CircleAvatar(backgroundImage: MemoryImage(control.dataList[index]['img']),radius: 30,),
                      title: Text("${control.dataList[index]['category']}"),
                      subtitle: Text("${control.dataList[index]['amount']}"),
                      trailing: Text("${control.dataList[index]['status']}"),
                  ),
                );
              },
              ),
          ),

        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed("/add",arguments: {"option":1,"index":null});
          },
          child: Icon(Icons.add,size:25,color: Colors.amber),
        ),
      ),
    );
  }
}
