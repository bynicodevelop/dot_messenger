import 'package:dot_messenger/components/main_navigation_component.dart';
import 'package:dot_messenger/screens/page_views/channels_pageview.dart';
import 'package:dot_messenger/screens/page_views/settings_pageview.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const <Widget>[
          ChannelsPageView(),
          SettingsPageView(),
        ],
      ),
      bottomNavigationBar: MainNavigationComponent(
        pageController: _pageController,
      ),
    );
  }
}
