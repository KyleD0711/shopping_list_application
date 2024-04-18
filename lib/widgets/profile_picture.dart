import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_application/controllers/auth_controller.dart';
import 'package:shopping_list_application/pages/opening_page.dart';
class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
        return DropdownButtonHideUnderline(
          child: DropdownButton2(
            customButton: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: CircleAvatar(child: Icon(Icons.person)),
            ),
            items: [...MenuItems.items.map(
                (item) => DropdownMenuItem<MenuItem>(
                  value: item,
                  child: MenuItems.buildItem(item),
                ),
              ),],
            onChanged: (value) {
              MenuItems.onChanged(context, value as MenuItem);
            },
            dropdownStyleData: DropdownStyleData(
                width: 160,
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.primary,
                ),
                offset: const Offset(0, 8),
              ),
          ),
        );
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}
abstract class MenuItems {
  static const List<MenuItem> items = [logout];

  static const logout = MenuItem(text: 'Log Out', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: 22),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.logout:
        AuthController().signOutFromGoogle();
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const OpeningPage()), ModalRoute.withName('/'));
        break;
    }
  }
}