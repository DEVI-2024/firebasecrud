import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebasebloc_crud/screens/HomeScreen.dart';
import 'package:firebasebloc_crud/services/PushnotificationService.dart';
import 'package:firebasebloc_crud/services/todoservice.dart';
import 'package:firebasebloc_crud/src/helper/navigator.dart';
import 'package:firebasebloc_crud/src/viewmodel/todo_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'Bloc/firebasebloc.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  // options: DefaultFirebaseOptions.currentPlatform,
  );
  await PushNotificationService().initNotification();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final PushNotificationService _notificationService = PushNotificationService();
   MyApp({super.key});

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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


