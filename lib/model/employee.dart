class Employee {
  int? id;
  String? email;
  String? first_name;
  String? avatar;
  String? last_name;

  Employee({
    required this.id,
    required this.email,
    required this.first_name,
    required this.avatar,
    required this.last_name,
  });

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    first_name = json['first_name'];
    avatar = json['avatar'];
    last_name = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': first_name,
      'avatar': avatar,
      'last_name': last_name,
    };
  }
}
