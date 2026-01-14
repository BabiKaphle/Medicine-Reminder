// ignore_for_file: unused_local_variable, await_only_futures

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sec_med_rem/provider/medicine_provider.dart';
import 'package:sec_med_rem/screens/home_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main()async {
   WidgetsFlutterBinding.ensureInitialized();
  //   // Initialize timezone package
  tz.initializeTimeZones();
  final String timeZoneName = await tz.local.name;
  tz.setLocalLocation(tz.getLocation(timeZoneName));
   
     // Android initialization
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

/*  // iOS initialization
  final DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings();*/

    // Combine platform settings
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
   // iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  
      
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

