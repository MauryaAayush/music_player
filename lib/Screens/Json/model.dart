// // Create a class
// class DataModel {
//
//   // Create various as [per files in map
//   String? name;
//   int? age;
//
//   // when any key hold another Map
//   Address? address;
//
//   // When any key hold list
//   List<Phone>? phone;
//
//   // create a default constructor to initialize global variable / form map to global variable
//   DataModel({this.name, this.age, this.address,this.phone});
//
//   // 05.create factory constructor to convert Mpa into object
//   factory DataModel.fromJson(Map json) {
//     return DataModel(
//         name: json['name'],
//         age: json['age'],
//
//         // call method fromJson form created class
//         address: Address.fromJson(json['address']),
//
//         // call method fromJson from Phone class
//         phone : json['phone'].map<Phone>((i) => Phone.fromJson(i)).toList(),
//
//
//     );
//   }
// }
//
// class Address {
//   int? no;
//   int? pin;
//   String? home;
//   String? Street;
//   String? city;
//
//   Address({this.no, this.home, this.city, this.pin, this.Street});
//
//   factory Address.fromJson(Map json) {
//     return Address(
//       home: json['home'],
//       city: json['city'],
//       no: json['no'],
//       pin: json['pin'],
//       Street: json['Street'],
//     );
//   }
// }
//
//
// class Phone {
//   String? type;
//   int? number;
//
//   Phone({this.number, this.type});
//
//   factory Phone.fromJson(Map json){
//     return Phone(number: json['number'], type: json['type']);
//   }
// }