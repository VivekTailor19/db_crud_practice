import 'package:db_crud_practice/controller/expense_controller.dart';
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
                return  ListTile(
                    leading: Text("${control.dataList[index]['id']}"),
                    title: Text("${control.dataList[index]['category']}"),
                    subtitle: Text("${control.dataList[index]['amount']}"),
                    trailing: Text("${control.dataList[index]['status']}"),


                );
              },
              ),
          ),

        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed("/add");
          },
          child: Icon(Icons.add,size:25,color: Colors.amber),
        ),
      ),
    );
  }
}
