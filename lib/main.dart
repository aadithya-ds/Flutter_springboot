import 'package:flutter/material.dart';
import 'package:flutter_personnal/models/personnals_data.dart';
import 'package:flutter_personnal/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PersonnalData>(
      create: (context) => PersonnalData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Personnal",
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Personnal'),
            backgroundColor: const Color.fromARGB(255, 11, 80, 163),
          ),
          body: const HomeScreen(),
        ),
      ),
    );
  }
}
