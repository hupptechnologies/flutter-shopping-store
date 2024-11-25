import 'package:flutter/material.dart';

class CommonDrawerView extends StatelessWidget {
  const CommonDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(30.0),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Home'),
          ),
          ListTile(
            title: Text('Settings'),
          )
        ],
      ),
    );
  }
}
