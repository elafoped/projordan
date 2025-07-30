

import 'dart:ui' as BorderType;
import 'package:flutter/material.dart';
import 'package:projordan/core/constants/colors.dart';
import 'package:projordan/data/models/properties_list_model.dart'; // استيراد الموديل
import 'package:projordan/presentation/widgets/search_bar.dart';
import 'widgets/list_pro_card.dart';

class PropertiesList extends StatefulWidget {
  const PropertiesList({super.key});

  @override
  State<PropertiesList> createState() => _PropertiesListState();
}

class _PropertiesListState extends State<PropertiesList> {
  final ScrollController _scrollController = ScrollController();
  double _imageOpacity = 1.0;
  double _containerOffset = 0.0;
  String selectedLocation = "الكل";
  double minPrice = 0;
  double maxPrice = double.infinity;

  List<PropertiesListModel> filteredList = realEstates;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      setState(() {
        _imageOpacity = (1.0 - offset / 200).clamp(0.7, 1.0);
        _containerOffset = -offset.clamp(0.0, 100.0);
      });
    });
  }

void _applyFilters() {
  setState(() {
    filteredList = realEstates.where((item) {
      final matchesLocation = selectedLocation == "الكل" || item.distance.contains(selectedLocation);
      final matchesPrice = item.price >= minPrice && item.price <= maxPrice;
      final matchesPropertyType = selectedPropertyType == "الكل" || item.type == selectedPropertyType;
      final matchesRooms = selectedRooms == null || item.rooms == selectedRooms;
      final matchesLegalStatus = selectedLegalStatus == "الكل" || item.legalStatus == selectedLegalStatus;
      final matchesOfferType = selectedOfferType == "الكل" || item.offerType == selectedOfferType;

      return matchesLocation &&
             matchesPrice &&
             matchesPropertyType &&
             matchesRooms &&
             matchesLegalStatus &&
             matchesOfferType;
    }).toList();
  });
}

  void _filterSearch(String query) {
    setState(() {
      filteredList =
          realEstates.where((item) {
            return item.title.contains(query) || item.distance.contains(query);
          }).toList();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
String selectedPropertyType = "الكل";
int? selectedRooms;
String selectedLegalStatus = "الكل";
String selectedOfferType = "الكل";

void _showFilterModal() {

  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setModalState) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "فلترة العقارات",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  // 📍 المنطقة / المدينة
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: "المنطقة / المدينة"),
                    value: selectedLocation,
                    items: ["الكل", "دمشق", "حلب", "حمص"].map((location) {
                      return DropdownMenuItem(
                        value: location,
                        child: Text(location),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setModalState(() => selectedLocation = value!);
                    },
                  ),

                  const SizedBox(height: 12),

                  // 💰 السعر
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "أقل سعر",
                          ),
                          onChanged: (val) {
                            setModalState(() {
                              minPrice = double.tryParse(val) ?? 0;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "أعلى سعر",
                          ),
                          onChanged: (val) {
                            setModalState(() {
                              maxPrice = double.tryParse(val) ?? double.infinity;
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // 🏠 نوع العقار
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: "نوع العقار"),
                    value: selectedPropertyType,
                    items: [
                      "الكل",
                      "شقة",
                      "فيلا",
                      "أرض",
                      "مكتب",
                      "محل تجاري"
                    ].map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setModalState(() => selectedPropertyType = value!);
                    },
                  ),

                  const SizedBox(height: 12),

                  // 🚪 عدد الغرف
                  DropdownButtonFormField<int>(
                    decoration: const InputDecoration(labelText: "عدد الغرف"),
                    value: selectedRooms,
                    items: List.generate(6, (index) => index + 1).map((roomCount) {
                      return DropdownMenuItem(
                        value: roomCount,
                        child: Text("$roomCount غرف"),
                      );
                    }).toList()
                      ..insert(0, const DropdownMenuItem(
                        value: null,
                        child: Text("الكل"),
                      )),
                    onChanged: (value) {
                      setModalState(() => selectedRooms = value);
                    },
                  ),

                  const SizedBox(height: 12),

                  // 📜 الحالة القانونية
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: "الحالة القانونية"),
                    value: selectedLegalStatus,
                    items: [
                      "الكل",
                      "مُسجّل",
                      "قيد التسوية",
                      "عقد عرفي"
                    ].map((status) {
                      return DropdownMenuItem(
                        value: status,
                        child: Text(status),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setModalState(() => selectedLegalStatus = value!);
                    },
                  ),

                  const SizedBox(height: 12),

                  // 📢 نوع العرض
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: "نوع العرض"),
                    value: selectedOfferType,
                    items: [
                      "الكل",
                      "بيع",
                      "إيجار"
                    ].map((offer) {
                      return DropdownMenuItem(
                        value: offer,
                        child: Text(offer),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setModalState(() => selectedOfferType = value!);
                    },
                  ),

                  const SizedBox(height: 20),

                  // ✅ زر تطبيق الفلترة
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _applyFilters(); // تفعيل الفلترة
                    },
                    icon: const Icon(Icons.filter_alt,color: Colors.white,),
                    label: const Text("تطبيق الفلترة",style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // ✅ خلفية الصورة
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Opacity(
                opacity: _imageOpacity,
                child: Image.asset(
                  "assets/images/header.jpg",
                  height: height * 0.33,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // ✅ حاوية العقارات
          Positioned(
            bottom: -_containerOffset - 100,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.85,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        itemCount: filteredList.length,
                        itemBuilder: (context, index) {
                          final property = filteredList[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: RealEstateCard(
                              title: property.title,
                              distance: property.distance,
                              price: property.price,
                              reviews: property.reviews,
                              images: property.images, rooms: property.rooms,
                               bathrooms: property.rooms, 
                               services: property.services,
                                userId: property.userId,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ✅ تدرج سفلي
          Positioned(
            bottom: height * 0.0,
            left: 0,
            right: 0,
            child: Container(
              height: height / 6,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    BorderType.Color.fromARGB(0, 255, 255, 255),
                    BorderType.Color.fromARGB(158, 0, 0, 0),
                  ],
                ),
              ),
            ),
          ),
          // في مكان SearchBarWidget:
          Positioned(
            top: 35,
            left: 16,
            right: 16,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBarWidget(
                onChanged: _filterSearch, // ⬅️ تمرير الدالة
                onFilterPressed: _showFilterModal,
              ),
            ),
          ),

          Positioned(
            top: 10,
            right: 15,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
