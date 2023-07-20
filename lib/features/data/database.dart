import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{


  List todoList = [];


   // reference our box 
  final _myBox = Hive.box('my_box');

  // run this method if this is the 1st time ever opening this app
  void createInitalData(){
    todoList = [
      ["Make something", false]
    ];
  }

  // load the data from database
  void loadData(){
    todoList = _myBox.get('TODOLIST');
  }

  // update the database 
  void updateDataBase(){
    _myBox.put('TODOLIST', todoList);
  }
}