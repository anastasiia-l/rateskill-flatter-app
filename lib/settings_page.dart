import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage();

  @override
  Widget build(BuildContext context) {
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),
        Icon(
          Icons.settings,
          color: Colors.black26,
          size: 56.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.blue),
        ),
        SizedBox(height: 10.0),
        Text(
          "Settings will be available soon.",
          style: TextStyle(color: Colors.black26, fontSize: 45.0),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
        ),
        Container(
          padding: EdgeInsets.all(40.0),
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(color: Colors.white),
          child: Center(
            child: topContentText,
          ),
        ),
      ],
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[topContent],
        ),
      ),
    );
  }
}
