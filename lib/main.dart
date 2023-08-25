import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/BlocObserver.dart';
import 'package:first_app/cubit/my_app_cubit.dart';
import 'package:first_app/firebase_options.dart';
import 'package:first_app/ui/screen/Register.dart';
import 'package:first_app/ui/screen/home_page.dart';
import 'package:first_app/ui/screen/login.dart';
import 'package:first_app/ui/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    BlocProvider(
        create:(context) => AppCubitA()..getDataFromFirebase(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent
        ),
      ),
      home: user == null ? Login(): const MyHomePage3(),
    );
  }
}

class MyHomePage3 extends StatefulWidget {
  const MyHomePage3({super.key});

  @override
  State<MyHomePage3> createState() => _MyHomePage3State();
}

class _MyHomePage3State extends State<MyHomePage3> {
  int currentIndex=0;

  void getPage(int index){
    setState(() {
      currentIndex=index;
    });
  }

  List<Widget> screen=[
    const MyHomePage(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
        bottomSheet: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.deepPurple,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: BottomNavigationBar(
            selectedItemColor: Colors.grey,
            unselectedItemColor: Colors.white,
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: currentIndex,
            onTap: (index){
              getPage(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
            ],
          ),
        ),
    );
  }
}
