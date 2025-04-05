import 'package:flutter/material.dart';

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
  late String _username;
  late String _avatarUrl;

  @override
  void initState() {
    super.initState();
    _username = widget.username;
    _avatarUrl = widget.avatarUrl;
  }

  void _logout() {
    Navigator.pop(context);
  }

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              automaticallyImplyLeading: false,
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'Menu'),
                  Tab(icon: Icon(Icons.person)),
                  Tab(text: 'Logout'),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              const Center(child: Text('Menu')),
              const Center(child: Text('Profile')),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(_avatarUrl),
                    ),
                    ElevatedButton(
                      onPressed: _logout,
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
