class Course {
  final int id;
  final String title;
  final String? image; // Mark as nullable
  final String description;
  final String price;
  final int duration;
  final String level;
  final String language;
  final Instructor instructor;

  Course({
    required this.id,
    required this.title,
    this.image, // Nullable field
    required this.description,
    required this.price,
    required this.duration,
    required this.level,
    required this.language,
    required this.instructor,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      image: json['image'] ?? '', // Provide default empty string if null
      description: json['description'],
      price: json['price'],
      duration: json['duration'],
      level: json['level'],
      language: json['language'],
      instructor: Instructor.fromJson(json['instructor']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image ?? '', // Handle null by providing default value
      'description': description,
      'price': price,
      'duration': duration,
      'level': level,
      'language': language,
      'instructor': instructor.toJson(), // Make sure the instructor's toJson is handled safely as well
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





