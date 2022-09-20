import 'package:flutter/material.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBottomNavigationItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      extendBody: true,
      bottomNavigationBar: Container(
        child: ClipRRect(
          child: BottomNavigationBar(
            elevation: 30,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xffF5F5F5),
            currentIndex: _selectedBottomNavigationItem,
            onTap: (int index) {
              setState(() {
                _selectedBottomNavigationItem = index;
              });
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('images/home.png'),
                activeIcon: Image.asset('images/home.png'),
                label: 'Item3',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/notification.png'),
                activeIcon: Image.asset('images/notification.png'),
                label: 'Item4',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/tick.png'),
                activeIcon: Image.asset('images/tick.png'),
                label: 'Item2',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/user.png'),
                activeIcon: Image.asset('images/user.png'),
                label: 'Item1',
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedBottomNavigationItem,
        children: getLayout(),
      ),
    );
  }

  List<Widget> getLayout() {
    return <Widget>[
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
    ];
  }
}
