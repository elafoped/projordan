// // features/discover/presentation/widgets/search_bar.dart
// import 'package:flutter/material.dart';

// class SearchBarWidget extends StatelessWidget {
//   const SearchBarWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: TextField(
//             decoration: InputDecoration(
//               hintText: "ابحث عن عقار أو شركة إكساء",
//               filled: true,
//               fillColor: Colors.white.withOpacity(0.8),
//               prefixIcon: const Icon(Icons.search),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide.none,
//               ),
//               contentPadding: const EdgeInsets.symmetric(horizontal: 16),
//             ),
//           ),
//         ),
//         const SizedBox(width: 8),
//         Container(
//           decoration: BoxDecoration(
//             color: const Color.fromARGB(255, 244, 99, 0),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: IconButton(
//             icon: const Icon(Icons.filter_list, color: Colors.white),
//             onPressed: () {},
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;
final VoidCallback onFilterPressed;

  const SearchBarWidget({super.key, required this.onChanged,  required this.onFilterPressed,
});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: onChanged, // 🔍
            decoration: InputDecoration(
              hintText: "ابحث عن عقار أو شركة إكساء",
              filled: true,
              fillColor: Colors.white.withOpacity(0.8),
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 244, 99, 0),
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: onFilterPressed, // يمكنك تفعيل الفلترة لاحقًا
          ),
        ),
      ],
    );
  }
}
