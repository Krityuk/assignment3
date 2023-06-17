// ignore: camel_case_types
class modelCardOne {
  String? createdAt;
  String? name;
  String? category;
  int? lesson;
  String? id;

  modelCardOne(
      {this.createdAt, this.name, this.category, this.lesson, this.id});

  modelCardOne.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    category = json['category'];
    lesson = json['lesson'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['name'] = this.name;
    data['category'] = this.category;
    data['lesson'] = this.lesson;
    data['id'] = this.id;
    return data;
  }
}
