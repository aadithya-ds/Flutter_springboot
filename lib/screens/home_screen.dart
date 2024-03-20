import 'package:flutter/material.dart';
import 'package:flutter_personnal/models/Personnal.dart';
import 'package:flutter_personnal/models/personnals_data.dart';
import 'package:flutter_personnal/personnalTile.dart';
import 'package:flutter_personnal/screens/add_personnal_screen.dart';
import 'package:flutter_personnal/services/personnal_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Personnal>? personnals;

  findPersonnal() async {
    personnals = await PersonnalServices.findPersonnals();
    Provider.of<PersonnalData>(context, listen: false).personnals = personnals!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    findPersonnal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.all(8.0),
              child: const Text(
                'La liste des personnels',
                style: TextStyle(
                    color: Color.fromARGB(255, 95, 98, 100), fontSize: 15),
              )),
          Consumer<PersonnalData>(
            builder: (context, personnalData, child) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: personnalData.personnals.length,
                itemBuilder: (context, index) {
                  Personnal personnal = personnalData.personnals[index];
                  return PersonnalTile(
                    personnal: personnal,
                    personnalData: personnalData,
                  );
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const AddPersonnalScreen();
              });
        },
        elevation: 5.0,
        backgroundColor: const Color.fromARGB(255, 11, 80, 163),
        child: const Icon(Icons.add),
      ),
    );
  }
}
