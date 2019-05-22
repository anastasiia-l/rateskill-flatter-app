import 'dart:convert';
import 'dart:math' as math;

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rateskill/department.dart';
import 'package:rateskill/detail_page.dart';
import 'package:rateskill/profile.dart';
import 'package:rateskill/profile_page.dart';
import 'package:rateskill/settings_page.dart';
import 'package:rateskill/staff_details/page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'staff.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  int _currentIndex = 0;
  Department _departmentInfo;
  SharedPreferences _prefs;
  String authHeader = '';
  List<Staff> _staff = [];
  List<Staff> _managers = [];
  List<Staff> _all = [];
  Profile _profile = Profile(
      email: '',
      name: '',
      gender: '',
      username: '',
      type: '',
      birthday: '',
      socialLink: '');

  Future<http.Response> getRequest(String url) {
    return http.get(url, headers: {'Authorization': authHeader});
  }

  _setPrefs() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _prefs = pref;
      authHeader = 'JWT ' + _prefs.getString('token');
    });
  }

  Future<void> _loadDepartmentInfo() async {
    if (_prefs == null) {
      await _setPrefs();
    }

    var response = await getRequest(
        'https://rateskill.herokuapp.com/api/department/info/');
    setState(() {
      _departmentInfo = Department.fromMap(json.decode(response.body));
      print(_departmentInfo);
    });
  }

  Future<void> _loadStaff() async {
    if (_prefs == null) {
      await _setPrefs();
    }

    var response = await getRequest(
        'https://rateskill.herokuapp.com/api/department/staff/');

    setState(() {
      print(response.body);
      _managers = Staff.allManagersFromResponse(response.body);
      print(_managers);
      _staff = Staff.allStaffFromResponse(response.body);
      print(_staff);
      _all = [..._managers, ..._staff];
      print(_all);
    });
  }

  Future<void> _loadProfile() async {
    if (_prefs == null) {
      await _setPrefs();
    }

    var response =
        await getRequest('https://rateskill.herokuapp.com/api/current/');

    setState(() {
      print(response.body);
      _profile = Profile.fromMap(json.decode(response.body));
      print(_profile);
    });
  }

  void onPageChanged(int page) {
    setState(() {
      this._currentIndex = page;
    });
  }

  @override
  void initState() {
    _setPrefs();
    super.initState();
    _loadDepartmentInfo();
    _loadStaff();
    _loadProfile();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Staff staff) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.black12))),
            child: Icon(
              Icons.supervised_user_circle,
              color: Colors.lightBlueAccent,
              size: 56.0,
            ),
          ),
          title: Text(
            staff.name,
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    // tag: 'hero',
                    child: LinearProgressIndicator(
                        backgroundColor: Color.fromRGBO(209, 224, 224, 0.7),
                        value: math.Random().nextDouble(),
                        valueColor: AlwaysStoppedAnimation(Colors.green)),
                  )),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(staff.occupation,
                        style: TextStyle(color: Colors.grey))),
              )
            ],
          ),
          trailing: Icon(Icons.keyboard_arrow_right,
              color: Colors.lightBlueAccent, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StaffDetailsPage(staff)));
          },
        );

    Card makeCard(Staff staff) => Card(
          elevation: 1.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: ClipPath(
            child: Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(255, 255, 255, .9)),
              child: makeListTile(staff),
            ),
            clipper: ShapeBorderClipper(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4))),
          ),
        );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _all.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(_all[index]);
        },
      ),
    );

    final List<Widget> _children = [
      DetailPage(department: _departmentInfo),
      makeBody,
      ProfilePage(profile: _profile),
      SettingsPage()
    ];

    final makeBottom = BottomNavyBar(
      selectedIndex: _currentIndex,
      showElevation: true,
      onItemSelected: (index) => setState(() {
            _currentIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 400), curve: Curves.ease);
          }),
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.apps),
          title: Text('Home'),
          inactiveColor: Colors.grey,
          activeColor: Colors.lightBlueAccent,
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('Staff'),
            inactiveColor: Colors.grey,
            activeColor: Colors.lightBlueAccent),
        BottomNavyBarItem(
            icon: Icon(Icons.face),
            title: Text('Profile'),
            inactiveColor: Colors.grey,
            activeColor: Colors.lightBlueAccent),
        BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            inactiveColor: Colors.grey,
            activeColor: Colors.lightBlueAccent),
      ],
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.0),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "RateSkill",
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
          elevation: 1.0,
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
      ),
      body: new PageView(
        children: _children,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: makeBottom,
    );
  }
}
