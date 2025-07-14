import 'package:flutter/material.dart';
import 'package:petshop_applications/modules/profile/pages/profile_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String avatarUrl;
  final VoidCallback onMenuPressed;
  final VoidCallback onLogoutPressed;

  const CustomAppBar({
    super.key,
    required this.avatarUrl,
    required this.onMenuPressed,
    required this.onLogoutPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xffeebdcff),
      actions: [
        Padding(
            padding: const EdgeInsets.only(left: 16.0),
          child: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: onMenuPressed,
              );
            }
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );
          },
          child: CircleAvatar(
            radius: 14,
            backgroundImage: NetworkImage(avatarUrl),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: onLogoutPressed,
        ),
      ],
    );
  }
}
