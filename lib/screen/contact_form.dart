import 'package:bytebank_app/models/contact_model.dart';
import 'package:bytebank_app/ui/styles/colors_app.dart';
import 'package:bytebank_app/ui/widgets/button.dart';
import 'package:flutter/material.dart';

import '../ui/styles/button_styles.dart';
import '../ui/styles/text_styles.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Informe os dados bancários.'),
        ),
        body: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                        label: Text(
                      'Nome do Contato *',
                    )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _accountController,
                    decoration: const InputDecoration(
                      label: Text(
                        'Nº da Conta *',
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Button(
                    width: MediaQuery.of(context).size.height * .9,
                    onPressed: () {
                      final int id = 0;
                      final String name = _nameController.text;
                      final int account =
                          int.tryParse(_accountController.text)!;

                      final ContactModel contato =
                          ContactModel(id: id, name: name, conta: account);
                      Navigator.pop(context, contato);
                      // Navigator.of(context)
                      //     .pushNamedAndRemoveUntil('/home', (route) => false);
                    },
                    style: ButtonStyles.i.yellowOutLineButton,
                    labelStyle: TextStyles.i.textPrimaryFontBold
                        .copyWith(color: ColorsApp.i.yellow),
                    label: 'Confirma',
                    outline: false,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
