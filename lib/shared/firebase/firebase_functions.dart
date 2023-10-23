import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';

class FirebaseFunctions{


static  CollectionReference<TaskModel> getTasksCollection(){
   return FirebaseFirestore.instance.
    collection("Tasks").
    withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();

      },
    );
  }

 static Future<void> addTask(TaskModel taskModel){

    var collection=getTasksCollection();
    var docRef=collection.doc();
    taskModel.id=docRef.id;
  return  docRef.set(taskModel);

  }


static Stream<QuerySnapshot<TaskModel>> getTasks(
    DateTime dateTime
    ){
      return getTasksCollection().where(
          "date",
          isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch
      ).orderBy("title",descending: true).snapshots();
  }


 static void  deleteTask(String id)
  {

    getTasksCollection().doc(id).delete();

  }

  static Future<void> updateTask(TaskModel task)
  async{
   await getTasksCollection().doc(task.id).update(task.toJson());
  }
}