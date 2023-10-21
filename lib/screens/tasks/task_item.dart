import 'package:flutter/material.dart';
import 'package:todo/shared/style/colors.dart';

class TaskItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:18,vertical: 8 ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18 )
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
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
                    Text("Task Title"),

                    Text("Task Description"),



                  ],
                ),
              ),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.done ))
            ],
          ),
        ),
      ),
    ) ;
  }
}
