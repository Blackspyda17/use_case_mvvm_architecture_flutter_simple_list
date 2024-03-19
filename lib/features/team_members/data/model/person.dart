class PersonModel {
  String? avatar;
  String? bio;
  String? firstName;
  String? id;
  String? lastName;
  String? title;

  PersonModel({this.avatar, this.bio, this.firstName, this.id, this.lastName, this.title});

  PersonModel.fromJson(Map<String, dynamic> json) {
    avatar = json["avatar"];
    bio = json["bio"];
    firstName = json["firstName"];
    id = json["id"];
    lastName = json["lastName"];
    title = json["title"];
  }

  static List<PersonModel> fromList(List<dynamic> list) {
    return list.map((map) => PersonModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["avatar"] = avatar;
    _data["bio"] = bio;
    _data["firstName"] = firstName;
    _data["id"] = id;
    _data["lastName"] = lastName;
    _data["title"] = title;
    return _data;
  }
}