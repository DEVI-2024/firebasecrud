
import 'package:flutter/cupertino.dart';

import '../Models/todo.dart';

@immutable
abstract class todoevent{}

 class LoadTodos extends todoevent{}

class AddTodo extends todoevent{
  late final Todo _todo;
}

class UpdateTodo extends todoevent{
  late final Todo _todo;

}

class DeleteTodo extends todoevent{
  late final Todo _todo;
}