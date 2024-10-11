class Course {
  final int id;
  final String title;
  final String image;
  final String description;
  final String price;
  final int duration;
  final String level;
  final String language;
  final Instructor instructor;

  Course({
    required this.id,
    required this.title,
    required this.image,
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
      image: json['image'],
      description: json['description'],
      price: json['price'],
      duration: json['duration'],
      level: json['level'],
      language: json['language'],
      instructor: Instructor.fromJson(json['instructor']),
    );
  }
}

class Instructor {
  final int id;
  final String name;
  final String bio;
  final String email;
  final String profile_image;

  Instructor({
    required this.id,
    required this.name,
    required this.bio,
    required this.email,
    required this.profile_image,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      id: json['id'],
      name: json['name'],
      bio: json['bio'],
      email: json['email'],
      profile_image: json['profile_image'] ?? '', // Ensure null safety
    );
  }
}





