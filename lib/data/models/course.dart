class Course {
  int courseCode;
  String? name;
  int? creditHours;
  String? briefInfo;
  String? type;
  String? img;
  String? pivotStatus;
  num? score;
  num? pivotScore;
  String? term;
  String? material;
  List<Course>? prereq;

  Course({
    required this.courseCode,
    required this.name,
    required this.creditHours,
    required this.briefInfo,
    required this.type,
    this.img,
    this.pivotStatus,
    this.score,
    this.pivotScore,
    this.term,
    this.material,
    this.prereq,
  });

  static List<Course> fromJsonList(List list) =>
      list.map((e) => Course.fromJson(e)).toList();

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        courseCode: json["course_code"],
        name: json["name"],
        creditHours: json["credit_hours"],
        briefInfo: json["brief_info"],
        type: json["type"],
        img: json["img"],
        pivotStatus: json["pivot"]?["status"] ?? json["status"],
        score: json["score"],
        pivotScore: json["pivot"]?["score"],
        term: json["term"],
        material: json["material"],
        prereq: json["prereq"] == null
            ? []
            : List<Course>.from(json["prereq"]!.map((x) => Course.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "course_code": courseCode,
        "name": name,
        "credit_hours": creditHours,
        "brief_info": briefInfo,
        "type": type,
        "img": img,
        // "status": status,
        "material": material,
        "prereq":
            prereq == null ? null : prereq!.map((e) => e.toJson()).toList(),
      };
}
