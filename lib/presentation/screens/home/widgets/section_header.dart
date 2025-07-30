import 'package:flutter/material.dart';
import 'package:projordan/presentation/screens/properties/list_properties_screen.dart' show PropertiesList;

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {

           
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PropertiesList(
      
        ),
      ),);
          },
          child: const Text(" < عرض الكل", style: TextStyle(color: Color.fromARGB(255, 244, 99, 0))),
        ),
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
