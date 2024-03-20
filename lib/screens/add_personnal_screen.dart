import 'package:flutter/material.dart';
import 'package:flutter_personnal/models/personnals_data.dart';
import 'package:provider/provider.dart';

class AddPersonnalScreen extends StatefulWidget {
  const AddPersonnalScreen({Key? key}) : super(key: key);

  @override
  State<AddPersonnalScreen> createState() => _AddPersonnalScreenState();
}

class _AddPersonnalScreenState extends State<AddPersonnalScreen> {
  
  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final FocusNode focusNodeFullName = FocusNode();
  final FocusNode focusNodeAddress = FocusNode();
  final FocusNode focusNodePhoneNumber = FocusNode();

  // @override
  // void initState() {
  //   super.initState();
  //   fullName = TextEditingController;
  // }

  // @override
  // void dispose() {
  //   focusNodeFullName.dispose();
  //   focusNodeAddress.dispose();
  //   focusNodePhoneNumber.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const Text(
            'Nouveau personnel',
            style: TextStyle(),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            focusNode: focusNodeFullName,
            controller: fullNameController,
            onSubmitted: (_) {
              focusNodeFullName.requestFocus();
            },
            decoration: const InputDecoration(
              label: Text('Votre nom complet'),
            ),
          ),
          TextField(
            focusNode: focusNodeAddress,
            controller: addressController,
            onSubmitted: (_) {
              focusNodeAddress.requestFocus();
            },
            decoration: const InputDecoration(
              label: Text('Votre addresse'),
            ),
          ),
          TextField(
            focusNode: focusNodePhoneNumber,
            controller: phoneNumberController,
            onSubmitted: (_) {
              focusNodePhoneNumber.requestFocus();
            },
            decoration: const InputDecoration(
              label: Text('Votre numéro de téléphone'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: TextButton(
              onPressed: () {
                // print(fullNameController.text);
                Provider.of<PersonnalData>(context, listen: false).addPersonnal(
                    fullNameController.text,
                    addressController.text,
                    phoneNumberController.text);
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 11, 80, 163),
              ),
              child: const Text(
                'Enregistrer',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
