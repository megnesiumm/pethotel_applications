import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Function(String) onMenuItemTapped;

  const CustomDrawer({Key? key, required this.onMenuItemTapped})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: double.infinity,
      child: Container(
        color: Color(0xFFEEBDCFF),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Logocat.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 20),
                _buildMenuItem(context, 'หน้าแรก'),
                _buildMenuItem(context, 'ห้องพัก'),
                _buildMenuItem(context, 'บริการอื่นๆ'),
                _buildMenuItem(context, 'แกลลอรี่และรีวิว'),
                _buildMenuItem(context, 'เกี่ยวกับเรา'),
              ],
            ),
            Positioned(
              top: 30,
              right: 10,
              child: IconButton(
                icon: const Icon(
                  Icons.disabled_by_default_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      onTap: () {
        Navigator.pop(context);
        onMenuItemTapped(title);
      },
    );
  }
}
