// features/main_screen/data/slide_data.dart
import 'package:tread256/features/main_screen/widgets/tree_slider.dart';

List<TreeSlide> getSlides() {
  const slideData = [
    {
      'imagePath':
          'assets/images/peopleScreen.png', // This will be replaced with generated image
      'text': 'Your Personal Tree',
    },
    {'imagePath': 'assets/images/tree3.png', 'text': 'Your Everyday Tree'},
    {'imagePath': 'assets/images/tree1.png', 'text': 'Your Community Tree'},
  ];

  return slideData
      .map(
        (data) => TreeSlide(imagePath: data['imagePath']!, text: data['text']!),
      )
      .toList();
}
