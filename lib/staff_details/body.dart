import 'package:flutter/material.dart';
import 'package:rateskill/staff.dart';

class StaffDetailBody extends StatelessWidget {
  StaffDetailBody(this.staff);

  final Staff staff;

  Widget _buildLocationInfo(TextTheme textTheme) {
    return new Row(
      children: <Widget>[
        new Icon(
          Icons.email,
          color: Colors.white,
          size: 16.0,
        ),
        new Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: new Text(
            staff.email,
            style: textTheme.subhead.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(
          staff.name,
          style: textTheme.headline.copyWith(color: Colors.white),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: _buildLocationInfo(textTheme),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 16.0),
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
                  staff.birthday,
                  style: textTheme.body1.copyWith(color: Colors.white70, fontSize: 16.0),
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
                Icons.person_pin,
                color: Colors.white,
                size: 16.0,
              ),
              new Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: new Text(
                  staff.username,
                  style: textTheme.body1.copyWith(color: Colors.white70, fontSize: 16.0),
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
                Icons.work,
                color: Colors.white,
                size: 16.0,
              ),
              new Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: new Text(
                  staff.type,
                  style: textTheme.body1.copyWith(color: Colors.white70, fontSize: 16.0),
                ),
              ),
            ],
          ),
//
        ),

      ],
    );
  }
}
