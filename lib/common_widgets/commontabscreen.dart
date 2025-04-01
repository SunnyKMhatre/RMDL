import 'package:flutter/material.dart';

class TabData {
  
  final String icon;
  final Widget page;

  TabData({ required this.icon, required this.page});
}

class CommonTabScreen extends StatelessWidget {
  final String title;
  final List<TabData> tabs;

  const CommonTabScreen({super.key, required this.title, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            tabs: tabs
                .map((tab) => Tab(icon: Image.asset(tab.icon)))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: tabs.map((tab) => tab.page).toList(),
        ),
      ),
    );
  }
}
