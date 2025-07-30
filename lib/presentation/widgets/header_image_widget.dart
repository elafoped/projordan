import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HeaderImageWidget extends StatelessWidget {
  final double height;
  final String title; // عنوان يُعرض فوق الصورة

  const HeaderImageWidget({super.key, required this.height, required this.title});

  @override
  Widget build(BuildContext context) {

    return Positioned.fill(
      child: Align(
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            // الصورة الخلفية
            Image.asset(
              "assets/images/header.jpg",
              height: height,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            // الطبقة السوداء الشفافة
            Container(
              height: height,
              width: double.infinity,
              color: Colors.black.withOpacity(0.4), // شفافية 40%
            ),
            // زر الرجوع في الأعلى يسار
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight, // غيرت لمحاذاة الزر على اليسار
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ),
            // العنوان النصي مع تمرير أفقي
         Align(
  alignment: Alignment.topCenter,
  child: Padding(
    padding: const EdgeInsets.only(top: 16),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              blurRadius: 4,
              color: Colors.black54,
              offset: Offset(1, 1),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    ),
  ),
),
  ],
        ),
      ),
    );
  }
}
