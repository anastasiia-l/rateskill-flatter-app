import 'package:flutter/material.dart';
import 'package:rateskill/department.dart';

class DetailPage extends StatelessWidget {
  final Department department;

  DetailPage({Key key, this.department}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.5),
            value: 0.8,
            valueColor: AlwaysStoppedAnimation(Colors.green)),
      ),
    );

    final coursePrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
        department.type + ' type',
        style: TextStyle(color: Colors.white),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),
        Icon(
          Icons.location_city,
          color: Colors.white,
          size: 56.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.white),
        ),
        SizedBox(height: 10.0),
        Text(
          department.name,
          style: TextStyle(color: Colors.white, fontSize: 45.0),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 1, child: levelIndicator),
            Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Positive",
                      style: TextStyle(color: Colors.white),
                    ))),
            Expanded(flex: 2, child: coursePrice)
          ],
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: new Row(
            children: <Widget>[
              new Icon(
                Icons.work,
                color: Colors.white,
                size: 16.0,
              ),
              new Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: new Text(
                  department.company['name'],
                  style: textTheme.body1
                      .copyWith(color: Colors.white70, fontSize: 16.0),
                ),
              ),
            ],
          ),
//
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: new Row(
            children: <Widget>[
              new Icon(
                Icons.domain,
                color: Colors.white,
                size: 16.0,
              ),
              new Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: new Text(
                  department.company["type"],
                  style: textTheme.body1
                      .copyWith(color: Colors.white70, fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: new Row(
            children: <Widget>[
              new Icon(
                Icons.flag,
                color: Colors.white,
                size: 16.0,
              ),
              new Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: new Text(
                  department.company["country"],
                  style: textTheme.body1
                      .copyWith(color: Colors.white70, fontSize: 16.0),
                ),
              ),
            ],
          ),
//
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.3, 0.6, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.

                Colors.blue[50],
                Colors.blue[100],
                Colors.blue[200],
                Colors.blue[300],
              ],
            ),
          ),
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
