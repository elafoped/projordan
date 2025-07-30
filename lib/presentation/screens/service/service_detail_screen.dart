
import 'package:flutter/material.dart';
import 'package:projordan/core/constants/colors.dart';
import 'package:projordan/presentation/screens/service/service_providers_page.dart.dart';
import 'package:projordan/presentation/widgets/header_image_widget.dart';

class ServiceDetailPage extends StatelessWidget {
  final String title;
  final bool hasDetails;

   ServiceDetailPage({
    super.key,
    required this.title,
    required this.hasDetails,
  });

  List<String> getSubServices(String serviceTitle,) {

    switch (serviceTitle) {
      case "ديكور داخلي":
        return [
          "تصميم غرف نوم",
          "ديكور مجالس",
          "تصميم أسقف جبسية",
          "تصميم المطابخ",
          "ورق جدران",
        ];
      case "دهانات":
        return [
          "دهان بلاستيك",
          "دهان زيتي",
          "دهان ديكور",
          "دهان مقاوم للرطوبة",
          "معالجة تشققات",
        ];
      case "نجارة":
        return [
          "أبواب خشب",
          "مطابخ تفصيل",
          "خزائن حائط",
          "أثاث منزلي",
          "ديكورات خشبية",
        ];
      case "كهرباء":
        return [
          "تمديد كهرباء",
          "تركيب مفاتيح",
          "كشافات إنارة",
          "صيانة أعطال",
          "عدادات كهربائية",
        ];
      case "رخام وسيراميك":
        return [
          "أرضيات رخام",
          "تغليف جدران",
          "سيراميك مطابخ",
          "سيراميك حمامات",
          "قص وتشكيل رخام",
        ];
      case "تمديدات صحية":
        return [
          "تمديد مواسير",
          "تركيب مغاسل",
          "تسليك مجاري",
          "خزانات المياه",
          "مضخات الماء",
        ];
      case "أنظمة أمان":
        return [
          "كاميرات مراقبة",
          "أنظمة إنذار",
          "أجهزة بصمة",
          "أجهزة تحكم",
          "تركيب أبواب أمان",
        ];
      case "شبكات وانترنت":
        return [
          "تمديد كابلات",
          "ربط شبكة داخلية",
          "Access Points",
          "تقوية شبكة",
          "تركيب راوترات",
        ];
      case "صيانة عامة":
        return [
          "صيانة سباكة",
          "صيانة كهرباء",
          "ترميم جدران",
          "تنظيف خزانات",
          "صيانة مكيفات",
        ];
      case "تصميم معماري":
        return [
          "تصميم واجهات",
          "رسم مخططات",
          "تصاريح بناء",
          "تصميم ثلاثي الأبعاد",
          "إشراف هندسي",
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final services = getSubServices(title);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body:
          Stack(

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
              child:  hasDetails
                  ? ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemCount: services.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final subService = services[index];
              
                      return ListTile(
                        leading: const Icon(
                          Icons.check_circle_outline,
                          color: AppColors.primary ,
                        ),
                        title: Text(subService),
                        onTap: () {
                          if (title == "ديكور داخلي" &&
                              subService == "تصميم غرف نوم") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => ServiceProviderList(
                                   category: subService, 
                                    ),
                              ),
                            );
                          }
                          if (title == "دهانات" && subService == "دهان بلاستيك") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => ServiceProviderList(
                                                                  category: subService, 
              
                                    ),
                              ),
                            );
                          }
                        },
                      );
                    },
                  )
                  : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.hourglass_empty, size: 80, color: Colors.grey),
                        SizedBox(height: 20),
                        Text(
                          "الخدمة غير متوفرة حالياً",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "ترقبوا الإضافة قريباً",
                          style: TextStyle(color: Colors.grey),
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
}
