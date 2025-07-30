// features/discover/presentation/widgets/horizontal_property_list.dart
import 'package:flutter/material.dart';
import '../../../data/models/properties_list_model.dart'; // مسار الموديل
import '../properties/widgets/property_card.dart';

class HorizontalPropertyList extends StatelessWidget {
  const HorizontalPropertyList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: realEstates.length,
        itemBuilder: (context, index) {
          return PropertyCard(property: realEstates[index]);
        },
      ),
    );
  }
}
