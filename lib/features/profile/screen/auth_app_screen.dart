// import 'package:flutter/material.dart';
// import 'package:tread256/core/common/styles/global_text_style.dart';

// class AboutAppScreen extends StatelessWidget {
//   const AboutAppScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F7FA),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 20),
//               // Logo
//               Center(
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundColor: Colors.green[100],
//                   child: Icon(Icons.eco, color: Colors.green, size: 40),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // App Name
//               Center(
//                 child: Text(
//                   'Seeds App',
//                   style: getTextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.w400,
//                     color: Color(0xFF2ECC71),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Description
//               Text(
//                 'A place for you to ideate, track, and grow your\n community through relationships, community,\n and the causes you care about. Activate\n your network. Reach your world!',

//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Color(0xFF535A6C),
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Paragraphs
//               const Text(
//                 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',

//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Color(0xFF535A6C),
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Bulleted List
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   _BulletText(
//                     'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
//                   ),
//                   _BulletText(
//                     'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
//                   ),
//                   _BulletText(
//                     'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
//                   ),
//                   _BulletText(
//                     'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       // Bottom Navigation Bar
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.teal,
//         unselectedItemColor: Colors.grey,
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Intentions',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.lightbulb),
//             label: 'Inspiration',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//         currentIndex: 0, // Set this according to your navigation
//         onTap: (index) {
//           // Handle navigation
//         },
//       ),
//     );
//   }
// }

// class _BulletText extends StatelessWidget {
//   final String text;
//   const _BulletText(this.text);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             '• ',
//             style: TextStyle(fontSize: 18, color: Color(0xFF535A6C)),
//           ),
//           Expanded(
//             child: Text(
//               text,
//               style: const TextStyle(
//                 fontSize: 14,
//                 color: Color(0xFF535A6C),
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
