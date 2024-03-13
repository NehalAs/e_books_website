class UserModel {
  String? name;
  String? email;
  String? uId;
  String? verificationStatus;
  String? userType;

  UserModel({this.name, this.email, this.uId, this.verificationStatus,this.userType});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    uId = json['uId'];
    verificationStatus = json['verificationStatus'];
    userType = json['userType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['uId'] = this.uId;
    data['verificationStatus'] = this.verificationStatus;
    data['userType'] = this.userType;
    return data;
  }
}
