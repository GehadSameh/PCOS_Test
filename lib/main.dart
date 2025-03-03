import 'package:firebase_project/firebase_options.dart';
import 'package:firebase_project/views/login_view.dart';
import 'package:firebase_project/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PCOS Classifier',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        
      
      home: HomeView(),

      routes: {
        'login':(context)=>LoginView(),
        'home':(context)=>HomeView(),
        'register':(context)=>RegisterView(),
        
      },
      
     );
  }
}
