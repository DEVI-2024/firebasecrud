
import 'package:flutter/material.dart';

import '../Models/todo.dart';

@immutable

abstract class TodoState{}

class TodoInitial extends TodoState{}

class TodoLoading extends TodoState{}

class TodoLoaded extends TodoState{
  late final List<Todo>? todos;
}

class TodoSuccess extends TodoState{
    final String? message;
  TodoSuccess(this.message);
}

class TodoError extends TodoState{
   final String? errormessage;
  TodoError(this.errormessage);
}