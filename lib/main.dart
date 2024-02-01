import 'package:firebase_core/firebase_core.dart';
import 'package:firebasebloc_crud/screens/HomeScreen.dart';
import 'package:firebasebloc_crud/services/todoservice.dart';
import 'package:firebasebloc_crud/src/helper/navigator.dart';
import 'package:firebasebloc_crud/src/view/todo_list.dart';
import 'package:firebasebloc_crud/src/viewmodel/todo_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
//import 'firebase_options.dart';
import 'Bloc/firebasebloc.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider<TodoViewModel>(
          create: (_) => TodoViewModel(NavigationService.instance)),
        BlocProvider<TodoBloc>(
          create: (context) => TodoBloc(FirestoreService()),
        ),
    ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //home: const TodoList(),
        home: const HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


