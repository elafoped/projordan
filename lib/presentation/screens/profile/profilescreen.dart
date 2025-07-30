import 'package:flutter/material.dart';
import 'package:projordan/data/repositories/user_repositor.dart';
import 'package:projordan/data/models/user_model.dart';
import 'package:projordan/presentation/widgets/header_image_widget.dart';

class MyProScreen extends StatelessWidget {
  const MyProScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final UserModel? user = UserRepository().getUserById(1);

    return Scaffold(
      backgroundColor: Colors.white,
      body:
      

          Stack(
            children: [
                      HeaderImageWidget(height: height * 0.33, title: ""),
      
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: height * 0.7,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child:
                  
              SingleChildScrollView(
        child: Column(
          children: [
            // 🧍‍♂️ صورة واسم المستخدم
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              alignment: Alignment.center,
              child: Column(
                children: [
           
                  const SizedBox(height: 42),
                  Text(
                    user?.fullName ?? 'اسم المستخدم',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    user?.email ?? 'email@example.com',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),


            // ⚙️ خيارات الإعدادات
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text("تعديل الملف الشخصي"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text("تغيير كلمة المرور"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text("اللغة"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("تسجيل الخروج"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // تسجيل الخروج
              },
            ),
          ],
        ),
      ),
       ),
              ),
               Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.13,),
                  child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.orange[800],
                              child: const Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                              ),
                            ),
                ),
              ),
      

            ],
          ),
      
      
      
      
      
      
      
      
      
      );
  }
}
