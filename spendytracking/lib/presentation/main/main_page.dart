import 'package:flutter/material.dart';
import 'package:spendytracking/presentation/home/home_page.dart';

import 'widget/app_bottom_appbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int indexSelected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
        shape: const CircleBorder(),
      ),
      bottomNavigationBar: AppBottomAppbar(
        onTapItem: (index) {
          setState(() {
            indexSelected = index;
          });
        },
        indexSelected: indexSelected,
      ),
      body: PageView(children: [
        HomePage(),
      ]),
    );
  }
}
