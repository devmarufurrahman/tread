import 'package:get/get.dart';

class InspirationController extends GetxController {
  final RxList<InspirationArticle> articles =
      <InspirationArticle>[
        InspirationArticle(
          imageUrl: 'assets/images/Frame2.png',
          title: '5 Ways to Encourage a Friend Going Through a Tough Time',
          descriptionFast:
              'Simple but meaningful gestures that can make a big difference in someone\'s day.',
          descriptionLong:
              'Dinner is often the one time in the day when the whole family gathers in the same place — no screens, no rush, just people. Turning that time into something intentional doesn’t require deep planning or heavy questions. Here are a few practical ways to create meaningful conversation at the dinner table:',
          sir1: '''
🌱 1. Ask One “Real” Question Per Meal
Skip “How was your day?” and try something like:
“What’s one thing that made you smile today?”
“Did anything challenge you today?”
“Who is someone you’d like to encourage this week?”
''',
          sir2: '''
🌿 2. Introduce a Gratitude Moment
Go around the table and let everyone name one thing they’re thankful for. This helps cultivate appreciation and attentiveness, especially after a tough day.
''',
        ),
        InspirationArticle(
          imageUrl: 'assets/images/Frame1.png',
          title: 'Creating Meaningful Family Dinner Conversations',
          descriptionFast:
              'Simple but meaningful gestures that can make a\n\n big difference in someone\'s day.',
          descriptionLong:
              'When a friend is struggling, it’s easy to feel unsure of what to say or do. But even the smallest intentional actions can remind them they’re not alone. Encouragement isn’t about fixing—it’s about presence, empathy, and showing up. Here are five thoughtful ways to support a friend who’s facing a hard season:',
          sir1: '''
💌 1. Send a Handwritten Note or Card
In a digital world, handwritten notes feel deeply personal. A short message like “Thinking of you today—you're not alone” can bring comfort in ways texts often can’t. Bonus: include a meaningful quote or memory.
''',
          sir2: '''
☕ 2. Drop Off Something Thoughtful
Whether it's their favorite coffee, a comforting meal, or a small care package, a surprise delivery can say, “I see you” without requiring them to engage if they’re not ready.
''',
        ),
      ].obs;

  // Method to add a new article
  void addArticle(InspirationArticle article) {
    articles.add(article);
  }

  // Method to remove an article by index
  void removeArticle(int index) {
    if (index >= 0 && index < articles.length) {
      articles.removeAt(index);
    }
  }
}

// Define the InspirationArticle model class for better type safety
class InspirationArticle {
  final String imageUrl;
  final String title;
  final String descriptionFast;
  final String descriptionLong;
  final String sir1;
  final String sir2;

  InspirationArticle({
    required this.imageUrl,
    required this.title,
    required this.descriptionFast,
    required this.descriptionLong,
    required this.sir1,
    required this.sir2,
  });
}
