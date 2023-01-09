import 'package:flutter/material.dart';
import 'package:flutter_project/view/user/login_screen.dart';
import 'package:flutter_project/view/user/main_screen.dart';

class TabTab extends StatefulWidget {
  const TabTab({super.key});

  @override
  State<TabTab> createState() => _TabTabState();
}

class _TabTabState extends State<TabTab> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> _widgetOptions = <Widget>[
    const MainScreen(),
    //여기에 가격 예측 /마이페이지 추가
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_snippet),
            label: '가격 예측 기록',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: '마이페이지',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
