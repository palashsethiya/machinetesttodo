class User {
  int? id;
  String? firstName;
  String? lastName;
  String? contact;
  String? email;

  userMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['firstName'] = firstName!;
    mapping['lastName'] = lastName!;
    mapping['contact'] = contact!;
    mapping['email'] = email!;
    return mapping;
  }
}
