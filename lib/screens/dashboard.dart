import 'package:flutter/material.dart';
import '../theme.dart';
import '../text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String? _token;
  @override
  void initState() {
    super.initState();
    _loadToken();
  }
  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token') ?? 'No token found';
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          automaticallyImplyLeading: false,
          leading: IconButton(
            iconSize: 35,
            icon: const Icon(
              Icons.dehaze_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text("Dashboard", style: appbarTitle),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 25, 5),
              child: Container(
                width: 50,
                height: 50,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              const Text("Dashboard"),
               Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Token: $_token',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const Row(
                children: <Widget>[
                  Text("Dashboard 2"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
