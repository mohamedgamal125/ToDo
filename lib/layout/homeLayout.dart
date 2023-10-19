import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {

  static const String routeName="layout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text("ToDo"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {

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
    );
  }
}
