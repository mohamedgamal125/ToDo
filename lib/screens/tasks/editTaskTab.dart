import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/layout/homeLayout.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/shared/firebase/firebase_functions.dart';
import 'package:todo/shared/style/colors.dart';

class EditTask extends StatefulWidget {
  const EditTask({Key? key}) : super(key: key);
  static const String routeName="EditTask";

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {


  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  var selectedDate=DateTime.now();
  var formKey1=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as TaskModel;
    titleController.text=args.title;
    descriptionController.text=args.description;
    // print("============================================================\n");
    // print("${args.id}\n${args.title}\n${args.description}\n${args.date}\n${args.isDone}");
    return Scaffold(
      extendBody: true,
    resizeToAvoidBottomInset: true,
    appBar: AppBar(
    title: Text("ToDo"),
    ),


      body: Form(
        key: formKey1,
        child: Column(

          children: [
            Text("Edit Task",

              style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator:(value) {
                if(value == null || value.isEmpty)
                {
                  return"Please Enter Task Title";
                }
                return null;
              },
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
              validator:(value) {
                if(value == null || value.isEmpty)
                {
                  return"Please Enter Task Description";
                }
                return null;
              },
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

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                if(formKey1.currentState!.validate())
                {
                  TaskModel taskModel=TaskModel(id: args.id,isDone: args.isDone,title: titleController.text
                      , description: descriptionController.text,
                      date: DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch);
                  // print("============================================================\n");
                  // print("${args.id}\n${args.title}\n${args.description}\n${args.date}\n${args.isDone}");
                  FirebaseFunctions.updateTask(taskModel)
                      .then((value){
                    Navigator.pushNamed(context, HomeLayout.routeName);
                  });

                }


              },
                  child: Text("Save Changes")

              ),
            )
          ],
        ),
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
