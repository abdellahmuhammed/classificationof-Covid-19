class UserLoginData{
  bool success;
  String token;
  dynamic userId;
  dynamic roleId;
  dynamic userRole;

  UserLoginData(
      {this.success, this.token, this.userId, this.roleId, this.userRole});

  UserLoginData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    userId = json['user_id'];
    roleId = json['role_id'];
    userRole = json['user_role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['token'] = this.token;
    data['user_id'] = this.userId;
    data['role_id'] = this.roleId;
    data['user_role'] = this.userRole;
    return data;
  }
}
