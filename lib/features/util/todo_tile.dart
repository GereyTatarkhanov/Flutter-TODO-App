import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../data/database.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {

   ToDoTile({super.key, required this.taskName,required this.taskCompleted,  required this.onChanged, required this.deleteFunction });

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;


   ToDoDatabase db = ToDoDatabase();

    void checkBoxChanged(bool? value, int index){
        db.todoList[index][1] = !db.todoList[index][1];
      db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.pink,
              borderRadius: BorderRadius.circular(12),
              )
          ]
          ),
          child: Container( 
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
             child:  Row(
               children: [
                  //CheckBox
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      value: taskCompleted, 
                      onChanged: onChanged,
                      activeColor: Colors.pink,
                      ),
                  ),
            
                  // Task Name
                  Text(
                    taskName.toUpperCase(),
                    style:  TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      decoration: taskCompleted 
                      ? TextDecoration.lineThrough 
                      : TextDecoration.none
                    ),
                    ),
               ],
             ),
          ),
        ),
      );
  }
}