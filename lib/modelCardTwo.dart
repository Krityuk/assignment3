class modelCardTwo {
  String? createdAt;
  String? name;
  int? duration;
  String? category;
  bool? locked;
  String? id;

  modelCardTwo(
      {this.createdAt,
      this.name,
      this.duration,
      this.category,
      this.locked,
      this.id});

  modelCardTwo.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    duration = json['duration'];
    category = json['category'];
    locked = json['locked'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['name'] = this.name;
    data['duration'] = this.duration;
    data['category'] = this.category;
    data['locked'] = this.locked;
    data['id'] = this.id;
    return data;
  }
}
