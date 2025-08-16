import 'package:get/get.dart';

class FAQItem {
  final String question;
  final String answer;
  FAQItem({required this.question, required this.answer});
}

class FAQController extends GetxController {
  RxInt expandedIndex = (-1).obs;

  final faqs = [
    FAQItem(
      question: "Is there a free trial available?",
      answer:
          "Yes, you can try us for free for 30 days. If you want, we'll provide you with a free, personalized 30-minute onboarding call to get you up and running as soon as possible.",
    ),
    FAQItem(question: "Can I change my plan later?", answer: ""),
    FAQItem(question: "What is your cancellation policy?", answer: ""),
    FAQItem(question: "Can other info be added to an invoice?", answer: ""),
    FAQItem(question: "How does billing work?", answer: ""),
    FAQItem(question: "How do I change my account email?", answer: ""),
  ];
}
