import 'package:clinic_doctor_interview/core/theme/colors.dart';
import 'package:clinic_doctor_interview/features/appointment/presentation/pages/appointments.dart';
import 'package:clinic_doctor_interview/features/doctors/presentations/pages/home.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [const Home(), const AppointmentScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: CustomColors.doctorboxgradientcolor2,
        unselectedItemColor: CustomColors.unselectedItemColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Appointments',
          ),
        ],
      ),
    );
  }
}
