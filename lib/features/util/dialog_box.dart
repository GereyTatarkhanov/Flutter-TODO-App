import 'package:flutter/material.dart';
import 'package:todo_app/features/util/my_button.dart';


// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

 

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.indigo[400],
      content:  SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
             TextField(
              controller: controller ,
              style: const TextStyle(
                color: Colors.white
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task"
              ),
              
            ),
            //buttons -> save + cancel 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // save button
                  MyButton(
                    text: 'Save', 
                    onPressed: onSave
                    ),
                    const SizedBox(width: 7,),
                  MyButton(
                    text: 'Cancel', 
                    onPressed: onCancel
                    ),
                // cancel button
              ],
            )
          ],
        ),
        ),
    );
  }
}