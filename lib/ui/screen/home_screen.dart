import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final menuItems = [
    _BottomMenueItem(Icons.book),
    _BottomMenueItem(Icons.map),
    _BottomMenueItem(Icons.favorite),
    _BottomMenueItem(Icons.settings),
  ];

  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: menuItems.length, vsync: this);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _controller,
        children: [
          SightListScreen(sights: mocks),
          Center(child: Text('Tab 2 is unimplemented')),
          VisitingScreen(),
          Center(child: Text('Tab 4 is unimplemented')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _controller.index,
        selectedItemColor: iconColor,
        unselectedItemColor: unselectedIconColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => _controller.animateTo(index),
        items: [
          for (var item in menuItems)
            BottomNavigationBarItem(
              icon: Icon(item.iconData),
              label: '',
            )
        ],
      ),
    );
  }
}

class _BottomMenueItem {
  final IconData iconData;

  _BottomMenueItem(this.iconData);
}
