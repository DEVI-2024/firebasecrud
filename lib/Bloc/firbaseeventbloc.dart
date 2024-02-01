
import 'package:flutter/cupertino.dart';

import '../Models/todo.dart';

@immutable
abstract class todoevent {}

 class LoadTodos extends todoevent{}

class AddTodo extends todoevent{
   final Todo todo;
  AddTodo(this.todo);
}

class UpdateTodo extends todoevent{
  final Todo todo;
  UpdateTodo(this.todo);

}

class DeleteTodo extends todoevent{
   final String todo;

  DeleteTodo(this.todo);

}