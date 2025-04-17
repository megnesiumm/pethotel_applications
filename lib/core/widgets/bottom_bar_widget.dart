import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth < 360 ? 12.0 : 16.0;

    return Container(
      width: double.infinity,

      color: Color(0xFFEEBDCFF),
      child: Column(
        children: [
          Image.asset('assets/images/Logocat.png', width: 120, height: 120),

          Text('ติดต่อ', style: TextStyle(fontSize: fontSize)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home_outlined, color: Colors.black),
              SizedBox(width: 6),
              Flexible(
                child: Text(
                  'ZZZ Hotel อ.หาดใหญ่ จ.สงขลา 90110',
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
            ],
          ),

          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 6),
              GestureDetector(
                onTap: () {
                  launch("tel://0123456789");
                },
                child: Row(
                  children: [
                    Icon(Icons.phone_outlined, color: Colors.black),
                    SizedBox(width: 6),
                    Text('โทร. 012-345-6789'),
                  ],
                ),
              ),

              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  launch("mailto:zzzofficial@gmail.com");
                },
                child: Row(
                  children: [
                    Icon(Icons.email_outlined, color: Colors.black),
                    SizedBox(width: 6),
                    Text('zzzofficial@gmail.com'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
