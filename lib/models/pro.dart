class Record {
  List<Pro>? records;

  Record({this.records});

  Record.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = <Pro>[];
      json['records'].forEach((v) {
        records!.add(Pro.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (records != null) {
      data['records'] = records!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pro {
  String? fullname;
  String? username;
  String? idusers;
  String? email;
  String? password;
  String? idcompany;
  String? phoneNumber;
  String? cvFile;
  String? Bio;
  String? sp;
  String? skills;

  Pro(
      {this.fullname,
      this.username,
      this.idusers,
      this.email,
      this.password,
      this.idcompany,
      this.phoneNumber,
      this.cvFile,
      this.Bio,
      this.sp,
      this.skills});

  Pro.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    username = json['username'];
    idusers = json['idusers'];
    email = json['email'];
    password = json['password'];
    idcompany = json['idcompany'];
    phoneNumber = json['phone_number'];
    cvFile = json['cv_file'];
    Bio = json['Bio'];
    sp = json['sp'];
    skills = json['skills'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullname'] = fullname;
    data['username'] = username;
    data['idusers'] = idusers;
    data['email'] = email;
    data['password'] = password;
    data['idcompany'] = idcompany;
    data['phone_number'] = phoneNumber;
    data['cv_file'] = cvFile;
    data['Bio'] = Bio;
    data['sp'] = sp;
    data['skills'] = skills;
    return data;
  }
}
