import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/responsive.dart';

import 'Content_model.dart';
import 'HomeScreen.dart';
import 'assets.dart';
import 'models.dart';
class navScreen extends StatefulWidget {
  @override
  _navScreenState createState() => _navScreenState();
}

class _navScreenState extends State<navScreen> {
  List <Widget> screens=[
    homescreen(key:PageStorageKey('homescreen') ,),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),

  ];
  Map<String,IconData>icons={
    "Home" :Icons.home,
    "Search":Icons.search,
    "Coming Soon":Icons.queue_play_next,
    "Downloads":Icons.file_download,
    "More":Icons.more,
};
  int currentindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentindex],

      bottomNavigationBar:!Responsive.isDesktop(context)? BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed
          ,
        items: icons.map((title, icon) => MapEntry(title, BottomNavigationBarItem(
          icon:  Icon(icon,size: 30.0,),
          title: Text(title),
        ))).values.toList(),
        currentIndex: currentindex,
        selectedFontSize: 11.0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 11.0,
        onTap: (index)=> setState((){
          currentindex=index;
        }),
      ):null,
    );
  }
}
