import 'package:e_commerce/widgets/appbar/view/common_app_bar.dart';
import 'package:e_commerce/widgets/drawer/view/drawer_view.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CommonAppBar(
          title: 'About as',
          isNotication: false,
        ),
      ),
      drawer: CommonDrawerView(),
      drawerEnableOpenDragGesture: false,
      body: Center(
        child: Text('About as Page'),
      ),
    );
  }
}
