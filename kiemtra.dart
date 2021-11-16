import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for using json.decode()

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Flutter NEWS',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // The list that contains information about photos
  List _loadedPhotos = [];

  // The function that fetches data from the API
  Future<void> _fetchData() async {
    const API_URL =
        'https://newsapi.org/v2/everything?q=apple&from=2021-11-15&to=2021-11-15&sortBy=popularity&apiKey=be620e9326564691b8df9be08293fd85';

    final response = await http.get(Uri.parse(API_URL));
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> data = map["articles"];
    setState(() {
      _loadedPhotos = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" Flutter NEWS"),
          backgroundColor: Colors.blueAccent[700],
          centerTitle: true,
        ),
        body: SafeArea(
            child: _loadedPhotos.length == 0
                ? Center(
              child: ElevatedButton(
                child: Text('Load Photos'),
                onPressed: _fetchData,
              ),
            )
            // The ListView that displays photos
                : ListView.builder(
                  itemCount: _loadedPhotos.length,
                  itemBuilder: (BuildContext ctx, index) {
                return ListTile(
                  leading: Image.network(
                    _loadedPhotos[index]["urlToImage"],
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  title: Text(_loadedPhotos[index]['title']),
                  subtitle:
                  Text('Photo ID: ${_loadedPhotos[index]["id"]}'),
                );
              },
            )));
  }
}