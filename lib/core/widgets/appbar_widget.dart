import 'package:flutter/material.dart';
import 'package:petshop_applications/modules/profile/pages/profile_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String avatarUrl;
  final Function onMenuPressed;
  final Function onLogoutPressed;

  const CustomAppBar({
    Key? key,
    required this.avatarUrl,
    required this.onMenuPressed,
    required this.onLogoutPressed,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: null,
      backgroundColor: Color(0xFFEEBDCFF),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, size: 24),
                onPressed: () => onMenuPressed(),
              );
            },
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(pageName: 'Profile Page'),
              ),
            );
          },
          child: CircleAvatar(
            radius: 14,
            backgroundImage: NetworkImage(avatarUrl),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.logout, size: 24),
          onPressed: () => onLogoutPressed(),
        ),
      ],
    );
  }
}
