import 'package:flutter/material.dart';
import 'package:flutter_application_5/screens/screens.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  List<Widget> items = const [
    FirstScreen(),
    SecondScreen(),
    ThirdScreen(),
    FourScreen()
  ];

  void isSelected(int index) {
    if (currentIndex == index) return;
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(),
          endDrawer: DrawerWidget(),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: isSelected,
            selectedItemColor: const Color(0xff22A2BD),
            unselectedItemColor: Colors.grey,
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/svg/photo.svg',
                  color: Colors.grey,
                ),
                activeIcon: SvgPicture.asset('assets/images/svg/photo.svg'),
                label: 'Персонажи',
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/images/svg/Group 1.svg'),
                  activeIcon: SvgPicture.asset(
                    'assets/images/svg/Group 1.svg',
                    color: const Color(0xff22A2BD),
                  ),
                  label: 'Локации'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/images/svg/Group 4.svg'),
                  activeIcon: SvgPicture.asset(
                    'assets/images/svg/group 4.svg',
                    color: const Color(0xff22A2BD),
                  ),
                  label: 'Эпизоды'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/images/svg/Group.svg'),
                  activeIcon: SvgPicture.asset('assets/images/svg/Group.svg',
                      color: const Color(0xff22A2BD)),
                  label: 'Настройки'),
            ],
          ),
          body: items[currentIndex]),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
           const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('DRAWER'),
          ),

          ListTile(
            leading: const Icon(Icons.abc),
            title: const Text('FIRST'),
            onTap:(){
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.access_alarm),
            title: const Text('SECOND'),
            onTap:(){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
