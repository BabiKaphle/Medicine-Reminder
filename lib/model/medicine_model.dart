
class MedicineModel {
  final int? id;
  final String name;
  final String dose;
  final DateTime time;


MedicineModel({
  this. id,
  required this.name,
  required this.dose,
  required this.time,
});

//convet to Map for DB
Map<String, dynamic> toMap(){
  return {
     'id': id,
    'name': name,
    'dose': dose,
     'time': time.toIso8601String(),
  };
}

//conver Map for medicineModel

factory MedicineModel.fromMap(Map<String, dynamic> map){
  return MedicineModel(
    id : map['id'],
    name: map['name'],
     dose: map['dose'],
      time: map['time'],
      );
}
}