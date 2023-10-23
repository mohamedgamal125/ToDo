import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/screens/tasks/task_item.dart';
import 'package:todo/shared/firebase/firebase_functions.dart';
import 'package:todo/shared/style/colors.dart';

class TaskTab extends StatefulWidget {

  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  DateTime selectedDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: selectedDate,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date)  {
            setState(() {
              selectedDate=date;
            });
          },
          leftMargin: 50,
          monthColor:primaryColor,
          dayColor: primaryColor,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: primaryColor,
          dotsColor: Colors.white,
          selectableDayPredicate: (date) => true,
          locale: 'en',
        ),
        StreamBuilder(stream: FirebaseFunctions.getTasks(selectedDate), builder:(context, snapshot) {

            if(snapshot.connectionState==ConnectionState.waiting)
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            if(snapshot.hasError)
              return Center(child: Text("Something went Wrong"));

            List<TaskModel> tasks= snapshot.data?.docs.map((e) => e.data()).toList()??[];

            return Expanded(
              child: ListView.builder(
                  itemBuilder:(context, index) {
                   return TaskItem(taskModel: tasks[index],);
                  },
                itemCount: tasks.length,
              ),
            );

        },

        ),

      ],
    );
  }
}
