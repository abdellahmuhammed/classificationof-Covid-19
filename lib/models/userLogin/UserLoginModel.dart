// ignore_for_file: file_names

class UserLoginData{
  bool success;
  String token;
  int userId;
  int roleId;
  String userRole;

  UserLoginData(
      {this.success, this.token, this.userId, this.roleId, this.userRole});

  UserLoginData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    userId = json['user_id'];
    roleId = json['role_id'];
    userRole = json['user_role'];
  }
}
