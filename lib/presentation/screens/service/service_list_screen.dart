import 'package:flutter/material.dart';
import 'package:projordan/data/models/services_data.dart';
import 'package:projordan/presentation/screens/service/widgets/service_grid_item.dart';
import 'package:projordan/presentation/widgets/header_image_widget.dart';
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          HeaderImageWidget(height: height * 0.33, title: 'تفاصيل الخدمات'),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.9,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: GridView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: serviceItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final item = serviceItems[index];
                  return ServiceGridItem(serviceItem: item);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
