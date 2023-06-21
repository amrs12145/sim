import 'package:sim/data/models/course.dart';

class Staff {
  String name;
  String verboseTitle;
  String email;
  String? phoneNumber;
  String? img;
  String department;
  String degree;
  String title;
  List<Course>? courses;

  Staff({
    required this.name,
    required this.verboseTitle,
    required this.email,
    required this.phoneNumber,
    required this.img,
    required this.department,
    required this.degree,
    required this.title,
    required this.courses,
  });

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
        name: json["name"],
        verboseTitle: json["verbose_title"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        img: json["img"],
        department: json["department"],
        degree: json["degree"],
        title: json["title"],
        courses: json["courses"] == null
            ? null
            : Course.fromJsonList(json["courses"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "verbose_title": verboseTitle,
        "email": email,
        "phone_number": phoneNumber,
        "img": img,
        "department": department,
        "degree": degree,
        "title": title,
        "courses": courses?.map((e) => e.toJson()).toList(),
      };
}
