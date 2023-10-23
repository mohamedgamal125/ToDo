import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/shared/firebase/firebase_functions.dart';
import 'package:todo/shared/style/colors.dart';
import 'editTaskTab.dart';

class TaskItem extends StatelessWidget {

  TaskModel taskModel;

  TaskItem({required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:18,vertical: 8 ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18 )
        ),
        child: Slidable(
          startActionPane: ActionPane(motion: DrawerMotion(),
            children:[
              SlidableAction(
                onPressed: (context) {

                  FirebaseFunctions.deleteTask(taskModel.id);
                },
                label: "Delete",
                icon: Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(18) ,bottomLeft: Radius.circular(18)
                ),
              ),
              SlidableAction(
                onPressed: (context) {
                  //FirebaseFunctions.updateTask(taskModel);
                 Navigator.pushNamed(context,

                   EditTask.routeName,
                   arguments: taskModel,
                 );
                },
                label: "Edit",
                icon: Icons.edit,
                backgroundColor: Colors.blue,
                borderRadius: BorderRadius.only(
                    topRight:Radius.circular(18) ,bottomRight: Radius.circular(18)
                ),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                Container(
                  height:80 ,
                  width: 3,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${taskModel.title}"),

                      Text("${taskModel.description}"),



                    ],
                  ),
                ),
                Spacer(),


                taskModel.isDone?
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 18,vertical: 1),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Text("Done!",style: TextStyle(
                      color: Colors.white
                    ),)
                )
                :InkWell(
                  onTap: () {

                    taskModel.isDone=true;
                    FirebaseFunctions.updateTask(taskModel);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18,vertical: 1),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                      child: Icon(Icons.done,color: Colors.white,)
                      ),
                ),

              ],
            ),
          ),
        ),
      ),
    ) ;
  }
}



