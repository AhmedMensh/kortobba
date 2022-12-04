class LoginResponse {
  LoginResponse({
      this.refresh, 
      this.access,});

  LoginResponse.fromJson(dynamic json) {
    refresh = json['refresh'];
    access = json['access'];
  }
  String? refresh;
  String? access;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['refresh'] = refresh;
    map['access'] = access;
    return map;
  }

}