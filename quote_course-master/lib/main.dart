import 'dart:convert';

import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

// get Books
Future<List> getBooks() async {
  var baseurl = "http://localhost:9090/api/v1/quotes";
  var response = await http.get(Uri.parse(baseurl));
  final data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    print(data);
    return data;
  } else {
    print("Error geting data");
  }
  return [];
}

// post Books
Future addBook(Map<String, dynamic> body) async {
  var baseurl = "http://localhost:9090/api/v1/quotes";
  var encodedBody = jsonEncode(body);
  var headers = {'Content-Type': 'application/json'};
  var response = await http
      .post(Uri.parse(baseurl), headers: headers, body: encodedBody)
      .catchError((e) {
    print("Error Method :  $e");
  });

  if (response.statusCode >= 200) {
    print("Post Method :  ${response.body}");
    // return data;
  } else {
    print("Error geting data");
  }
}

// delete Books
Future deleteBook(int id) async {
  print("deleteBook Method  Called:  $id");

  var baseurl = "http://localhost:9090/api/v1/quotes/$id";
  var headers = {'Content-Type': 'application/json'};
  var response =
      await http.delete(Uri.parse(baseurl), headers: headers).catchError((e) {
    print("Error Method :  $e");
  });

  if (response.statusCode >= 200) {
    print("Delete Method :  ${response.body}");
    // return data;
  } else {
    print("Error geting data");
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("BookStore"),
          actions: [
            IconButton(
              onPressed: () async {
                print("refresh");
                // todo
                await getBooks();
              },
              icon: Icon(Icons.refresh),
            ),
            IconButton(
              onPressed: () async {
                print("Add New Book");
                // todo 1

                var testBody = {"BookTitle": "Sample", "author": "data"};

                await addBook(testBody);
                // getBooks();
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List>(
            future: getBooks(),
            builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, index) => Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          onLongPress: () async {
                            await deleteBook(snapshot.data![index]['id']);
                            setState(() {});
                          },
                          contentPadding: const EdgeInsets.all(10),
                          leading: AutoSizeText(
                              snapshot.data![index]['id'].toString()),
                          title: AutoSizeText(
                            snapshot.data![index]['booktitle'].toString(),
                            style: GoogleFonts.sono(fontSize: 60),
                            minFontSize: 10,
                          ),
                          subtitle: AutoSizeText(
                              snapshot.data![index]['author'].toString()),
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
      ),
    );
  }

  void init() async {
    await getBooks();
  }
}
