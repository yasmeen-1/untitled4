class Records {
  List<User>? records;

  Records({this.records});

  Records.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = <User>[];
      json['records'].forEach((v) {
        records!.add(User.fromJson(v));
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

class User {
  String? fullname;
  String? username;
  String? idusers;
  String? email;
  String? password;
  String? idcompany;
  String? phoneNumber;
  String? cvFile;
  String? profile_image;
  String? Bio;
  String? sp;
  String? skills;

  User(
      {this.fullname,
      this.username,
      this.idusers,
      this.email,
      this.password,
      this.idcompany,
      this.phoneNumber,
      this.cvFile,
      this.profile_image,
      this.Bio,
      this.sp,
      this.skills});

  User.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    username = json['username'];
    idusers = json['idusers'];
    email = json['email'];
    password = json['password'];
    idcompany = json['idcompany'];
    phoneNumber = json['phone_number'];
    cvFile = json['cv_file'];
    profile_image = json['profile_image'];
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
    data['profile_image'] = profile_image;
    data['Bio'] = Bio;
    data['sp'] = sp;
    data['skills'] = skills;
    return data;
  }
}
