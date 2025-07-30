import 'package:flutter/material.dart';
import 'package:projordan/presentation/screens/properties/my_properties_screen.dart';
import 'package:projordan/presentation/screens/my_requests_screen.dart';
import 'package:projordan/core/constants/colors.dart' show AppColors;
import 'package:projordan/presentation/screens/properties/add_property_screen.dart';
import 'package:projordan/presentation/screens/home/home_screen.dart';
import 'package:projordan/presentation/screens/profile/profilescreen.dart' show MyProScreen;

class MainNavigationWrapper extends StatefulWidget {
  const MainNavigationWrapper({super.key});

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(), // الرئيسية
    MyPropertiesScreen(), // عقاراتي
    RequestsScreen(), // طلباتي
    MyProScreen(), 
  ];

  // داخل StatefulWidget
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _screens[_currentIndex],

      // زر + دائري مركزي
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPropertyScreen()),
          );
        },
        backgroundColor: AppColors.primary,
        elevation: 6,
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          size: 30,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // شريط سفلي أنيق
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 255, 255, 255),
        elevation: 8,
        shadowColor: const Color.fromARGB(255, 0, 0, 0),
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2), // أقل ارتفاع
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(5, (index) {
              if (index == 2) return const SizedBox(width: 48);
              final item = _navItems[index > 2 ? index - 1 : index];
              return NavItemWidget(
                icon: item['icon'],
                label: item['label'],
                isSelected: _currentIndex == (index > 2 ? index - 1 : index),
                onTap:
                    () => setState(() {
                       print("_currentIndex$_currentIndex");
                      print("index$index");
                      _currentIndex = (index > 2 ? index - 1 : index);
                    }),
                fontSize: screenWidth * 0.04, // حجم أساسي أكبر شوية
              );
            }),
          ),
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> _navItems = [
    {'icon': Icons.dashboard, 'label': 'الرئيسية'},
    {'icon': Icons.house, 'label': 'عقاراتي'},

    {'icon': Icons.list_alt, 'label': 'طلباتي'},
    {'icon': Icons.person, 'label': 'حسابي'},
  ];


}

class NavItemWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final double fontSize;

  const NavItemWidget({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: fontSize * 1.7, // حجم أكبر للأيقونة
            color: isSelected ? AppColors.primary : AppColors.gray,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize * 1, // حجم أكبر للنص
              color: isSelected ? AppColors.primary : AppColors.gray,
            ),
          ),
        ],
      ),
    );
  }
}
