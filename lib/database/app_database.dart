import 'package:bytebank_app/models/contact_model.dart';
import 'package:bytebank_app/screen/contact_form.dart';
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

Future<int> save(ContactModel contato) {
  return createDataBase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['id'] = contato.id;
    contactMap['name'] = contato.name;
    contactMap['account'] = contato.conta;
    return db.insert('contacts', contactMap);
  });
}

Future<List<ContactModel>> findAll() {
  return createDataBase().then((db) {
    return db
        .query('contacts', columns: ['id', 'name', 'account']).then((maps) {
      final List<ContactModel> contatosLista = [];
      for (Map<String, dynamic> map in maps) {
        final ContactModel contato = ContactModel(
          id: map['id'],
          name: map['name'],
          conta: map['account'],
        );
        contatosLista.add(contato);
      }
      return contatosLista;
    });
  });
}
