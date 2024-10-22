class Course {
  final int id;
  final String title;
  final String? image; // Mark as nullable
  final String? description;
  final List<String>? freeVideos; // JSONField from Django
  final List<String>? paidVideos; // JSONField from Django
  final String price;
  final double duration; // Convert decimal field to double
  final String level;
  final String language;
  final Instructor instructor;

  Course({
    required this.id,
    required this.title,
    this.image, // Nullable field
    this.description,
    this.freeVideos, // Nullable field
    this.paidVideos, // Nullable field
    required this.price,
    required this.duration,
    required this.level,
    required this.language,
    required this.instructor,
  });

  // Parse from JSON
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      image: json['image'] ?? '', // Default empty string if null
      description: json['description'] ?? '',
      freeVideos: (json['free_videos'] != null)
          ? List<String>.from(json['free_videos']) // Convert JSON array to List<String>
          : [], // Default to empty list if null
      paidVideos: (json['paid_videos'] != null)
          ? List<String>.from(json['paid_videos']) // Convert JSON array to List<String>
          : [], // Default to empty list if null
      price: json['price'].toString(), // Ensure price is treated as string
      duration: double.parse(json['duration'].toString()), // Convert to double
      level: json['level'],
      language: json['language'],
      instructor: Instructor.fromJson(json['instructor']),
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image ?? '', // Handle null by providing default value
      'description': description ?? '',
      'free_videos': freeVideos ?? [], // Handle null with empty list
      'paid_videos': paidVideos ?? [], // Handle null with empty list
      'price': price,
      'duration': duration,
      'level': level,
      'language': language,
      'instructor': instructor.toJson(),
    };
  }
}

class Instructor {
  final int id;
  final String name;
  final String bio;
  final String email;
  final String? profile_image; // Nullable

  Instructor({
    required this.id,
    required this.name,
    required this.bio,
    required this.email,
    this.profile_image, // Nullable field
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      id: json['id'],
      name: json['name'],
      bio: json['bio'],
      email: json['email'],
      profile_image: json['profile_image'] ?? '', // Handle null values
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'bio': bio,
      'email': email,
      'profile_image': profile_image ?? '', // Default value if null
    };
  }
}





