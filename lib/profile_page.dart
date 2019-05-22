import 'package:flutter/material.dart';
import 'package:rateskill/profile.dart';

class ProfilePage extends StatelessWidget {
  final Profile profile;

  ProfilePage({Key key, this.profile}) : super(key: key);

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
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2.6),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
        profile.type,
        style: TextStyle(color: Colors.white),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 60.0),
        Center(
            child: Icon(
          Icons.account_circle,
          color: Colors.white,
          size: 72.0,
        )),
        SizedBox(height: 10.0),
        Text(
          profile.name,
          style: TextStyle(color: Colors.white, fontSize: 28.0),
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
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 16),
            child: Container(
              width: 260.0,
              child: new Divider(color: Colors.white),
            ),
          ),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: new Row(
            children: <Widget>[
              new Icon(
                Icons.person_pin,
                color: Colors.white,
                size: 16.0,
              ),
              new Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: new Text(
                  profile.username,
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
                Icons.email,
                color: Colors.white,
                size: 16.0,
              ),
              new Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: new Text(
                  profile.email,
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
                Icons.cake,
                color: Colors.white,
                size: 16.0,
              ),
              new Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: new Text(
                  profile.birthday,
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
                Icons.link,
                color: Colors.white,
                size: 16.0,
              ),
              new Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: new Text(
                  profile.socialLink,
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
                Icons.wc,
                color: Colors.white,
                size: 16.0,
              ),
              new Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: new Text(
                  profile.gender,
                  style: textTheme.body1
                      .copyWith(color: Colors.white70, fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.blue[800],
                Colors.blue[700],
                Colors.blue[600],
                Colors.blue[400],
              ],
            ),
          ),
          child: Align(
            child: topContentText,
            alignment: Alignment.topCenter,
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
