class IntentionsPost {
  String? friendId;
  String? titleOfIntention;
  String? selectTree;
  String? categories;
  String? date;
  String? relationship;
  String? note;

  IntentionsPost({
    required this.friendId,
    required this.titleOfIntention,
    required this.selectTree,
    required this.categories,
    required this.date,
    required this.relationship,
    required this.note,
  });

  // IntentionsPost.fromJson(Map<String, dynamic> json) {
  //   friendId = json['friend_id'];
  //   titleOfIntention = json['title_of_intention'];
  //   selectTree = json['select_tree'];
  //   categories = json['categories'];
  //   date = json['date'];
  //   relationship = json['relationship'];
  //   note = json['note'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['friend_id'] = friendId;
    data['title_of_intention'] = titleOfIntention;
    data['select_tree'] = selectTree;
    data['categories'] = categories;

    // Debug: Print the original date value
    print('Original date value: "${date}"');

    // Format date as ISO-8601 with timezone
    if (this.date != null && date!.isNotEmpty) {
      try {
        // Force UTC timezone and proper ISO format
        DateTime dateTime;
        if (date!.contains('T')) {
          // If it already has time, parse it and convert to UTC
          dateTime = DateTime.parse(date!).toUtc();
        } else {
          // If it's just a date, add time and convert to UTC
          dateTime = DateTime.parse('${date!}T00:00:00Z');
        }

        // Ensure it's in UTC and format properly
        final isoString = dateTime.toIso8601String();
        print('Formatted ISO date: $isoString');
        data['date'] = isoString;
      } catch (e) {
        print('Date parsing error: $e');
        // Fallback: create a proper ISO date in UTC
        final now = DateTime.now().toUtc();
        final isoString = now.toIso8601String();
        print('Fallback ISO date: $isoString');
        data['date'] = isoString;
      }
    } else {
      // If no date provided, use current date in UTC
      final now = DateTime.now().toUtc();
      final isoString = now.toIso8601String();
      print('Default ISO date: $isoString');
      data['date'] = isoString;
    }

    data['relationship'] = this.relationship;
    data['note'] = this.note;

    // Debug: Print the final JSON
    print('Final JSON data: $data');

    return data;
  }
}
