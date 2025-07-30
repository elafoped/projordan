import 'package:flutter/material.dart';
import 'package:projordan/presentation/screens/properties/detail_of_properties_screen.dart';
import 'package:projordan/presentation/widgets/primarybutton.dart';

class RealEstateCard extends StatelessWidget {
  final String title;
  final String distance;
  final double price;
  final int reviews;
  final List<String> images;
  
  final List<String> services;  // الخدمات المتوفرة
  
  final int rooms;
  
  final int bathrooms;
  final int userId;
  


  const RealEstateCard({
    super.key,
    required this.title,
    required this.distance,
    required this.price,
    required this.reviews,
    required this.images,
      required this.rooms,
    required this.bathrooms,
    required this.services, 
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    int extraImages = images.length - 5;

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // شبكة الصور
            SizedBox(
              height: 130,
              child: Row(
                children: [
                  Expanded(flex: 2, child: _buildImage(images[0])),
                
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(child: _buildImage(images[3])),
                        const SizedBox(height: 12),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // انتقل إلى التفاصيل لاحقًا
                            },
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                _buildImage(images[4]),
                                Container(
                                    decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
    borderRadius: BorderRadius.circular(9), // ⬅️ تدوير الزوايا بـ 20
  ),

                                  alignment: Alignment.center,
                                  child: Text(
                                    "+$extraImages صور",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // معلومات
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.green, size: 16),
                    const SizedBox(width: 4),
                    Text("ممتاز $reviews تقييم", style: const TextStyle(fontSize: 12)),
                  ],
                ),
                Text("\$$price", style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),

            const SizedBox(height: 6),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(distance, style: const TextStyle(color: Colors.grey, fontSize: 12)),

            const SizedBox(height: 6),

            // أزرار
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryButton(
  label: 'احجز الآن',
  onPressed: () {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailOfPropertiesPage(
          title: title,
          location: distance,
          price: price,
          reviews: reviews,
          images: images, 
          rooms: rooms, 
          bathrooms: bathrooms,
           services:services,
            userId: userId,
           
        ),
      ),
    );
  },
),

    //             ElevatedButton(
    //               style: ElevatedButton.styleFrom(
    //                 backgroundColor: Colors.orange.shade700,
    //                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(8)),
    //               ),
    //               onPressed: () {
    //                   Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => DetailOfPropertiesPage(
    //       title: title,
    //       location: distance,
    //       price: price,
    //       reviews: reviews,
    //       images: images, 
    //       rooms: rooms, 
    //       bathrooms: bathrooms,
    //        services:services,
    //         userId: userId,
           
    //     ),
    //   ),
    // );

    //               },
    //               child: const Text("احجز الآن"),
    //             ),
                Row(
                  children: const [
                    Icon(Icons.verified_user, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text("شريك موثوق", style: TextStyle(color: Colors.grey)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        path,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
