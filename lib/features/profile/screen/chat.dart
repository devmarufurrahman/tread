// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:tread256/core/common/widgets/shimmer_loading.dart';

// class ChatController extends GetxController {
//   var messages =
//       <ChatMessage>[
//         ChatMessage(
//           text: "Hi, Mandy",
//           isMe: true,
//           avatarUrl: "https://randomuser.me/api/portraits/men/1.jpg",
//           time: DateTime.now(),
//         ),
//         ChatMessage(
//           text: "I've tried the app",
//           isMe: true,
//           avatarUrl: "https://randomuser.me/api/portraits/men/1.jpg",
//           time: DateTime.now(),
//         ),
//         ChatMessage(
//           text: "Really?",
//           isMe: false,
//           avatarUrl: "https://randomuser.me/api/portraits/women/2.jpg",
//           time: DateTime.now(),
//         ),
//         ChatMessage(
//           text: "Yeah, It's really good!",
//           isMe: true,
//           avatarUrl: "https://randomuser.me/api/portraits/men/1.jpg",
//           time: DateTime.now(),
//         ),
//         ChatMessage(
//           text: "Typing...",
//           isMe: false,
//           avatarUrl: "https://randomuser.me/api/portraits/women/2.jpg",
//           isTyping: true,
//         ),
//       ].obs;

//   void sendMessage(String? text) {
//     messages.add(
//       ChatMessage(
//         text: text,
//         isMe: true,
//         avatarUrl: "https://randomuser.me/api/portraits/men/1.jpg",
//         time: DateTime.now(),
//       ),
//     );

//     // Add typing indicator
//     messages.add(
//       ChatMessage(
//         text: "Typing...",
//         isMe: false,
//         avatarUrl: "https://randomuser.me/api/portraits/women/2.jpg",
//         isTyping: true,
//       ),
//     );

//     // Simulate a support reply after a delay
//     Future.delayed(const Duration(seconds: 1), () {
//       // Remove typing indicator
//       messages.removeWhere((msg) => msg.isTyping);

//       // Add support reply
//       messages.add(
//         ChatMessage(
//           text: getSupportReply(text),
//           isMe: false,
//           avatarUrl: "https://randomuser.me/api/portraits/women/2.jpg",
//           time: DateTime.now(),
//         ),
//       );
//     });
//   }

//   // Simple support reply logic (customize as you wish)
//   String getSupportReply(String? userMessage) {
//     if (userMessage!.toLowerCase().contains("hello") ||
//         userMessage.toLowerCase().contains("hi")) {
//       return "Hello! How can I help you today?";
//     } else if (userMessage.toLowerCase().contains("app")) {
//       return "Glad you tried the app! Do you have any feedback?";
//     } else if (userMessage.toLowerCase().contains("good")) {
//       return "Thank you! We're happy you like it.";
//     } else {
//       return "Thank you for your message. Our support team will get back to you soon!";
//     }
//   }
// }

// class ChatMessage {
//   String? text;
//   final bool isMe;
//   final String avatarUrl;
//   final DateTime? time;
//   final bool isTyping;

//   ChatMessage({
//     this.text,
//     required this.isMe,
//     required this.avatarUrl,
//     this.time,
//     this.isTyping = false,
//   });
// }

// class ChatPage extends StatelessWidget {
//   final String? message;
//   ChatPage({super.key, this.message});

//   final TextEditingController textController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final ChatController controller = Get.put(ChatController());

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text(
//           'AI Seeds Sugestions',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Color(0xff57B396),
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Color(0xff57B396)),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(color: Colors.white),
//         child: Column(
//           children: [
//             const SizedBox(height: 8),

//             // const Text(
//             //   "09:41 AM",
//             //   style: TextStyle(color: Colors.black, fontSize: 14),
//             //   textAlign: TextAlign.center,
//             // ),
//             Expanded(
//               child: Obx(
//                 () => ListView.builder(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 8,
//                   ),
//                   itemCount: controller.messages.length,
//                   itemBuilder: (context, index) {
//                     final msg = controller.messages[index];
//                     if (msg.isTyping) {
//                       return Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 16,
//                             child: ClipOval(
//                               child: CachedNetworkImage(
//                                 imageUrl: msg.avatarUrl,
//                                 width: 32,
//                                 height: 32,
//                                 fit: BoxFit.cover,
//                                 placeholder: (context, url) => const ShimmerCircle(size: 32),
//                                 errorWidget: (context, url, error) => const Icon(Icons.person, size: 16),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           const Text(
//                             "Typing...",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontStyle: FontStyle.italic,
//                             ),
//                           ),
//                         ],
//                       );
//                     }

//                     return Align(
//                       alignment:
//                           msg.isMe
//                               ? Alignment.centerRight
//                               : Alignment.centerLeft,
//                       child: Column(
//                         crossAxisAlignment:
//                             msg.isMe
//                                 ? CrossAxisAlignment.end
//                                 : CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment:
//                                 msg.isMe
//                                     ? MainAxisAlignment.end
//                                     : MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               if (!msg.isMe)
//                                 CircleAvatar(
//                                   radius: 16,
//                                   child: ClipOval(
//                                     child: CachedNetworkImage(
//                                       imageUrl: msg.avatarUrl,
//                                       width: 32,
//                                       height: 32,
//                                       fit: BoxFit.cover,
//                                       placeholder: (context, url) => const ShimmerCircle(size: 32),
//                                       errorWidget: (context, url, error) => const Icon(Icons.person, size: 16),
//                                     ),
//                                   ),
//                                 ),
//                               if (!msg.isMe) const SizedBox(width: 8),
//                               Flexible(
//                                 child: Container(
//                                   margin: const EdgeInsets.symmetric(
//                                     vertical: 4,
//                                   ),
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 16,
//                                     vertical: 10,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color:
//                                         msg.isMe
//                                             ? Color(0xff57B396)
//                                             : Color(0xffF2F4F5),
//                                     borderRadius: BorderRadius.only(
//                                       topLeft: const Radius.circular(18),
//                                       topRight: const Radius.circular(18),
//                                       bottomLeft: Radius.circular(
//                                         msg.isMe ? 18 : 0,
//                                       ),
//                                       bottomRight: Radius.circular(
//                                         msg.isMe ? 0 : 18,
//                                       ),
//                                     ),
//                                   ),
//                                   child: Text(
//                                     msg.text ?? "",
//                                     style: TextStyle(
//                                       color:
//                                           msg.isMe
//                                               ? Colors.white
//                                               : Colors.black87,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               if (msg.isMe) const SizedBox(width: 8),
//                               if (msg.isMe)
//                                 CircleAvatar(
//                                   radius: 16,
//                                   child: ClipOval(
//                                     child: CachedNetworkImage(
//                                       imageUrl: msg.avatarUrl,
//                                       width: 32,
//                                       height: 32,
//                                       fit: BoxFit.cover,
//                                       placeholder: (context, url) => const ShimmerCircle(size: 32),
//                                       errorWidget: (context, url, error) => const Icon(Icons.person, size: 16),
//                                     ),
//                                   ),
//                                 ),
//                             ],
//                           ),
//                           if (msg.time != null)
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 left: 48,
//                                 right: 48,
//                                 top: 2,
//                                 bottom: 8,
//                               ), // adjust as needed
//                               child: Text(
//                                 DateFormat('hh:mm a').format(msg.time!),
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: textController,
//                       style: TextStyle(color: Colors.black),
//                       decoration: InputDecoration(
//                         hintText: "Type your message",
//                         hintStyle: const TextStyle(color: Colors.black45),
//                         filled: true,
//                         fillColor: Colors.grey[200],
//                         contentPadding: const EdgeInsets.symmetric(
//                           vertical: 12,
//                           horizontal: 16,
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           // borderSide: BorderSide.none,
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide.none,
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   IconButton(
//                     icon: const Icon(Icons.send, color: Color(0xff57B396)),
//                     onPressed: () {
//                       if (textController.text.trim().isNotEmpty) {
//                         controller.sendMessage(
//                           message ?? textController.text.trim(),
//                         );
//                         textController.clear();
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }
