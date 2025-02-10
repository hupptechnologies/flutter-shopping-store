import 'package:e_commerce/widgets/appbar/view/common_app_bar.dart';
import 'package:e_commerce/widgets/drawer/view/drawer_view.dart';
import 'package:flutter/material.dart';

class AppSettingView extends StatelessWidget {
  const AppSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CommonAppBar(
          title: 'Setting',
          isNotication: false,
        ),
      ),
      drawer: CommonDrawerView(),
      drawerEnableOpenDragGesture: false,
      body: Center(
        child: Text('Setting Page'),
      ),
    );
  }
}
