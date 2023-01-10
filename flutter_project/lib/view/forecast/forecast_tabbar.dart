import 'package:flutter/material.dart';
import 'package:flutter_project/view/forecast/brand_screen.dart';
import 'package:flutter_project/view/forecast/detail_screen.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forecast'),
      ),
      body: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.abc),
              ),
              Tab(
                icon: Icon(Icons.abc),
              ),
            ],
          ),
          TabBarView(controller: tabController, children: const [
            BrandScreen(),
            // modelScreen(),
            DetailScreen(),
          ])
        ],
      ),
    );
  }
  // --- Function ---

} // End