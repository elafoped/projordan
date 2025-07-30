import 'package:flutter/material.dart';

class RequestsScreen1 extends StatelessWidget {
  const RequestsScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الطلبات'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'الطلبات المستلمة'),
              Tab(text: 'الطلبات المُرسلة'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ReceivedRequestsTab(),
            SentRequestsTab(),
          ],
        ),
      ),
    );
  }
}

class ReceivedRequestsTab extends StatelessWidget {
  const ReceivedRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة طلبات مستلمة (مثال وهمي)
    final requests = [
      {
        "buyerName": "محمد الأحمد",
        "propertyTitle": "شقة في مشروع دمر",
        "phone": "0933456789",
        "status": "قيد المراجعة"
      },
      {
        "buyerName": "سارة ديب",
        "propertyTitle": "محل تجاري في كفرسوسة",
        "phone": "0941234567",
        "status": "بانتظار الرد"
      },
    ];

    return ListView.builder(
      itemCount: requests.length,
      itemBuilder: (context, index) {
        final req = requests[index];
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(req["propertyTitle"]!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("الزبون: ${req["buyerName"]}"),
                Text("الهاتف: ${req["phone"]}"),
                Text("الحالة: ${req["status"]}"),
              ],
            ),
            trailing: PopupMenuButton<String>(
              onSelected: (choice) {
                // تعامل مع الخيارات هون
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'reject', child: Text('رفض')),
                const PopupMenuItem(value: 'negotiate', child: Text('طلب تفاوض')),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SentRequestsTab extends StatelessWidget {
  const SentRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة الطلبات المرسلة (مثال وهمي)
    final requests = [
      {
        "propertyTitle": "فيلا في يعفور",
        "status": "قيد المراجعة",
        "ownerPhone": "0955678901",
      },
      {
        "propertyTitle": "أرض في معضمية",
        "status": "مقبول",
        "ownerPhone": "0933212123",
      },
    ];

    return ListView.builder(
      itemCount: requests.length,
      itemBuilder: (context, index) {
        final req = requests[index];
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(req["propertyTitle"]!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("صاحب العقار: ${req["ownerPhone"]}"),
                Text("الحالة: ${req["status"]}"),
              ],
            ),
            trailing: PopupMenuButton<String>(
              onSelected: (choice) {
                // معالجة "تعديل" أو "إلغاء"
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'edit', child: Text('تعديل')),
                const PopupMenuItem(value: 'cancel', child: Text('إلغاء')),
              ],
            ),
          ),
        );
      },
    );
  }
}
