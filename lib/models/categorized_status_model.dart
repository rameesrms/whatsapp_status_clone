class Status {
  int? userId;
  String? name;
  String? image;
  List<StatusList>? statusList;
  bool shown=false;


  Status({this.userId, this.name, this.image, this.statusList,this.shown=false});

  Status.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    image = json['image'];
    shown = json['shown'];
    if (json['statusList'] != null) {
      statusList = <StatusList>[];
      json['statusList'].forEach((v) {
        statusList!.add(new StatusList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['image'] = this.image;
    if (this.statusList != null) {
      data['statusList'] = this.statusList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StatusList {
  int? id;
  String? title;
  bool? readStatus;
  String? image;

  StatusList({this.id, this.title, this.readStatus, this.image});

  StatusList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    readStatus = json['read_status'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['read_status'] = this.readStatus;
    data['image'] = this.image;
    return data;
  }
}
