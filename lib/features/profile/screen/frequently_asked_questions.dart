import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/responsive.dart';

class FAQItem {
  final String question;
  final String answer;
  FAQItem({required this.question, required this.answer});
}

class FAQController extends GetxController {
  RxInt expandedIndex = (-1).obs;

  final faqs =
      [
        FAQItem(
          question: "Is there a free trial available?",
          answer:
              "Yes, you can try us for free for 30 days. If you want, we'll provide you with a free, personalized 30-minute onboarding call to get you up and running as soon as possible.",
        ),
        FAQItem(
          question: "Can I change my plan later?",
          answer:
              "Yes, you can upgrade or downgrade your plan at any time. Changes to your plan will be reflected in your next billing cycle. If you upgrade, you'll be charged the prorated amount for the remainder of your billing period.",
        ),
        FAQItem(
          question: "What is your cancellation policy?",
          answer:
              "You can cancel your subscription at any time. When you cancel, you'll continue to have access to all features until the end of your current billing period. We don't offer refunds for partial months, but you won't be charged for the next billing cycle.",
        ),
        FAQItem(
          question: "Can other info be added to an invoice?",
          answer:
              "Yes, you can customize your invoices by adding your company logo, business details, tax information, and custom notes. You can also set up automatic invoice reminders and payment terms.",
        ),
        FAQItem(
          question: "How does billing work?",
          answer:
              "We offer flexible billing options including monthly and annual plans. You can choose to pay via credit card, PayPal, or bank transfer. Invoices are automatically generated and sent to your email. You can view your billing history and download past invoices from your dashboard.",
        ),
        FAQItem(
          question: "How do I change my account email?",
          answer:
              "You can change your account email by going to your profile settings. Click on 'Account Settings' and then 'Email Preferences'. Enter your new email address and we'll send a verification link to confirm the change. Make sure to verify your new email address to complete the process.",
        ),
      ].obs;
}

class FrequentlyAskedQuestions extends StatelessWidget {
  FrequentlyAskedQuestions({super.key});
  final FAQController controller = Get.put(FAQController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5EAF2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 18),
                // Top icon circle
                Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5F5EC),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.question_answer, // Kept as question_answer
                        color: Color(0xFF3CB371),
                        size: 40,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Center(
                  child: Text(
                    "Frequently asked questions",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Text(
                    "Everything you need to know about the product and billing.",
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 18),

                // FAQ list with ExpansionTile
                Obx(
                  () => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.faqs.length,
                    separatorBuilder:
                        (_, __) => const Divider(
                          height: 1,
                          thickness: 1,
                          color: Color(0xFFDFE3E8),
                        ),
                    itemBuilder: (context, index) {
                      final faq = controller.faqs[index];
                      // bool isExpanded = controller.expandedIndex.value == index;
                      return Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        child: ExpansionTile(
                          initiallyExpanded: false,
                          onExpansionChanged: (expanded) {
                            controller.expandedIndex.value =
                                expanded ? index : -1;
                            // print(expanded);
                          },
                          tilePadding: const EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 0,
                          ),
                          title: Obx(
                            () => Text(
                              faq.question,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                    controller.expandedIndex.value == index
                                        ? FontWeight.w600
                                        : FontWeight.w500,
                                color:
                                    controller.expandedIndex.value == index
                                        ? const Color(0xFF3CB371)
                                        : Colors.black87,
                              ),
                            ),
                          ),
                          trailing: Obx(
                            () => Icon(
                              controller.expandedIndex.value == index
                                  ? Icons.remove_circle_outline
                                  : Icons.add_circle_outline,
                              color:
                                  controller.expandedIndex.value == index
                                      ? const Color(0xFF3CB371)
                                      : Colors.grey,
                              size: 24,
                            ),
                          ),
                          children: [
                            if (faq.answer.isNotEmpty)
                              Padding(
                                padding: Responsive.getResponsivePadding(
                                  context,
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    faq.answer,
                                    style: TextStyle(
                                      fontSize:
                                          Responsive.getResponsiveFontSize(
                                            context,
                                            15,
                                          ),
                                      color: Colors.black87,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: Responsive.getResponsiveSpacing(context, 28)),

                // Bottom contact box
                // Container(
                //   width: double.infinity,
                //   padding: Responsive.getResponsivePadding(
                //     context,
                //     vertical: 22,
                //     horizontal: 16,
                //   ),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(14),
                //   ),
                //   child: Column(
                //     children: [
                //       Text(
                //         "Still have questions?",
                //         style: TextStyle(
                //           fontWeight: FontWeight.w600,
                //           fontSize: Responsive.getResponsiveFontSize(
                //             context,
                //             16,
                //           ),
                //           color: Colors.black87,
                //         ),
                //       ),
                //       SizedBox(
                //         height: Responsive.getResponsiveSpacing(context, 8),
                //       ),
                //       Text(
                //         "Can't find the answer you're looking for? Please chat to our friendly team.",
                //         style: TextStyle(
                //           fontSize: Responsive.getResponsiveFontSize(
                //             context,
                //             15,
                //           ),
                //           color: Colors.black54,
                //         ),
                //         textAlign: TextAlign.center,
                //       ),
                //       SizedBox(
                //         height: Responsive.getResponsiveSpacing(context, 14),
                //       ),
                //       SizedBox(
                //         width: double.infinity,
                //         child: ElevatedButton(
                //           style: ElevatedButton.styleFrom(
                //             backgroundColor: const Color(0xFF3CB371),
                //             padding: const EdgeInsets.symmetric(vertical: 12),
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(8),
                //             ),
                //           ),
                //           onPressed: () {},
                //           child: const Text(
                //             "Get in touch",
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontWeight: FontWeight.w600,
                //               fontSize: 16,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
