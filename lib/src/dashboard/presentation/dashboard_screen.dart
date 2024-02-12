import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/core/routes/named_router.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';

class DashboardScreen extends StatefulWidget {
  final Widget child;
  const DashboardScreen({required this.child, super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _currentIndex = ValueNotifier<int>(0);

  void _onTap(int index) {
    _currentIndex.value = index;
    switch (index) {
      case 0:
        context.go(NamedRouter.homePage);
        break;
      case 1:
        context.go(NamedRouter.bookmarkPage);
        break;
      case 2:
        context.go(NamedRouter.profilePage);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _currentIndex,
        builder: (BuildContext context, value, _) {
          return BottomNavigationBar(
            currentIndex: _currentIndex.value,
            onTap: _onTap,
            showUnselectedLabels: false,
            selectedLabelStyle: StyleTypograph.body1.medium.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : const Color(0xFF37533A),
            ),
            selectedItemColor: Colors.blue.shade600,
            useLegacyColorScheme: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'Bookmark',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
