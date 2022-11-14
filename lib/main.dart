import 'package:flutter/material.dart';

// fa22_json_movies

/*

*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie List',
        home: Homepage());
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List _Movies = [];

  //fetch content from json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString("assets/movies_array.json");
    final data = await json.decode(response);

    setState(() {
      _Movies = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(centerTitle: true, title: const Text("Read Json - Movies")),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            ElevatedButton(child: const Text('Load Data'), onPressed: readJson),
            _Movies.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        itemCount: _Movies.length,
                        itemBuilder: (context, index) {
                          //example with card
                          return /* Card(
                              margin: const EdgeInsets.all(10),
                              child: ListTile(
                                  leading: Text(_Movies[index][0].toString()),
                                  title: Text(_Movies[index][1]),
                                  subtitle: Text(_Movies[index][6].toString()))); */


                            (
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Rank ${_Movies[index][0]} "),
                                       Text(_Movies[index][1].toString()),
                                      Text(_Movies[index][2].toString() ),
                                      Text("Rating: ${_Movies[index][3]}"),
                                      Text("Year: ${_Movies[index][4]}"),
                                      Text("Genre: ${_Movies[index][6]}"),
                                      const Divider(height: 10, thickness: 3, color: Colors.indigo)

                                    ],
                                ),
                              )

                            );
                        }))
                : Container()
          ]),
        ));
  }
}
