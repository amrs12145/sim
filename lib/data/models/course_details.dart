import 'staff.dart';

class CourseDetails {
  int courseCode;
  String name;
  int creditHours;
  String briefInfo;
  String type;
  String img;
  List<Staff> staffs;
  String? status;

  CourseDetails({
    required this.courseCode,
    required this.name,
    required this.creditHours,
    required this.briefInfo,
    required this.type,
    required this.img,
    required this.staffs,
    required this.status,
  });

  factory CourseDetails.fromJson(Map<String, dynamic> json) => CourseDetails(
        courseCode: json["course_code"],
        name: json["name"],
        creditHours: json["credit_hours"],
        briefInfo: json["brief_info"],
        type: json["type"],
        img: json["img"],
        staffs: List<Staff>.from(json["staffs"].map((x) => Staff.fromJson(x)))
            .toList(),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "course_code": courseCode,
        "name": name,
        "credit_hours": creditHours,
        "brief_info": briefInfo,
        "type": type,
        "img": img,
        "staffs": List<Staff>.from(staffs.map((x) => x.toJson()).toList()),
        "status": status,
      };
}
