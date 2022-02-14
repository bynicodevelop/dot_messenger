import 'package:dot_messenger/configs/constants.dart';
import 'package:dot_messenger/screens/profile_screen.dart';
import 'package:flutter/material.dart';

const List<Map<String, dynamic>> menus = [
  {
    "title": "Modifier mon profil",
    "action": ProfileScreen(),
  }
];

class SettingsPageView extends StatelessWidget {
  const SettingsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(
          top: kDefaultPadding / 3,
        ),
        shrinkWrap: true,
        itemCount: menus.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => menus[index]["action"],
              ),
            ),
            title: Text(menus[index]["title"]),
            trailing: const Icon(
              Icons.keyboard_arrow_right_outlined,
            ),
          );
        },
        separatorBuilder: (
          BuildContext context,
          int index,
        ) =>
            const Divider(),
      ),
    );
  }
}
