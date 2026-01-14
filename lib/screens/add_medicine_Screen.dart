// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sec_med_rem/model/medicine_model.dart';
import 'package:sec_med_rem/provider/medicine_provider.dart';
import 'package:sec_med_rem/widgets/custom_text_field.dart';
import 'package:sec_med_rem/widgets/custome_button.dart';
import 'package:sec_med_rem/widgets/custome_time_picker.dart';

class AddMedicineScreen extends StatefulWidget {

  const AddMedicineScreen({super.key,});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController doseController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MedicineProvider>(context);
    Future<void> pickTime()async{
    final time = await showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now(),
      );
      if(time != null) provider.pickTime(time);
  }
     
     void _saveMedicine(){
      final name = nameController.text.trim();
      final dose = doseController.text.trim();
      final time = provider.selectedTime;
    
      if(name.isEmpty || dose.isEmpty || time == null){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all fields and selecte time')),
        );
        return ;
      }

      final now = DateTime.now();
      final dateTime = DateTime(
        now.year,
        now.month,
        now.day,
        provider.selectedTime!.hour,
        provider.selectedTime!.minute,
      );


     final medicine = MedicineModel(
      name: name, 
      dose: dose, 
      time: dateTime);
      
      provider.addMedicine(medicine);
      Navigator.pop(context);  
      
     }
     

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(child: const Text("Add Medicine")),
      ),
      body: SafeArea(
       
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
            Custometextfield(controller: nameController, labelText: 'Medicine Name'),
            const SizedBox(height: 12),
          
            Custometextfield(controller: doseController, labelText: 'Dose') ,                
            const SizedBox(height: 18), 
           
            CustomeTimePicker(selectedTime:provider.selectedTime, onpickTime: pickTime,  buttonColor: Colors.orange.shade200,
            timeTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
           
            const SizedBox(height: 30),
          
            CustomeButton(title: 'Save Medicine', onPressed: _saveMedicine),
            ],
          ),
        )),
    );
  }
}