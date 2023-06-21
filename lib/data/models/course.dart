class Course {
  int courseCode;
  String? name;
  int? creditHours;
  String? briefInfo;
  String? type;
  String? status;
  int? score;
  String? term;

  Course({
    required this.courseCode,
    required this.name,
    required this.creditHours,
    required this.briefInfo,
    required this.type,
    this.status,
    this.score,
    this.term,
  });

  static List<Course> fromJsonList(List list) =>
      list.map((e) => Course.fromJson(e)).toList();

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        courseCode: json["course_code"],
        name: json["name"],
        creditHours: json["credit_hours"],
        briefInfo: json["brief_info"],
        type: json["type"],
        status: json["status"],
        score: json["score"],
        term: json["term"],
      );

  Map<String, dynamic> toJson() => {
        "course_code": courseCode,
        "name": name,
        "credit_hours": creditHours,
        "brief_info": briefInfo,
        "type": type,
        "status": status,
      };
}
