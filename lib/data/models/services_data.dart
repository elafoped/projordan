import 'package:flutter/material.dart';

class ServiceItem {
  final IconData icon;
  final String title;

  ServiceItem({required this.icon, required this.title});
}

final List<ServiceItem> serviceItems = [
  ServiceItem(icon: Icons.chair, title: "ديكور داخلي"),
  ServiceItem(icon: Icons.format_paint, title: "دهانات"),
  ServiceItem(icon: Icons.handyman, title: "نجارة"),
  ServiceItem(icon: Icons.electrical_services, title: "كهرباء"),
  ServiceItem(icon: Icons.texture, title: "رخام وسيراميك"),
  ServiceItem(icon: Icons.park, title: "تصميم حدائق"),
  ServiceItem(icon: Icons.plumbing, title: "تمديدات صحية"),
  ServiceItem(icon: Icons.security, title: "أنظمة أمان"),
  ServiceItem(icon: Icons.wifi, title: "شبكات وانترنت"),
  ServiceItem(icon: Icons.lightbulb, title: "إضاءة ذكية"),
  ServiceItem(icon: Icons.home_repair_service, title: "صيانة عامة"),
  ServiceItem(icon: Icons.architecture, title: "تصميم معماري"),
];
