import 'package:flutter/material.dart';
import 'package:resapp/pages/cart.dart';
import 'package:resapp/pages/favourite.dart';
import 'package:resapp/pages/intro.dart';
import 'package:resapp/pages/settings.dart';
import 'package:resapp/pages/user_profile.dart';
import 'package:resapp/tab/snacks_tab.dart';
import 'about_us_screen.dart';
import 'help_screen.dart';
import 'package:resapp/tab/my_tab.dart';

import '../tab/food_tab.dart';
import '../tab/dessert_tab.dart';
import '../tab/sides_tab.dart';
import '../tab/drinks_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  int _selectedTabIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const Favorite(),
    const ProfilePage(),
    const HelpScreen(),
  ];

  final List<String> tabIcons = [
    'assets/icons/burger.png',
    'assets/icons/nachos.png',
    'assets/icons/dish.png',
    'assets/icons/drink.png',
    'assets/icons/icecream.png',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabIcons.length,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Scaffold(
          backgroundColor: Colors.white,
          extendBody: true,
          appBar: _currentIndex == 0
              ? AppBar(
                  centerTitle: true,
                  // title: const Text(
                  //   'Cusineous'
                  //   ,
                  //   style: TextStyle(
                  //     color: Colors.deepOrange,
                  //     fontSize: 25,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.deepOrange,
                          size: 36,
                        ),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: IconButton(
                        splashColor: Colors.transparent,
                        icon: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            border: Border.all(
                              color: Colors.deepOrange,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: const EdgeInsets.all(4.0),
                          child: const Center(
                            widthFactor: 2.0,
                            child: Icon(Icons.shopping_bag_outlined,
                                color: Colors.white),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyCart()),
                          );
                        },
                      ),
                    )
                  ],
                )
              : null,
          drawer: Drawer(
            backgroundColor: Colors.white,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.deepOrange),
                  currentAccountPicture: CircleAvatar(
                    foregroundImage: ExactAssetImage(
                        'assets/images/krish-img.jpg',
                        scale: 10.0),
                  ),
                  accountName: Text(
                    "Krish",
                    style: TextStyle(color: Colors.white),
                  ),
                  accountEmail: Text(
                    "krishmevawala@gmail.com",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('About Us'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutUsScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.help),
                  title: const Text('Help'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HelpScreen()),
                    );
                  },
                ),
                const SizedBox(height: 350),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const introPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          body: _currentIndex == 0
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 15, bottom: 15),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.grey[100],
                          prefixIcon: const Icon(Icons.search),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    // tab bar
                    TabBar(
                      tabAlignment: TabAlignment.start,
                      dividerColor: Colors.transparent,
                      onTap: _onTabSelected,
                      tabs: tabIcons.asMap().entries.map((entry) {
                        int index = entry.key;
                        String iconPath = entry.value;
                        return MyTab(
                          iconPath: iconPath,
                          isSelected: index == _selectedTabIndex,
                        );
                      }).toList(),
                      isScrollable: true,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      labelColor: Colors.deepOrange,
                      indicatorColor: Colors.transparent,
                    ),

                    // tab bar view
                    Expanded(
                      child: TabBarView(
                        children: [
                          FoodTab(),
                          SnacksTab(),
                          Sides(),
                          Drinks(),
                          Desserts(),
                        ],
                      ),
                    ),
                  ],
                )
              : pages[_currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              gradient: const LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              currentIndex: _currentIndex,
              elevation: 0,
              selectedItemColor: Colors.deepOrange,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined, size: 30),
                  activeIcon: Icon(Icons.home_filled, size: 30),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border, size: 30),
                  activeIcon: Icon(Icons.favorite, size: 30),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined, size: 30),
                  activeIcon: Icon(Icons.account_circle, size: 30),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
