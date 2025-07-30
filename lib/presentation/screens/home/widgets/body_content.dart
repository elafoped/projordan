import 'package:flutter/material.dart';
import 'package:projordan/presentation/screens/my_requests_screen.dart';
import 'package:projordan/presentation/screens/properties/list_properties_screen.dart';
import 'package:projordan/presentation/screens/requests/requests_screen.dart';
import 'package:projordan/presentation/screens/service/service_list_screen.dart';

import 'category_grid.dart';
import '../horizontal_property_list.dart';
import 'section_header.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({super.key, required String searchText});

  void _handleCategoryTap(BuildContext context, String title) {
    if (title == "عقارات للبيع" || title == "عقارات للإيجار") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PropertiesList(), // صفحة قائمة العقارات
        ),
      );
    }
    // بداخل _handleCategoryTap
else if (title == "الخدمات") {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ServicesScreen(),
    ),
  );
}

else if (title == "طلبات الإكساء") {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => RequestsScreen1(),
    ),
  );
}  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              CategoryGrid(
                items: const [
                  {"icon": Icons.house, "title": "عقارات للبيع"},
                  {"icon": Icons.apartment, "title": "عقارات للإيجار"},
                  {"icon": Icons.build, "title": "الخدمات"},
                  {"icon": Icons.photo_library, "title": "خدمات منجزة"},
               {"icon": Icons.inbox, "title": "طلبات العقارات"}, // الطلبات يلي وصلتني من زباين
{"icon": Icons.track_changes, "title": "طلبات الإكساء"}, // الطلبات يلي أنا باعتها على عقارات الآخرين
                ],
                onCategoryTap: (title) => _handleCategoryTap(context, title),
              ),
              const SizedBox(height: 24),
              const SectionHeader(title: "عقارات مقترحة لك"),
              const SizedBox(height: 12),
              const HorizontalPropertyList(),
              const SizedBox(height: 24),
             
              
            ]),
          ),
        ),
      ],
    );
  }
}
