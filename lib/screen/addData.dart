import 'package:db_crud_practice/utills/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddInDataBase extends StatefulWidget {
  const AddInDataBase({super.key});

  @override
  State<AddInDataBase> createState() => _AddInDataBaseState();
}

class _AddInDataBaseState extends State<AddInDataBase> {

  TextEditingController tnotes = TextEditingController();
  TextEditingController tamount = TextEditingController();
  TextEditingController tdate = TextEditingController();
  TextEditingController tstatus = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              TabField(title: "Amount",controller:tamount ,inputType:TextInputType.number ),
              TabField(title: "Notes",controller:tnotes ,inputType:TextInputType.text ),
              TabField(title: "Date",controller:tdate ,inputType:TextInputType.text ),
              TabField(title: "Status",controller:tstatus ,inputType:TextInputType.text ),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () {

                    DB_helper db_helper = DB_helper();
                    db_helper.insertInDB(
                      notes: tnotes.text,
                      amounts: int.parse(tamount.text),
                      dates: tdate.text,
                      statuss: tstatus.text
                    );

                  }, child: Text("ADD",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.indigo,fontSize: 25),))




            ],
          ),
        ),
      ),
    );
  }

  Widget TabField({title,controller,inputType}) {
    return Column(mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: tnotes,
                keyboardType: inputType,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("$title"),
                ),),
              SizedBox(height: 10),
            ],
          );
  }


}
