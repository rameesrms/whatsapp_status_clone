class StatusModel {
  int? id;
  String? title;
  bool? readStatus;
  String? image;
  Profile? profile;

  StatusModel({this.id, this.title, this.readStatus, this.image, this.profile});

  StatusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    readStatus = json['read_status'];
    image = json['image'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['read_status'] = this.readStatus;
    data['image'] = this.image;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  int? id;
  String? name;
  String? image;

  Profile({this.id, this.name, this.image});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
