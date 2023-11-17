import 'package:flutter/material.dart';

ValueNotifier<int> indexvalue = ValueNotifier(0);

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexvalue,
        builder: (context, newvalue, _) {
          return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.black,
              currentIndex: newvalue,
              onTap: (value) {
                indexvalue.value = value;
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.email), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_view_month_outlined), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.phone), label: ""),
              ]);
        });
  }
}
