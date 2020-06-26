class User {
  final String id;
  final String nickName;
  final String email;
  final String userRole;
  final String photoUrl;
  User({this.id, this.nickName, this.email, this.userRole, this.photoUrl});
  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        nickName = data['nickName'],
        email = data['email'],
        userRole = data['userRole'],
        photoUrl = data['photoUrl'];
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nickName': nickName,
      'email': email,
      'userRole': userRole,
      'photoUrl': photoUrl,
    };
  }
}
