import 'package:db_crud_practice/controller/expense_controller.dart';
import 'package:db_crud_practice/model/expense_model.dart';
import 'package:db_crud_practice/utills/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddInDataBase extends StatefulWidget {
  const AddInDataBase({super.key});

  @override
  State<AddInDataBase> createState() => _AddInDataBaseState();
}

class _AddInDataBaseState extends State<AddInDataBase> {

  TextEditingController tcategory = TextEditingController();
  TextEditingController tamount = TextEditingController();
  TextEditingController tdate = TextEditingController();
  TextEditingController tstatus = TextEditingController();

  Map mapData = {};
  @override
  void initState() {
    super.initState();
    mapData = Get.arguments;

    if(mapData['option'] == 0)
      {
        int index = mapData['index'];
        tcategory = TextEditingController(text: control.dataList[index]['category'] );
        tamount = TextEditingController(text: "${control.dataList[index]['amount']}" );
        tdate = TextEditingController(text: control.dataList[index]['date'] );
        tstatus = TextEditingController(text: control.dataList[index]['status'] );
      }

  }



  ExpenseController control = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(title: Text("Add Data"),centerTitle: true,),


        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TabField(
                  title: "Amount",
                  controller: tamount,
                  inputType: TextInputType.number),
              TabField(
                  title: "Notes",
                  controller: tcategory,
                  inputType: TextInputType.text),

              // DropdownButton(items: control.categorylist.map((e) => DropdownMenuItem(child: Text("$e"),
              //   onTap: () {
              //
              // },)).toList(),
              //   value: control.categorylist.value,
              //   onChanged: (value) {
              //     control.selCategory.value = value;
              // },),
              TabField(
                  title: "Date",
                  controller: tdate,
                  inputType: TextInputType.text),
              TabField(
                  title: "Status",
                  controller: tstatus,
                  inputType: TextInputType.text),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () async {
                    DB_helper db_helper = DB_helper();

                    if(mapData['option'] == 1 )
                    {
                      ExpenseModel model = ExpenseModel(
                          category: tcategory.text,
                          amount: int.parse(tamount.text),
                          date: tdate.text,
                          status: tstatus.text);
                      await db_helper.insertInDB(model);
                    }
                    else
                      {
                        ExpenseModel model = ExpenseModel(
                            id: control.dataList[mapData['index']]['id'],
                            category: tcategory.text,
                            amount: int.parse(tamount.text),
                            date: tdate.text,
                            status: tstatus.text
                        );
                        await db_helper.updateDB(model);
                      }



                   await control.loadDB();
                    Get.back();
                  },
                  child: Text(
                    "ADD",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.indigo,
                        fontSize: 25),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget TabField({title, controller, inputType}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: controller,
          keyboardType: inputType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.w),
                borderSide: BorderSide(color: Colors.black12)),
            label: Text("$title"),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
