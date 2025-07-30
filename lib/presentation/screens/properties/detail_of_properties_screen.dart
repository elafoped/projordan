import 'package:flutter/material.dart';
import 'package:projordan/data/models/properties_list_model.dart' show realEstates;
import 'package:projordan/data/repositories/user_repositor.dart';
import 'package:projordan/presentation/screens/properties/widgets/images_slider%20.dart';
import 'package:projordan/presentation/widgets/primarybutton.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailOfPropertiesPage extends StatelessWidget {
  final String title;
  final String location;
  final double price;
  final int reviews;
  final List<String> images;
  final int rooms;
  final int bathrooms;
  final List<String> services;
  final int userId;

  DetailOfPropertiesPage({
    super.key,
    required this.title,
    required this.location,
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
    // عشان نجيب بيانات المستخدم حسب userId الممرر
    final user = UserRepository().getUserById(userId);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child:
        
         ElevatedButton(
         onPressed: () async {
    final user = UserRepository().getUserById(userId);
    if (user != null && user.phone.isNotEmpty) {
      final phone = user.phone.startsWith('09') ? user.phone.replaceFirst('09', '+963') : user.phone;
      final whatsappUrl = Uri.parse('https://wa.me/$phone');

      if (await canLaunchUrl(whatsappUrl)) {
        await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
      } else {
        // ما في واتساب أو ما قدر يفتح الرابط
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تعذر فتح تطبيق واتساب')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('رقم الهاتف غير معروف')),
      );
    }
  },
          style:
     
          
          
           ElevatedButton.styleFrom(
            backgroundColor: Colors.orange[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            'احجز الآن',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      body: ListView(
        children: [
          // 🔝 صورة الغلاف
          Stack(
            children: [
              ImagesSlider(images: images),
            ],
          ),

          const SizedBox(height: 20),

          // 🏠 العنوان والسعر
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '\$$price',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.star, color: Colors.amber, size: 20),
                    const SizedBox(width: 4),
                    Text('$reviews تقييم'),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.redAccent, size: 18),
                    const SizedBox(width: 6),
                    Text(location, style: TextStyle(color: Colors.grey[700])),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 🛏️ التفاصيل
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(Icons.bed, color: Colors.blueGrey[700]),
                const SizedBox(width: 6),
                Text('$rooms غرفة'),
                const SizedBox(width: 20),
                Icon(Icons.bathtub, color: Colors.blueGrey[700]),
                const SizedBox(width: 6),
                Text('$bathrooms حمام'),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // 📝 الوصف
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('وصف العقار:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(
                  'هذا العقار يتميز بموقعه القريب من جميع الخدمات الأساسية، كما يحتوي على تصميم عصري وحديث. مناسب للعائلات وللإيجار اليومي أو الأسبوعي.',
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // 🧩 الخدمات
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('الخدمات:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: services.map((title) {
                    final icon = _getAmenityIcon(title);
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(icon, size: 18, color: Colors.orange),
                          const SizedBox(width: 6),
                          Text(title, style: const TextStyle(fontSize: 13)),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }

  IconData _getAmenityIcon(String title) {
    switch (title) {
      case 'واي فاي':
        return Icons.wifi;
      case 'موقف سيارات':
        return Icons.local_parking;
      case 'مسبح':
        return Icons.pool;
      case 'تكييف':
        return Icons.ac_unit;
      case 'مطبخ':
        return Icons.kitchen;
      default:
        return Icons.check;
    }
  }
}
