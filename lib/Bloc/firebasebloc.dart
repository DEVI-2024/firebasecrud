

import 'package:firebasebloc_crud/Bloc/firbaseeventbloc.dart';
import 'package:firebasebloc_crud/Bloc/firebasestatebloc.dart';

class TodoBloc extends Bloc<todoevent, TodoState>{

  final FirestoreService _firestoreService ;
   TodoBloc(this._firestoreService):super(TodoInitial());
    on<LoadTodos>((event, emit){
     try{
       emit(TodoLoading());
       final todos = await _firestoreService.getTodos().first;
       emit(TodoLoaded());
     }
  catch{
     emit(TodoError('Failed to get todos'))  ;
     }
  })

  on<LoadTodos>((event, emit){
  try{
  emit(TodoLoading());
  final todos = await _firestoreService.getTodos().first;
  emit(TodoLoaded());
  }
  catch{
  emit(TodoError('Failed to get todos'))  ;
  }
  });

}