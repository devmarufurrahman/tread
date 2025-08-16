// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tread256/features/profile/screen/chat.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';

// class ChatInputSection extends StatelessWidget {
//   final TextEditingController chatController;

//   const ChatInputSection({super.key, required this.chatController});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const Text(
//             'What do you want to ask your tree?',
//             style: TextStyle(
//               color: Color(0xff57B396),
//               fontSize: 20,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           const SizedBox(height: 10),

//           TextField(
//             controller: chatController,
//             decoration: InputDecoration(
//               suffixIcon: IconButton(
//                 icon: const Icon(Icons.send),
//                 onPressed: () {
//                   if (chatController.text.trim().isNotEmpty) {
//                     Get.to(() => ChatPage(message: chatController.text));
//                     chatController.clear();
//                   } else {
//                     EasyLoading.showError(
//                       'Please enter a question before sending.',
//                     );
//                   }
//                 },
//               ),
//               fillColor: Colors.grey[200],
//               hintText: 'Write your question here',
//               hintStyle: const TextStyle(
//                 color: Color(0xFFADAEBC),
//                 fontSize: 16,
//               ),
//               filled: true,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30),
//                 borderSide: BorderSide.none,
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30),
//                 borderSide: BorderSide.none,
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
