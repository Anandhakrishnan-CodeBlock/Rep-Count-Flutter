import 'package:flutter/material.dart';
import 'package:rep_count/features/counter/counter_list_screen.dart';
import 'package:rep_count/features/settings/settings_screen.dart';
import 'package:rep_count/features/timer/timer_list_screen.dart';


class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<StatefulWidget> createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigationWidget> {
  final screens = [TimerScreen(), CounterScreen(), SettingsScreen()];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedIndex: _selectedIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.timer),
            icon: Icon(Icons.timer_sharp),
            label: "Timer",
          ),

          NavigationDestination(
            selectedIcon: Icon(Icons.back_hand),
            icon: Icon(Icons.back_hand_outlined),
            label: "Counter",
          ),

          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
