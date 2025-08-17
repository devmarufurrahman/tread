import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screen/person_profile_screen.dart';

// Model for person data that will come from API
class PersonData {
  final String id;
  final String? name;
  final String? imageUrl;
  final Color? placeholderColor;

  PersonData({
    required this.id,
    this.name,
    this.imageUrl,
    this.placeholderColor,
  });
}

class TreeWithPeople extends StatelessWidget {
  final String treeImagePath;
  final double width;
  final double height;
  final List<PersonData>? peopleData; // Future API data

  const TreeWithPeople({
    super.key,
    required this.treeImagePath,
    this.width = 300,
    this.height = 300,
    this.peopleData, // Optional API data
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Make size responsive to screen size while maintaining aspect ratio
    final responsiveWidth = width.clamp(screenWidth * 0.7, screenWidth * 0.9);
    final responsiveHeight = height.clamp(
      screenHeight * 0.3,
      screenHeight * 0.5,
    );
    final actualWidth =
        responsiveWidth < responsiveHeight ? responsiveWidth : responsiveHeight;
    final actualHeight = actualWidth; // Keep it square

    // Scale factor for positioning based on actual size vs default size
    final scaleFactor = actualWidth / 300;

    // Generate dummy data if API data is not provided
    final displayPeople = peopleData ?? _generateDummyPeople();

    return SizedBox(
      width: actualWidth,
      height: actualHeight,
      child: Stack(
        children: [
          // Base tree image
          Positioned.fill(
            child: Image.asset(treeImagePath, fit: BoxFit.contain),
          ),

          // People positioned on branch tips (keeping exact positions)
          ..._buildPeopleWidgets(
            displayPeople,
            scaleFactor,
            actualWidth,
            actualHeight,
          ),
        ],
      ),
    );
  }

  // Generate dummy data with the same positions and colors
  List<PersonData> _generateDummyPeople() {
    return [
      PersonData(
        id: 'person_1',
        name: 'Person 1',
        placeholderColor: Colors.blue[100],
      ),
      PersonData(
        id: 'person_2',
        name: 'Person 2',
        placeholderColor: Colors.pink[100],
      ),
      PersonData(
        id: 'person_3',
        name: 'Person 3',
        placeholderColor: Colors.green[100],
      ),
      PersonData(
        id: 'person_4',
        name: 'Person 4',
        placeholderColor: Colors.orange[100],
      ),
      PersonData(
        id: 'person_5',
        name: 'Person 5',
        placeholderColor: Colors.purple[100],
      ),
      PersonData(
        id: 'person_6',
        name: 'Person 6',
        placeholderColor: Colors.teal[100],
      ),
      PersonData(
        id: 'person_7',
        name: 'Person 7',
        placeholderColor: Colors.amber[100],
      ),
      PersonData(
        id: 'person_8',
        name: 'Person 8',
        placeholderColor: Colors.cyan[100],
      ),
      PersonData(
        id: 'person_9',
        name: 'Person 9',
        placeholderColor: Colors.indigo[100],
      ),
      PersonData(
        id: 'person_10',
        name: 'Person 10',
        placeholderColor: Colors.lime[100],
      ),
      PersonData(
        id: 'person_11',
        name: 'Person 11',
        placeholderColor: Colors.red[100],
      ),
      PersonData(
        id: 'person_12',
        name: 'Person 12',
        placeholderColor: Colors.deepPurple[100],
      ),
    ];
  }

  // Build people widgets with exact same positions
  List<Widget> _buildPeopleWidgets(
    List<PersonData> people,
    double scaleFactor,
    double actualWidth,
    double actualHeight,
  ) {
    final positions = [
      // Keep exact same positions as before
      {'top': 0.05, 'left': 0.465, 'size': 26.0}, // Top center
      {'top': 0.03, 'left': 0.34, 'size': 24.0}, // Top left
      {'top': 0.05, 'right': 0.32, 'size': 25.0}, // Top right
      {'top': 0.04, 'left': 0.16, 'size': 27.0}, // Upper left
      {'top': 0.05, 'right': 0.17, 'size': 26.0}, // Upper right
      {'top': 0.3, 'left': 0.01, 'size': 28.0}, // Left branch
      {'top': 0.30, 'right': 0.04, 'size': 27.0}, // Right branch
      {'top': 0.18, 'left': 0.2, 'size': 28.0}, // Lower left
      {'top': 0.3, 'left': 0.3, 'size': 25.0}, // Lower center
      {'top': 0.3, 'right': 0.29, 'size': 27.0}, // Lower right
      {'top': 0.44, 'left': 0.01, 'size': 26.0}, // Bottom left
      {'top': 0.44, 'right': 0.04, 'size': 25.0}, // Bottom right
    ];

    return List.generate(positions.length.clamp(0, people.length), (index) {
      final position = positions[index];
      final person = people[index];

      return Positioned(
        top: actualHeight * position['top']!,
        left:
            position.containsKey('left')
                ? actualWidth * position['left']!
                : null,
        right:
            position.containsKey('right')
                ? actualWidth * position['right']!
                : null,
        child: _buildPersonPlaceholder(position['size']! * scaleFactor, person),
      );
    });
  }

  Widget _buildPersonPlaceholder(double size, PersonData person) {
    // Make sizes more uniform, similar to peopleScreen.png
    final clampedSize = size.clamp(22.0, 32.0);
    final backgroundColor = person.placeholderColor ?? Colors.blue[100]!;

    return GestureDetector(
      onTap: () {
        // Navigate to person profile screen
        Get.to(
          () => PersonProfileScreen(
            personId: person.id,
            personName: person.name,
            personImageUrl: person.imageUrl,
          ),
        );
      },
      child: Container(
        width: clampedSize,
        height: clampedSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
          border: Border.all(
            color: const Color(0xFF4CAF50),
            width: 2.0, // Consistent border width
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 4.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipOval(
          child:
              person.imageUrl != null
                  ? Image.network(
                    person.imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) =>
                            _buildPlaceholderContent(
                              clampedSize,
                              backgroundColor,
                            ),
                  )
                  : _buildPlaceholderContent(clampedSize, backgroundColor),
        ),
      ),
    );
  }

  Widget _buildPlaceholderContent(double clampedSize, Color backgroundColor) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [backgroundColor, backgroundColor.withValues(alpha: 0.8)],
        ),
      ),
      child: Icon(
        Icons.person,
        size: clampedSize * 0.55, // Slightly larger icon
        color: Colors.grey[600],
      ),
    );
  }
}
