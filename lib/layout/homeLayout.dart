import 'package:flutter/material.dart';
import 'package:todo/screens/settings/settings.dart';
import 'package:todo/screens/tasks/addTaskBottom.dart';
import 'package:todo/screens/tasks/tasks_tab.dart';

class HomeLayout extends StatefulWidget {

  static const String routeName="layout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index=0;
  List<Widget>tab=[

    TaskTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text("ToDo"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
            showSheet();
        },

        child: Icon(Icons.add),
        shape: CircleBorder(
          side: BorderSide(
            color: Colors.white,
            width: 4
          )
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8 ,
        color: Colors.white,
        shape: CircularNotchedRectangle(

        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onTap:(value) {

            index=value;
            setState(() {

            });
          },
          currentIndex: index,
          items: [
            BottomNavigationBarItem(icon:Icon(Icons.list) ,label: ""),
            BottomNavigationBarItem(icon:Icon(Icons.settings) ,label: ""),
          ],
        ),
      ),
      body: tab[index],
    );
  }
  void   showSheet(){
    showModalBottomSheet(context: context,
        isScrollControlled: true,
        builder:(context) {

          return Padding(
            padding:  EdgeInsets.only(
              bottom:MediaQuery.of(context).viewInsets.bottom
            ),
            child: AddTaskBottom(),
          );
        },
    );
  }
}
