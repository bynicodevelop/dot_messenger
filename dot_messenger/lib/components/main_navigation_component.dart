import 'package:flutter/material.dart';

class MainNavigationComponent extends StatefulWidget {
  final PageController pageController;

  const MainNavigationComponent({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  State<MainNavigationComponent> createState() =>
      _MainNavigationComponentState();
}

class _MainNavigationComponentState extends State<MainNavigationComponent> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_max,
          ),
          label: "Cannaux",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
          ),
          label: "Paramètres",
        ),
      ],
      onTap: (index) {
        setState(() => _currentIndex = index);

        widget.pageController.animateToPage(
          index,
          duration: const Duration(
            milliseconds: 500,
          ),
          curve: Curves.ease,
        );
      },
    );
  }
}
