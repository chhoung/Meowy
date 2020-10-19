import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:gallery_saver/gallery_saver.dart';
import 'bottomsheet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var imageUrl = "";

  void _saveNetworkImage() async {
    String path = imageUrl;
    GallerySaver.saveImage(path).then((bool success) {
      print('Image is saved');
    });
  }

  Future<String> getMeow() async {
    var url = 'https://aws.random.cat/meow';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      imageUrl = jsonResponse['file'];

      print(imageUrl);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return imageUrl;
  }

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
                              child: Text('Next'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: RaisedButton(
                              color: Colors.grey,
                              textColor: Colors.black,
                              onPressed: () {
                                _saveNetworkImage();
                              },
                              child: Text('Save'),
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
