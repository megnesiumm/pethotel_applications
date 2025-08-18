import 'package:flutter/material.dart';
import 'package:petshop_applications/core/widgets/appbar_widget.dart';
import 'package:petshop_applications/core/widgets/bottom_bar_widget.dart';
import 'package:petshop_applications/core/widgets/drawer_widget.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool bathSelected = false;
  bool cutSelected = false;

  Widget buildServiceItem({
    String? title,
    String? imagePath,
    bool showTitle = false,
    double imageWidth = 160,
    double imageHeight = 160,
  }) {
    if (!showTitle && (imagePath == null || imagePath.isEmpty)) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        if (showTitle && title != null) ...[
          Container(
            width: 246,
            height: 56,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              color: const Color(0xFFF3D1FF),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'bold',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                height: 1.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
        ],

        if (imagePath != null && imagePath.isNotEmpty)
          Container(
            width: imageWidth,
            height: imageHeight,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(currentPage: 'แกลลอรี่และรีวิว'),
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
        SizedBox(height: 20),
        buildServiceItem(title: 'แกลลอรี่', showTitle: true),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildServiceItem(imagePath: 'assets/images/gallery1.png'),
            const SizedBox(width: 4),
            buildServiceItem(imagePath: 'assets/images/gallery2.png'),
          ],
        ),
        buildServiceItem(
          imagePath: 'assets/images/gallery3.png',
          imageWidth: 324,
          imageHeight: 218,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildServiceItem(imagePath: 'assets/images/gallery4.png'),
            const SizedBox(width: 4),
            buildServiceItem(imagePath: 'assets/images/gallery5.png'),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildServiceItem(imagePath: 'assets/images/gallery6.png'),
            const SizedBox(width: 4),
            buildServiceItem(imagePath: 'assets/images/gallery7.png'),
          ],
        ),

        const SizedBox(height: 60),
        buildServiceItem(title: 'รีวิวจากลูกค้า', showTitle: true),
        const SizedBox(height: 36),
        buildServiceItem(
          imagePath: 'assets/images/review.png',
          imageWidth: 340,
          imageHeight: 160,
        ),
        buildServiceItem(
          imagePath: 'assets/images/review2.png',
          imageWidth: 340,
          imageHeight: 160,
        ),

        const SizedBox(height: 40),
      ],
    );
  }
}
