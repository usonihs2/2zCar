import 'package:flutter/material.dart';
import 'package:flutter_project/view/user/main_screen.dart';
import 'package:flutter_project/view/user/myforecastHistory_screen.dart';
import 'package:flutter_project/view/user/myinfoUpdate_screen.dart';

class UserTabbar extends StatefulWidget {
  const UserTabbar({super.key});

  @override
  State<UserTabbar> createState() => _UserTabbarState();
}

class _UserTabbarState extends State<UserTabbar>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);
    //이 페이지 2개랑 연결 위에 떠있는 것 앱바처럼
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
    //앱 죽기전 써야함 메모리....
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          //내가만든 컨트롤러
          children: const [
            MainScreen(),
            MyforecastHistoryScreen(),
            MyinfoUpdateScreen(),
          ],
        ),
        bottomNavigationBar: TabBar(
          controller: controller,
          labelColor: Colors.black,
          indicatorColor: Colors.black,

          //현재페이지 표시라인
          //컨트롤러에 신호 랭쓰기억
          tabs: const [
            Tab(
              icon: Icon(Icons.home),
              text: "홈",
            ),
            Tab(
              icon: Icon(Icons.text_snippet),
              text: '가격 예측 기록',
            ),
            Tab(
              icon: Icon(Icons.people),
              text: '마이페이지',
            ),
          ],
        ),
      ),
    );
  }
}
