import 'package:flutter/material.dart';
import 'package:flutter_personnal/main.dart';
import 'package:flutter_personnal/models/Personnal.dart';
import 'package:flutter_personnal/models/personnals_data.dart';
import 'package:flutter_personnal/screens/home_screen.dart';
import 'package:provider/provider.dart';

class EditPersonnalScreen extends StatefulWidget {
  final Personnal personnal;
  final PersonnalData personnalData;
  // final String fullName;
  // final String address;
  // final String phoneNumber;
  const EditPersonnalScreen({
    Key? key,
    required this.personnal,
    required this.personnalData,
  }) : super(key: key);

  @override
  State<EditPersonnalScreen> createState() => _EditPersonnalScreenState();
}

class _EditPersonnalScreenState extends State<EditPersonnalScreen> {
  // Personnal? personnal;
  FocusNode focusNodeFullName = FocusNode();
  FocusNode focusNodeAddress = FocusNode();
  FocusNode focusNodePhoneNumber = FocusNode();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  // String? _fullName;

  @override
  void initState() {
    fullNameController.text = widget.personnal.fullName;
    // personnal!.fullName = fullNameController.text;
    addressController.text = widget.personnal.address;
    phoneNumberController.text = widget.personnal.phoneNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personnal'),
        backgroundColor: const Color.fromARGB(255, 11, 80, 163),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const Text(
              'Modifier les infos du personnel',
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
                  // print(addressController.text);
                  Provider.of<PersonnalData>(context, listen: false)
                      .updatePersonnal(
                          widget.personnal.id,
                          fullNameController.text,
                          addressController.text,
                          phoneNumberController.text);
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const MyApp())));
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
      ),
    );
  }
}
