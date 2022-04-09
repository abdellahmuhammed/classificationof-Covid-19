class UserRegisterDataModel {
  bool success;
  String userId;

  UserRegisterDataModel({this.success, this.userId});

  UserRegisterDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['user_id'] = this.userId;
    return data;
  }
}
