import 'package:flutter_personnal/models/Personnal.dart';
import 'package:flutter_personnal/models/personnals_data.dart';
import 'package:flutter_personnal/screens/edit_personnal_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';

class PersonnalTile extends StatelessWidget {
  final Personnal personnal;
  final PersonnalData personnalData;

  const PersonnalTile(
      {Key? key, required this.personnal, required this.personnalData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView(
          shrinkWrap: true,
          children: [
            Slidable(
              key: const ValueKey(0),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                // dismissible: DismissiblePane(onDismissed: () {}),
                children: [
                  SlidableAction(
                      onPressed: (_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  EditPersonnalScreen(personnal: personnal, personnalData: personnalData,),
                          ),
                        );
                      },
                      backgroundColor: const Color.fromARGB(255, 2, 35, 75),
                      foregroundColor: Colors.white,
                      icon: Icons.edit,
                      label: 'Edit'),
                  SlidableAction(
                    onPressed: (_) => personnalData.deletePersonnal(personnal),
                    backgroundColor: const Color.fromARGB(255, 228, 64, 4),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: ListTile(
                title: Text(personnal.fullName),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
