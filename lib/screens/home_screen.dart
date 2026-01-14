import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sec_med_rem/provider/medicine_provider.dart';
import 'package:sec_med_rem/screens/add_medicine_Screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<MedicineProvider>(context);

    return Scaffold(
       backgroundColor: Colors.teal,
      body: SafeArea(
        child: Stack(
       
        children: [
          Container(color: Colors.teal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40,
            vertical: 50),
            child: Row(  
              children: [
                  Flexible(
                    child: Text("Every dose brings you closer to wellness",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight:FontWeight.bold,
                      
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          color: Colors.black45,
                        ),
                      ]
                    ),
                    ),
                    
                   
                    
                  ),
                   Icon(
                    Icons.alarm_add_sharp,
                    color: Colors.black,
                    size: MediaQuery.of(context).size.width*0.15,),
                   const SizedBox(width:10,),  
             
              ],
            ),
            
          ),
         
        
          ),
          
           Align(alignment: Alignment.bottomCenter,
             child: ClipRRect(
               borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(30.0),
                 topRight: Radius.circular(30.0),
               ),
               child: Container(
                height: MediaQuery.of(context).size.height*0.6,
                   color: Colors.white,
                   child: provider.medicines.isEmpty? 
                   const Center(
                     child: Text('No medicines added',
                     style: TextStyle(color: Colors.black,
                     ),),
                   ) 
                   : Expanded(
                     child: ListView.builder(
                       itemCount: provider.medicines.length,
                       itemBuilder:(context, index){
                         final med = provider.medicines[index];
                         return ListTile(
                           leading: const Icon(Icons.medication,
                           color: Colors.teal),
                         title: Text(med.name),
                         subtitle: Text(med.dose),
                         trailing: Row(
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             Text(
                               "${med.time.hour}:${med.time.minute.toString().padLeft(2,'0')}",
                             style: const TextStyle(color: Colors.teal)
                             ),
                     
                             //Adding Remove
                             IconButton(
                              icon: const Icon (Icons.delete, color: Colors.red),
                               onPressed: (){
                                 provider.removeMedicine(med);
                                 },
                             ),
                           ],
                         ),
                         );
                       }),
                   ),
                 ),
             ),
           ),
          
        ],
      )
      ,),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.add,
        size:25),
        onPressed: (){
          Navigator.push(context,
          MaterialPageRoute(builder: (_) => const AddMedicineScreen()),);
          
        }),
    );
  }
}