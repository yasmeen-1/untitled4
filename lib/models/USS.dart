import 'dart:convert';

class USS {
  String idprojectsApplies;
  String idprojects;
  String idusers;
  String idstatus;
  String userRate;

  USS({
    required this.idprojectsApplies,
    required this.idprojects,
    required this.idusers,
    required this.idstatus,
    required this.userRate,
  });
  factory USS.fromJson(Map<String, dynamic> json) => USS(
        idprojectsApplies: json['idprojectsApplies'],
        idstatus: json['idstatus'],
        idusers: json['idusers'],
        userRate: json['userRate'],
        idprojects: json['idprojects'],

        //   specializationName: json['specializationName'],
        //   userFullName: json['userFullName'], // companyName: '',
      );

  Map<String, dynamic> toJson() => {
        'idprojectsApplies': idprojectsApplies,
        'idstatus': idstatus,
        'idusers': idusers,
        'userRate': userRate,
        'idprojects': idprojects,

        // 'specializationName': specializationName,
        //  'userFullName': userFullName
      };
}
