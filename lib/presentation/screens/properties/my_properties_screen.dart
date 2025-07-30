import 'package:flutter/material.dart';
import 'package:projordan/data/models/myproperties.dart';
import 'package:projordan/presentation/widgets/header_image_widget.dart';

class MyPropertiesScreen extends StatelessWidget {
  const MyPropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

 
        final height = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: Colors.white,
     
      body: 
      
      
      Stack(
        children: [
                              HeaderImageWidget(height: height * 0.33, title: ' عقاراتي'), 
  Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.8,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              // ✅ تمرير النص للبحث إلى BodyContent
              child: Padding(
  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
  child: ListView.builder(
    shrinkWrap: true,
physics: const BouncingScrollPhysics(),

              itemCount: properties.length,
              itemBuilder: (context, index) {
                final property = properties[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20,top:20),
                  child: _buildPropertyCard(
                    context: context,
                    colorc: Color.fromARGB(255, 245, 206, 209),
                    price: property.price,
                    title: property.title,
                    subtitle: property.subtitle,
                    address: property.address,
                    features: property.features,
                    imagePath: property.imagePath,
                  ),
                );
              },
            ),
          ),
            ),
            ),
          
        
        ],
      ),
    );
  }

  Widget _buildPropertyCard({
    required BuildContext context,
    required Color colorc,
    required String price,
    required String title,
    required String subtitle,
    required String address,
    required String features,
    required String imagePath,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = screenHeight * 0.25;

    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(screenWidth * 0.04),
                ),
                child: Container(
                  color: colorc,
                  height: imageHeight,
                  width: double.infinity,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
             
              Positioned(
                top: 12,
                right: 12,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // فتح صفحة تفاصيل لاحقًا
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  ),
                  icon: const Icon(Icons.edit, size: 16,color:Colors.white),
                  label: const Text('تعديل',style: TextStyle(color: Colors.white),),
                ),
              ),
              Positioned(
                bottom: 12,
                left: 12,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle,
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(address),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: features.split(' • ').map((feature) {
                    return Row(
                      children: [
                        const Icon(Icons.check_circle_outline, size: 16, color: Colors.blue),
                        const SizedBox(width: 4),
                        Text(feature, style: const TextStyle(fontSize: 12)),
                      ],
                    );
                  }).toList(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
