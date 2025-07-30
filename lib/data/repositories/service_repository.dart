
import 'package:projordan/data/models/service_model.dart';

class DesignersRepository {
  static final Map<String, List<Map<String, dynamic>>> _designersData = {
    "تصميم غرف نوم": [
      {
        "name": "ايلاف عبيد",
        "phone": "+963997044769",
        "rating": 4.8,
        "projects": 25,
        "description": "متخصص في التصاميم العصرية لغرف النوم الصغيرة.",
        "image": "assets/images/bed1.jpg",
      },
      {
        "name": "لينا خالد",
        "phone": "0934567890",
        "rating": 4.5,
        "projects": 30,
        "description": "خبرة في التصاميم الكلاسيكية والفينتج.",
        "image": "assets/images/bed2.jpg",
      },
      {
        "name": "محمد حمود",
        "phone": "0952345678",
        "rating": 4.9,
        "projects": 40,
        "description": "تنسيق ديكور غرف نوم فندقية فاخرة.",
        "image": "assets/images/bed3.jpg",
      },
      {
        "name": "سارة الزين",
        "phone": "0961234567",
        "rating": 4.7,
        "projects": 18,
        "description": "لمسة أنثوية دافئة وألوان هادئة.",
        "image": "assets/images/1.jpg",
      },
      {
        "name": "باسل الحسن",
        "phone": "0949876543",
        "rating": 4.6,
        "projects": 22,
        "description": "خبير في استغلال المساحات الصغيرة.",
        "image": "assets/images/1.jpg",
      },
    ],
    "دهان بلاستيك": [
      {
        "name": "سامر قزق",
        "phone": "0998881111",
        "rating": 4.4,
        "projects": 20,
        "description": "خبير في الدهانات البلاستيكية ذات الجودة العالية.",
        "image": "assets/images/color1.jpg",
      },
      {
        "name": "رامي كنعان",
        "phone": "0943339999",
        "rating": 4.2,
        "projects": 15,
        "description": "دهان سريع التنفيذ ودقيق في التفاصيل.",
        "image": "assets/images/color2.jpg",
      },
      {
        "name": "هادي مرعي",
        "phone": "0931122334",
        "rating": 4.5,
        "projects": 18,
        "description": "يعتمد مواد إيطالية ممتازة.",
        "image": "assets/images/color3.jpg",
      },
      {
        "name": "عماد خضور",
        "phone": "0987654321",
        "rating": 4.7,
        "projects": 24,
        "description": "يعتمد على الألوان الحديثة والمنعشة.",
        "image": "assets/images/1.jpg",
      },
      {
        "name": "ليلى عبد الله",
        "phone": "0977778888",
        "rating": 4.3,
        "projects": 12,
        "description": "متخصصة في تلوين الغرف حسب النمط النفسي.",
        "image": "assets/images/1.jpg",
      },
    ],
  };

  static List<ServiceItemModel> getDesignersByCategory(String category) {
    final data = _designersData[category] ?? [];
    return data.map((e) => ServiceItemModel.fromMap(e)).toList();
  }
}
