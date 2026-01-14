// ignore_for_file: unused_element
import 'package:flutter/material.dart';
import 'package:sec_med_rem/model/medicine_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sec_med_rem/main.dart';
import 'package:timezone/timezone.dart' as tz;

class MedicineProvider extends ChangeNotifier{
  final List<MedicineModel> _medicines = [];
    TimeOfDay? _selectedTime;

//to store madicine
  List<MedicineModel> get medicines{
    _medicines.sort((a,b) => a.time.compareTo(b.time));
    return _medicines;
  }

//To store time

  TimeOfDay? get selectedTime => _selectedTime;

  //Method to update the selecte Time
  void pickTime(TimeOfDay time){
    _selectedTime = time;
    notifyListeners();
      }


//To add medicines
  void addMedicine (MedicineModel medicine){
    _medicines.add(medicine);
    notifyListeners();
  }
// To remove
void removeMedicine(MedicineModel medicine){
  _medicines.remove(medicine);
  notifyListeners();
}

// Show notification immediately (for testing)
Future<void> showNotification(String title, String body) async {
  await flutterLocalNotificationsPlugin.show(
    0, // notification id
    title,
    body,
    NotificationDetails(
      android: AndroidNotificationDetails(
        'medicine_channel',
        'Medicine Notifications',
        channelDescription: 'Reminder for your medicines',
        importance: Importance.max,
        priority: Priority.high,
      ),
    ),
  );
}
  
//Notification 
Future<void> scheduleNotification(MedicineModel medicine) async{
  final now = tz.TZDateTime.now(tz.local);

 //Time for today medicine 
   tz.TZDateTime scheduledDate = tz.TZDateTime(   
    tz.local,
    now.year,
    now.month,
    now.day,
    medicine.time.hour,
    medicine.time.minute,
  );
  // If the scheduled time has already passed today, schedule for tomorrow
    if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }

    await flutterLocalNotificationsPlugin.zonedSchedule(
      medicine.id ?? _medicines.indexOf(medicine),
      'Medicine Reminder',
      'Time to take ${medicine.name} (${medicine.dose})',
        scheduledDate,
      
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'medicine_channel', 
          'Medicine Notifications',
          channelDescription: 'Reminder for your medicines',
          importance: Importance.max,
          priority: Priority.high,
        ),
       // iOS: DarwinNotificationDetails(),
        ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      
    );
}
}
