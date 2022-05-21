import 'dart:convert';

class Book {
  final String idprojects;
  final String projectName;
  final String projectDescription;
  final String maxNbUsers;
  final String price;
  final String idspecialization;
  final String idusers;
//  final String idcompanies;
// final String specializationName;
  // final String companyName;
//  final String companyLogo;
  //final String userFullName;
  final String projectDate;
  final String projectTypeWork;

  const Book(
      {required this.idprojects,
      required this.projectName,
      required this.projectDescription,
      required this.maxNbUsers,
      required this.price,
      required this.idspecialization,
      required this.idusers,
      //  required this.idcompanies,
      //  required this.specializationName,
      //    required this.companyName,
      //  required this.companyLogo,
      //  required this.userFullName,
      required this.projectDate,
      required this.projectTypeWork});
  factory Book.fromJson(Map<String, dynamic> json) => Book(
        price: json['price'],
        // companyLogo: json['companyLogo'],
        //    companyName: json['companyName'],
        // idcompanies: json['idcompanies'],
        idprojects: json['idprojects'],
        idspecialization: json['idspecialization'],
        idusers: json['idusers'],
        maxNbUsers: json['max_nb_users'],
        projectDate: json['project_date'],
        projectDescription: json['project_description'],
        projectName: json['project_name'],
        projectTypeWork: json['project_type_work'],
        //   specializationName: json['specializationName'],
        //   userFullName: json['userFullName'], // companyName: '',
      );

  Map<String, dynamic> toJson() => {
        'price': price,
        // 'companyLogo': companyLogo,
        //  'companyName': companyName,
        //  'idcompanies': idcompanies,
        'idprojects': idprojects,
        'idspecialization': idspecialization,
        'idusers': idusers,
        'max_nb_users': maxNbUsers,
        'project_date': projectDate,
        'project_description': projectDescription,
        '	project_name': projectName,
        'project_type_work': projectTypeWork,
        // 'specializationName': specializationName,
        //  'userFullName': userFullName
      };
}
