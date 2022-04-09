class GetUserDataModel {
  String token;
  dynamic userId;
  dynamic roleId;
  dynamic userRole;
  List<Data> data;
  bool success;

  GetUserDataModel(
      {this.token,
        this.userId,
        this.roleId,
        this.userRole,
        this.data,
        this.success});

  GetUserDataModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['user_id'];
    roleId = json['role_id'];
    userRole = json['user_role'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['user_id'] = this.userId;
    data['role_id'] = this.roleId;
    data['user_role'] = this.userRole;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class Data {
  String iD;
  String username;
  String gender;
  String dob;
  String job;
  String address;
  String email;
  String phoneNum;
  String socialStatus;
  String ssn;
  String noOfKids;
  String coordinates;
  String roleId;
  String vaccinationType;

  Data(
      {this.iD,
        this.username,
        this.gender,
        this.dob,
        this.job,
        this.address,
        this.email,
        this.phoneNum,
        this.socialStatus,
        this.ssn,
        this.noOfKids,
        this.coordinates,
        this.roleId,
        this.vaccinationType});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    username = json['username'];
    gender = json['gender'];
    dob = json['dob'];
    job = json['job'];
    address = json['address'];
    email = json['email'];
    phoneNum = json['phone_num'];
    socialStatus = json['social_status'];
    ssn = json['ssn'];
    noOfKids = json['no_of_kids'];
    coordinates = json['coordinates'];
    roleId = json['role_id'];
    vaccinationType = json['vaccination_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['username'] = this.username;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['job'] = this.job;
    data['address'] = this.address;
    data['email'] = this.email;
    data['phone_num'] = this.phoneNum;
    data['social_status'] = this.socialStatus;
    data['ssn'] = this.ssn;
    data['no_of_kids'] = this.noOfKids;
    data['coordinates'] = this.coordinates;
    data['role_id'] = this.roleId;
    data['vaccination_type'] = this.vaccinationType;
    return data;
  }
}