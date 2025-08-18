import 'package:flutter/material.dart';
import 'package:petshop_applications/core/widgets/appbar_widget.dart';
import 'package:petshop_applications/core/widgets/bottom_bar_widget.dart';
import 'package:petshop_applications/core/widgets/custom_elevated_button.dart';
import 'package:petshop_applications/core/widgets/drawer_widget.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool bathSelected = false;
  bool cutSelected = false;

  Widget buildServiceItem({
    required String title,
    required String imagePath,
    required bool isChecked,
    required ValueChanged<bool?> onChanged,
  }) {
    return Column(
      children: [
      
        Container(
          width: 246,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            color: const Color(0xFFF3D1FF),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'bold',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),

   
        Container(
          width: 273,
          height: 353,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
        ),

        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(value: isChecked, onChanged: onChanged),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),

        const SizedBox(height: 24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(currentPage: 'บริการอื่นๆ',),
      appBar: CustomAppBar(
        avatarUrl: 'https://i.pravatar.cc/300',
        onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
        onLogoutPressed:
            () => Navigator.pushReplacementNamed(context, '/login'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _buildServiceContent(context),
                const BottomBarWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceContent(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 47),
        buildServiceItem(
          title: 'อาบน้ำ',
          imagePath: 'assets/images/bathcat.png',
          isChecked: bathSelected,
          onChanged: (value) {
            setState(() {
              bathSelected = value ?? false;
            });
          },
        ),
        buildServiceItem(
          title: 'ตัดขน',
          imagePath: 'assets/images/catcut.png',
          isChecked: cutSelected,
          onChanged: (value) {
            setState(() {
              cutSelected = value ?? false;
            });
          },
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              text: 'จองเลย',
              fontWeight: FontWeight.bold,
              backgroundColor: const Color(0xFFAB80E3),
              onPressed: () {},
              width: 204,
              height: 54,
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'ดูโปรโมชั่น',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
