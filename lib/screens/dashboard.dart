import 'package:flutter/material.dart';
import '../theme.dart';
import '../text_style.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
        body: const SafeArea(
          child: Column(
            children: <Widget>[
              Text("Dashboard"),
              Row(
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
