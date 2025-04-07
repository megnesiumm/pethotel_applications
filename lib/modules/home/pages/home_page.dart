import 'package:flutter/material.dart';
import 'package:petshop_applications/core/widgets/appbar_widget.dart';
import 'package:petshop_applications/core/widgets/drawer_widget.dart';

class TabMenuPage extends StatefulWidget {
  final String username;
  final String avatarUrl;

  const TabMenuPage({
    super.key,
    required this.username,
    required this.avatarUrl,
  });

  @override
  State<StatefulWidget> createState() {
    return _TabMenuPageState();
  }
}

class _TabMenuPageState extends State<TabMenuPage> {
  late String _avatarUrl;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // GlobalKey สำหรับ Scaffold

  @override
  void initState() {
    super.initState();
    _avatarUrl = widget.avatarUrl;
  }

  void _logout() {
    Navigator.pop(context); 
  }


  void _goToPage(String pageName) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PageDetail(pageName: pageName)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey, 
        appBar: CustomAppBar(
          avatarUrl: _avatarUrl,
          onMenuPressed: () {
            _scaffoldKey.currentState?.openDrawer(); 
          },
          onLogoutPressed: _logout,
        ),
        drawer: CustomDrawer(
          onMenuItemTapped: _goToPage,
        ),
        body: Column(
          children: [
            Expanded(child: Center(child: Text("เนื้อหาหลัก"))),
            Container(
              width: double.infinity,
              color: Color(0xFFEEBDCFF),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Logocat.png',
                    width: 150,
                    height: 150,
                  ),
                  Text(
                    'ติดต่อเรา: support@petshop.com',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ตัวอย่างหน้ารายละเอียดที่แสดงเมื่อเลือกเมนู
class PageDetail extends StatelessWidget {
  final String pageName;
  const PageDetail({Key? key, required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pageName)),
      body: Center(child: Text('นี่คือหน้า $pageName')),
    );
  }
}
