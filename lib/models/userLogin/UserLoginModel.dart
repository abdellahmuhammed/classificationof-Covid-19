// ignore_for_file: file_names

class UserLoginModel {
  bool success;
  String token;
  String userId;
  String roleId;
  String userRole;

  UserLoginModel(
      {this.success, this.token, this.userId, this.roleId, this.userRole});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    userId = json['user_id'];
    roleId = json['role_id'];
    userRole = json['user_role'];
  }

}
