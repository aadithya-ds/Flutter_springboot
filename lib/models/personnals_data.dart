import 'package:flutter/cupertino.dart';
import 'package:flutter_personnal/models/Personnal.dart';
// import 'package:flutter_personnal/models/personnal.dart';
import 'package:flutter_personnal/services/personnal_service.dart';

class PersonnalData extends ChangeNotifier {
  List<Personnal> personnals = [];

  void addPersonnal(String fullName, String address, String phoneNumber) async {
    Personnal personnal =
        await PersonnalServices.savePersonnal(fullName, address, phoneNumber);
    personnals.add(personnal);
    notifyListeners();
  }

  void deletePersonnal(Personnal personnal) {
    personnals.remove(personnal);
    PersonnalServices.deletePersonnal(personnal.id);
    notifyListeners();
  }

  void findPersonnal(Personnal personnal) {
    PersonnalServices.getPersonnal(personnal.id);
    notifyListeners();
  }

  void updatePersonnal(int id, String fullName, String address, String phoneNumber) async {
         PersonnalServices.updatePersonnal(id, fullName, address, phoneNumber );
        notifyListeners();
  }

  //   void updatePersonnal(int id, Personnal personnal) async {
  //   Personnal personnal =
  //       await PersonnalServices.updatePersonnal(id, personnal);
  //       notifyListeners();
  // }
}
