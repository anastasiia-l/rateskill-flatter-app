import 'package:flutter/material.dart';
import 'package:rateskill/staff.dart';
import 'package:rateskill/staff_details/footer/articles_showcase.dart';
import 'package:rateskill/staff_details/footer/skills_showcase.dart';

class StaffShowcase extends StatefulWidget {
  StaffShowcase(this.staff);

  final Staff staff;

  @override
  _StaffShowcaseState createState() => new _StaffShowcaseState();
}

class _StaffShowcaseState extends State<StaffShowcase>
    with TickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _tabs = [
      new Tab(text: 'Skills'),
      new Tab(text: 'Feedback'),
    ];
    _pages = [
      new SkillsShowcase(),
      new FeedbackShowcase(),
    ];
    _controller = new TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        children: <Widget>[
          new TabBar(
            controller: _controller,
            tabs: _tabs,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
          ),
          new SizedBox.fromSize(
            size: const Size.fromHeight(300.0),
            child: new TabBarView(
              controller: _controller,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}
