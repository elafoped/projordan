import 'dart:ui';
import 'package:projordan/data/repositories/service_repository.dart';
import 'package:projordan/presentation/widgets/header_image_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class ServiceProviderList extends StatelessWidget {
  final String category;

  const ServiceProviderList({super.key, required this.category});

  Future<void> _launchWhatsApp(String phone) async {
    final url = 'https://wa.me/$phone';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final designers = DesignersRepository.getDesignersByCategory(category);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          HeaderImageWidget(height: height * 0.33, title: "$category"),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.9,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemCount: designers.length,
                separatorBuilder: (_, __) => const Divider(height: 30),
                itemBuilder: (context, index) {
                  final designer = designers[index];

                  return GestureDetector(
                    onTap: () => _launchWhatsApp(designer.phone),

                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(15),
                                ),
                                child: Image.asset(
                                  designer.image,
                                  height: 180,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      designer.name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      designer.description,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber[700],
                                          size: 20,
                                        ),
                                        const SizedBox(width: 4),
                                        Text("${designer.rating}"),
                                        const Spacer(),
                                        Text(
                                          "📞 ${designer.phone}",
                                          style: TextStyle(
                                            color: Colors.blue[700],
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Text("عدد المشاريع: ${designer.projects}"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
