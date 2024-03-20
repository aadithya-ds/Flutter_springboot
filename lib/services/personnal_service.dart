import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_personnal/models/Personnal.dart';
import 'package:flutter_personnal/services/config.dart';

class PersonnalServices {
  //add new personnal
  static Future<Personnal> savePersonnal(
      String fullName, String address, String phoneNumber) async {
    Map data = {
      "fullName": fullName,
      "address": address,
      "phoneNumber": phoneNumber,
    };

    var body = json.encode(data);
    var url = Uri.parse('${baseUrl}save');
    http.Response response = await http.post(url, headers: headers, body: body);
    print(response.body);

    Map responseMap = jsonDecode(response.body);
    Personnal personnal = Personnal.fromMap(responseMap);

    return personnal;
  }

  // find all list of personnal
  static Future<List<Personnal>> findPersonnals() async {
    var url = Uri.parse('${baseUrl}all');
    http.Response response = await http.get(url, headers: headers);
    print(response.body);
    List responseList = jsonDecode(response.body);
    List<Personnal> personnals = [];
    for (Map personalMap in responseList) {
      Personnal personnal = Personnal.fromMap(personalMap);
      personnals.add(personnal);
    }
    return personnals;
  }

  static Future<http.Response> deletePersonnal(int id) async {
    var url = Uri.parse('${baseUrl}delete/$id');
    http.Response response = await http.delete(url, headers: headers);
    print(response.body);
    return response;
  }

  static Future<http.Response> getPersonnal(int id) async {
    var url = Uri.parse('${baseUrl}find/personnal/$id');
    http.Response response = await http.get(url, headers: headers);
    print(response.body);
    return response;
  }

  static Future<http.Response> updatePersonnal(
      int id, String fullName, String address, String phoneNumber) async {
    var url = Uri.parse('${baseUrl}update/$id');
    Map data = {
      "fullName": fullName,
      "address": address,
      "phoneNumber": phoneNumber
    };
    var body = json.encode(data);
    http.Response response = await http.put(url, headers: headers, body: body);
    print(response.body);
    return response;
  }

  //   static Future<http.Response> updatePersonnal(
  //     int id, Personnal personnal) async {
  //   var url = Uri.parse('${baseUrl}update/$id');
  //   Map data = {
  //     "fullName": personnal.fullName,
  //     "address": personnal.address,
  //     "phoneNumber": personnal.phoneNumber
  //   };
  //   var body = json.encode(data);
  //   http.Response response = await http.put(url, headers: headers, body: body);
  //   print(response.body);
  //   return response;
  // }
}
