import 'dart:convert';

class Contact {
  final int id;
  final String name;
  final int conta;
  Contact({
    required this.id,
    required this.name,
    required this.conta,
  });

  @override
  String toString() => 'ContactModel(name: $name, conta: $conta)';

  Map<String, dynamic> toMap() {
    return {'name': name, 'conta': conta};
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      conta: map['conta']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) =>
      Contact.fromMap(json.decode(source));
}
