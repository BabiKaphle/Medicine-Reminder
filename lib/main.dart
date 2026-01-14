import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sec_med_rem/provider/medicine_provider.dart';
import 'package:sec_med_rem/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
       ChangeNotifierProvider(
      create:(_) => MedicineProvider(),
       ),
    
      ],
        child: const MyApp()),
    );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medicine Reminder',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomeScreen(),
    );
  }
}

