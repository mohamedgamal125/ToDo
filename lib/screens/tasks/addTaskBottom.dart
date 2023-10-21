import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/shared/firebase/firebase_functions.dart';
import 'package:todo/shared/style/colors.dart';

class AddTaskBottom extends StatefulWidget {
  @override
  State<AddTaskBottom> createState() => _AddTaskBottomState();
}

class _AddTaskBottomState extends State<AddTaskBottom> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  var selectedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Add New Task",

            style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
                label: Text("Task Title"),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primaryColor))),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
                label: Text("Task description"),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primaryColor))),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Select Data",
            style: GoogleFonts.poppins(
                fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              selectData();
            },
            child: Text(selectedDate.toString().substring(0,10),
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500,color: primaryColor),
            ),
          ),
          SizedBox(
            height: 10,
          ),

          ElevatedButton(onPressed: (){
            TaskModel taskModel=TaskModel(title: titleController.text
                , description: descriptionController.text, date: selectedDate.microsecondsSinceEpoch);
            FirebaseFunctions.addTask(taskModel)
            .then((value){
              Navigator.pop(context);
            });
          },
              child: Text("Add Task")

          )
        ],
      ),
    );
  }

  selectData()async{
 DateTime? chosenDate=  await showDatePicker(
        context: context,
        initialDate:selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))
    );

    if(chosenDate==null)
      return;

    selectedDate=chosenDate;
    setState(() {

    });
  }
}
