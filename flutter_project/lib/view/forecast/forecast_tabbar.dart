import 'package:flutter_project/view/user/user_tabbar.dart';

import 'brand_screen.dart';
import 'detail_screen.dart';
import 'package:flutter/material.dart';

class ForecastTabbar extends StatefulWidget {
  const ForecastTabbar({super.key});

  @override
  State<ForecastTabbar> createState() => _ForecastTabbarState();
}

class _ForecastTabbarState extends State<ForecastTabbar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('data'),
          bottom: TabBar(
            controller: tabController,
            labelColor: Colors.amber,
            indicatorColor: Colors.amber,
            unselectedLabelColor: Colors.red,
            tabs: const <Widget>[
              Tab(
                icon: Icon(Icons.abc),
              ),
              Tab(
                icon: Icon(Icons.abc),
                // text: ,
              ),
              // Tab(
              //   icon: Icon(Icons.abc),
              // ),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: const [
            BrandScreen(),
            // ModelScreen(),
            DetailScreen(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              tabController.index < 1
                  ? tabController.index = tabController.index + 1
                  : Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const UserTabbar();
                      },
                    ));
            });
          },
        ),
      ),
    );
  }
}
