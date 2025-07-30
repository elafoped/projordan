
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projordan/data/models/services_data.dart';
import 'package:projordan/presentation/screens/service/service_detail_screen.dart';

class ServiceGridItem extends StatelessWidget {
  final ServiceItem serviceItem;

  const ServiceGridItem({Key? key, required this.serviceItem}) : super(key: key);

  bool get isAvailable {
    return !(serviceItem.title == "تصميم حدائق" || serviceItem.title == "إضاءة ذكية");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ServiceDetailPage(
              title: serviceItem.title,
              hasDetails: isAvailable,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(45, 96, 58, 0).withOpacity(0.3),
              blurRadius: 1,
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    serviceItem.icon,
                    size: 28,
                    color: const Color.fromARGB(244, 244, 99, 0),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    serviceItem.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
