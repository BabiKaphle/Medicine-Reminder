// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:sec_med_rem/model/medicine_model.dart';

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
  
}
