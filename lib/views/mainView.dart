import 'package:flutter/material.dart';

import 'home/widgets/bottomNavBar.dart';
import 'home/widgets/pages.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyPages(),
      bottomNavigationBar: MyButtomNavigationBar(),
    );
  }
}
