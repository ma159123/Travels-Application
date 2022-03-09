import 'package:flutter/material.dart';
import 'package:trips/modules/home_page.dart';
import 'package:trips/modules/page2.dart';
import 'package:trips/modules/page3.dart';
import 'package:trips/modules/page4.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomePage(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0.0,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.apps,
            ),
            label: '1',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
              ),
              label: '2'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.update,
              ),
              label: '3'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.apps,
              ),
              label: '4'),
        ],
      ),
    );
  }
}
