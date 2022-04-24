class GetPatientDataModel {
  List<Data> data;
  bool success;

  GetPatientDataModel({this.data, this.success});

  GetPatientDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
    success = json['success'];
  }
}

class Data {
  int iD;
  String username;
  String gender;
  dynamic dob;
  String job;
  String address;
  String email;
  int phoneNum;
  String socialStatus;
  int ssn;
  dynamic noOfKids;
  String coordinates;
  int roleId;
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

}
