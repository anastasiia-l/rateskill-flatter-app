import 'package:flutter/material.dart';
import 'package:rateskill/staff.dart';
import 'package:rateskill/staff_details/body.dart';
import 'package:rateskill/staff_details/footer/friend_detail_footer.dart';
import 'package:rateskill/staff_details/header/header.dart';

class StaffDetailsPage extends StatefulWidget {
  StaffDetailsPage(this.staff);

  final Staff staff;

  @override
  _StaffDetailsPageState createState() => new _StaffDetailsPageState();
}

class _StaffDetailsPageState extends State<StaffDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var linearGradient = const BoxDecoration(
      gradient: const LinearGradient(
        begin: FractionalOffset.centerRight,
        end: FractionalOffset.bottomLeft,
        colors: <Color>[
          const Color(0xFF40C4FF),
          const Color(0xFF039BE5),
        ],
      ),
    );

    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          decoration: linearGradient,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new StaffDetailHeader(
                widget.staff,
              ),
              new Padding(
                padding: const EdgeInsets.all(24.0),
                child: new StaffDetailBody(widget.staff),
              ),
              new StaffShowcase(widget.staff),
            ],
          ),
        ),
      ),
    );
  }
}
