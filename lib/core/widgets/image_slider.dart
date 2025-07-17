import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageSliderBox extends StatefulWidget {
  const ImageSliderBox({super.key});

  @override
  State<ImageSliderBox> createState() => _ImageSliderBoxState();
}

class _ImageSliderBoxState extends State<ImageSliderBox> {
  final List<String> imagePaths = [
    'assets/images/catphoto.png',
    'assets/images/catphoto1.png',
    'assets/images/catphoto2.png',
    'assets/images/catphoto3.png',
  ];

  int currentIndex = 0;

  void _showPreviousImage() {
    setState(() {
      currentIndex = (currentIndex - 1 + imagePaths.length) % imagePaths.length;
    });
  }

  void _showNextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % imagePaths.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
    GestureDetector(
          onTap: _showNextImage,
          child: SvgPicture.asset(
            'assets/icons/arrow_back.svg',
            width: 24,
            height: 24,
          ),
        ),
        SizedBox(width: 3),
        Container(
          width: 220,
          height: 155,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePaths[currentIndex],
              fit: BoxFit.cover,
              width: 220,
              height: 155,
            ),
          ),
        ),
        SizedBox(width: 3),
         GestureDetector(
          onTap: _showNextImage,
          child: SvgPicture.asset(
            'assets/icons/arrow_forward.svg',
            width: 24,
            height: 24,
          ),
        ),
        SizedBox(width: 3),
      ],
    );
  }
}
