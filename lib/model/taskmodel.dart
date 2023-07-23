class TaskModel {
  int? id;
  String? header;
  String? content;
  

  TaskModel({this.id, this.header, this.content});

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    header = json['header'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['header'] = header;
    data['content'] = content;
    return data;
  }
}
