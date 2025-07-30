// features/discover/presentation/pages/discover_screen.dart
import 'package:flutter/material.dart';
import 'widgets/body_content.dart';

import '../../widgets/search_bar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchText = '';

  void _onSearchChanged(String text) {
    setState(() {
      searchText = text;
    });
  }

  void _onFilterPressed() {
    // فتح فلتر مثلاً باستخدام showModalBottomSheet
    print("فلترة حسب معايير معينة");
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/images/header.jpg",
                height: height * 0.33,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.5,
            left: 0,
            right: 0,
            child: Container(
              height: height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(0, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0),
                    Color.fromARGB(167, 0, 0, 0),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.6,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              // ✅ تمرير النص للبحث إلى BodyContent
              child: BodyContent(searchText: searchText),
            ),
          ),
          Positioned(
            top: 65,
            left: 16,
            right: 16,
            child: SearchBarWidget(
              onChanged: _onSearchChanged,
              onFilterPressed: _onFilterPressed,
            ),
          ),
  
        ],
      ),
    );
  }
}
