import 'package:flutter/material.dart';

class BottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: EdgeInsets.all(16),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Good Job!'),
            Text(
              'test test',
              style: TextStyle(fontSize: 18, color: Colors.white54),
            ),
            FlatButton(
              color: Colors.green,
              onPressed: () {},
              child: Text(
                'Okay!',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ]),
    );
  }
}
