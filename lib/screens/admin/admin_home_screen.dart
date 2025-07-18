import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:artifix_app/auth/auth_service.dart';
import 'package:artifix_app/screens/interest/interest_list_screen.dart';
import 'package:artifix_app/screens/admin/admin_bookings_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 2) {
      AuthService().logout();
      context.go('/login');
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = AuthService().currentUser;

    if (user == null || user.role != 'admin') {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/login');
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final screens = [
      const InterestListScreen(),
      const AdminBookingsScreen(),
      const SizedBox.shrink(), // För logga ut – inget innehåll
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adminpanel'),
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leads',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Bokningar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logga ut',
          ),
        ],
      ),
    );
  }
}
