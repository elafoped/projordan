import 'package:flutter/material.dart';
import 'package:projordan/core/constants/colors.dart';
import 'package:projordan/presentation/widgets/header_image_widget.dart';

class RequestsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
   
      body: 
      
      
      Stack(
        children: [

   HeaderImageWidget(height: height * 0.33, title: 'طلباتي'),
    Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.8,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 📨 طلب مستلم على عقار
                _buildRequestCard(
                  context: context,
                  title: 'طلب استئجار: شقة حديثة في وسط المدينة',
                  status: 'قيد المعالجة',
                  fromTo: 'من: محمد أحمد',
                  isCompleted: false,
                  actions: [
                    _buildActionButton(
                      context: context,
                      text: 'رفض الطلب',
                      color: Colors.red,
                      onPressed: () => _showRejectionDialog(context),
                    ),
                    const SizedBox(width: 8),
                    _buildActionButton(
                      context: context,
                      text: 'تفاوض',
                      color: Colors.orange[800]!,
                      onPressed: () => _showNegotiationDialog(context),
                    ),
                  ],
                ),
          
                const Divider(thickness: 1, height: 30),
          
                // ✅ طلب إكساء مكتمل
                _buildRequestCard(
                  context: context,
                  title: 'طلب إكساء: دهان داخلي',
                  status: 'تم التنفيذ',
                  fromTo: 'إلى: شركة الألوان المميزة',
                  isCompleted: true,
                  actions: [
                   _buildActionButton(
            context: context,
            text: 'تقييم الخدمة',
            color: Colors.indigo, // زر بلون جديد واضح
            onPressed: () => _showRatingDialog(context),
          ),
          
                  ],
                ),
              ],
            ),
          ),
  
            ),
          ),
        




       ],
      ),
    );
  }

  // كرت طلب
  Widget _buildRequestCard({
    required BuildContext context,
    required String title,
    required String status,
    required String fromTo,
    required bool isCompleted,
    required List<Widget> actions,
  }) {
    final width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // عنوان الطلب وحالته
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.04,
                    ),
                  ),
                ),
               Container(
  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
  decoration: BoxDecoration(
    color: isCompleted ? Colors.green[100] : Colors.orange[50],
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: isCompleted ? Colors.green[800]! : Colors.orange[800]!,
      width: 1.2,
    ),
  ),
  child: Text(
    status,
    style: TextStyle(
      color: isCompleted ? Colors.green[800] : Colors.orange[900],
      fontWeight: FontWeight.w600,
      fontSize: width * 0.035,
    ),
  ),
),

              ],
            ),
            const SizedBox(height: 6),
            Text(
  fromTo,
  style: TextStyle(
    color: Colors.grey[700], // بدل 600
    fontSize: width * 0.035,
  ),
),

            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions,
            ),
          ],
        ),
      ),
    );
  }

  // زر الإجراء
  Widget _buildActionButton({
    required BuildContext context,
    required String text,
    required Color color,
    required VoidCallback onPressed,
  }) {
    final width = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: 10),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      ),
    );
  }

  // حوار الرفض
  void _showRejectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('رفض الطلب'),
        content: const Text('هل أنت متأكد أنك تريد رفض هذا الطلب؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم رفض الطلب')),
              );
            },
            child: const Text('رفض', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  // حوار التفاوض
  void _showNegotiationDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('طلب تفاوض'),
        content: TextField(
          controller: controller,
          maxLines: 3,
          decoration: const InputDecoration(
            labelText: 'أدخل شروط التفاوض',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم إرسال التفاوض')),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange[800]),
            child: const Text('إرسال',style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }

  // حوار التقييم
  void _showRatingDialog(BuildContext context) {
    int rating = 0;
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('تقييم الخدمة'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('ما تقييمك للخدمة؟'),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                   icon: Icon(
  index < rating ? Icons.star : Icons.star_border,
  color: Colors.amber,
  size: 28,
),

                    onPressed: () => setState(() => rating = index + 1),
                  );
                }),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('شكرًا لتقييمك')),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
              child: const Text('إرسال',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
