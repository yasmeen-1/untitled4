import 'dart:convert';

class ACC {
  final String idprojects;
  final String projectDescription;

  final String idusers;
//  final String idcompanies;
// final String specializationName;
  // final String companyName;
//  final String companyLogo;
  //final String userFullName;

  const ACC({
    required this.idprojects,
    required this.projectDescription,
    required this.idusers,
    //  required this.idcompanies,
    //  required this.specializationName,
    //    required this.companyName,
    //  required this.companyLogo,
    //  required this.userFullName,
  });
  factory ACC.fromJson(Map<String, dynamic> json) => ACC(
        /// price: json['price'],
        // companyLogo: json['companyLogo'],
        //    companyName: json['companyName'],
        // idcompanies: json['idcompanies'],
        idprojects: json['idprojects'],
        // idspecialization: json['idspecialization'],
        idusers: json['idusers'],
        //  maxNbUsers: json['max_nb_users'],
        //  projectDate: json['project_date'],
        projectDescription: json['project_description'],
        // projectName: json['project_name'],
        // projectTypeWork: json['project_type_work'],
        //   specializationName: json['specializationName'],
        //  userFullName: json['userFullName'], // companyName: '',
      );

  Map<String, dynamic> toJson() => {
        //'price': price,
        // 'companyLogo': companyLogo,
        //  'companyName': companyName,
        //  'idcompanies': idcompanies,
        'idprojects': idprojects,

        'idusers': idusers,

        'project_description': projectDescription,

        // 'specializationName': specializationName,
        //   'userFullName': userFullName
      };
}
