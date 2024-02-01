

import 'package:firebasebloc_crud/Bloc/firbaseeventbloc.dart';
import 'package:firebasebloc_crud/Bloc/firebasestatebloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/todoservice.dart';


class TodoBloc extends Bloc<todoevent, TodoState>{
  final FirestoreService _firestoreService ;
   TodoBloc(this._firestoreService):super(TodoInitial()){

    on<LoadTodos>((event, emit) async {
      try {
        emit(TodoLoading());
        final todos = await _firestoreService.getTodos().first;
        emit(TodoLoaded(todos));
      }
      catch (e){
        emit(TodoError('Failed to get todos'));
      }
    });
    on<AddTodo>((event, emit) async {
      try {
        emit(TodoLoading());
        await _firestoreService.addTodo(event.todo);
        emit(TodoSuccess('Todo added successfully.'));
      } catch (e) {
        emit(TodoError('Failed to add todo.'));
      }
    });

    on<UpdateTodo>((event, emit)  async {
      try {
        emit(TodoLoading());
        await _firestoreService.updateTodo(event.todo);
        emit(TodoSuccess('Todo updated successfully.'));
      } catch (e) {
        emit(TodoError('Failed to update todo.'));
      }
    });

    on<DeleteTodo>((event, emit) async {
      try {
        emit(TodoLoading());
        await _firestoreService.deleteTodo(event.todo);
        emit(TodoSuccess('Todo deleted successfully.'));
      } catch (e) {
        emit(TodoError('Failed to delete todo.'));
      }
    });

   }
}

