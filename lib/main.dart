import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Future<String> getMeow() async {
  var url = 'https://aws.random.cat/meow';
  var response = await http.get(url);
  var imageUrl;

  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    imageUrl = jsonResponse['file'];

    print(imageUrl);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  return imageUrl;
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
              future: getMeow(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: Text('Loading...'),
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(
                        snapshot.data,
                        height: 300,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: RaisedButton(
                              onPressed: () {
                                setState(() {});
                              },
                              child: Text('Save'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: RaisedButton(
                              color: Colors.grey,
                              textColor: Colors.black,
                              onPressed: () {},
                              child: Text('Share'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }
}
