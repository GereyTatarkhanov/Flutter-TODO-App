import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/features/data/database.dart';
import 'package:todo_app/features/util/dialog_box.dart';

import 'util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _myBox = Hive.box('my_box');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
   // this is 1st time ever opening the app then create default data
   if(_myBox.get('TODOLIST') == null){
    db.createInitalData();
   }else{
    //there are already exists data
    db.loadData();
   }
    super.initState();
  }

  // text controller
  final _controller = TextEditingController();



  // checkBox was tapped

  void checkBoxChanged(bool? value, int index){
      setState(() {
        db.todoList[index][1] = !db.todoList[index][1];
      });
      db.updateDataBase();
  }


  // save a new task

  void saveNewTask(){
     setState(() {
        db.todoList.add([_controller.text, false]);
        _controller.clear();
     });

    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // create a new task
  void createNewTask(){
    showDialog(
      context: context, 
      builder: (context){
        return  DialogBox(
          controller: _controller,
          onSave: saveNewTask ,
          onCancel: () => Navigator.of(context).pop(),
          );
      }
      );
       db.updateDataBase();
  }

  // delete the task
  void deleteTask(int index){
      setState(() {
        db.todoList.removeAt(index);
      });
      db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TO DO"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
        
            taskName: db.todoList[index][0], 
            taskCompleted: db.todoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (contex) => deleteTask(index),
            );
        }
        )
    );
        
  }
}