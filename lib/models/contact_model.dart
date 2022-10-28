import 'dart:convert';

class ContactModel {
  final int id;
  final String name;
  final int conta;
  ContactModel({
    required this.id,
    required this.name,
    required this.conta,
  });

  @override
  String toString() => 'ContactModel(name: $name, conta: $conta)';

  Map<String, dynamic> toMap() {
    return {'name': name, 'conta': conta};
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      conta: map['conta']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactModel.fromJson(String source) =>
      ContactModel.fromMap(json.decode(source));
}
