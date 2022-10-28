import 'package:bytebank_app/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> createDataBase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE contacts ('
          'id INTEGER PRIMARY KEY NOT NULL,'
          'name TEXT,'
          'account INTEGER)');
    }, version: 1);
  });
}

Future<int> save(Contact contato) {
  return createDataBase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['id'] = contato.id;
    contactMap['name'] = contato.name;
    contactMap['account'] = contato.conta;
    return db.insert('contacts', contactMap);
  });
}

Future<List<Contact>> findAll() {
  return createDataBase().then((db) {
    return db.query('contacts').then((maps) {
      final List<Contact> contacts = List.empty();
      for (Map<String, dynamic> map in maps) {
        final Contact contato = Contact(
          id: map['id'],
          name: map['name'],
          conta: map['account'],
        );
        contacts.add(contato);
      }
      return contacts;
    });
  });
}
