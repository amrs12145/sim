class StudentInfo {
  String name;
  String email;
  String phoneNumber;
  String type;
  StudentInfoDetails details;

  StudentInfo({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.type,
    required this.details,
  });

  factory StudentInfo.fromJson(Map<String, dynamic> json) => StudentInfo(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        type: json["type"],
        details: StudentInfoDetails.fromJson(json["details"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "type": type,
        "details": details.toJson(),
      };
}

class StudentInfoDetails {
  String gender;
  String img;
  dynamic tCredit;
  num? cgpa;
  int? elecSim;
  int? manSim;
  int? elecUniv;
  int? manUniv;
  Map<String, num?> termsGpa;

  StudentInfoDetails({
    required this.gender,
    required this.img,
    this.tCredit,
    required this.cgpa,
    this.elecSim,
    this.manSim,
    this.elecUniv,
    this.manUniv,
    required this.termsGpa,
  });

  factory StudentInfoDetails.fromJson(Map<String, dynamic> json) =>
      StudentInfoDetails(
        gender: json["gender"],
        img: json["img"],
        tCredit: json["t_credit"],
        cgpa: json["cgpa"],
        elecSim: json["elec_sim"],
        manSim: json["man_sim"],
        elecUniv: json["elec_univ"],
        manUniv: json["man_univ"],
        termsGpa: Map.from(json["terms_gpa"]).map((k, v) => MapEntry(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "img": img,
        "t_credit": tCredit,
        "cgpa": cgpa,
        "elec_sim": elecSim,
        "man_sim": manSim,
        "elec_univ": elecUniv,
        "man_univ": manUniv,
        "terms_gpa": Map.from(termsGpa).map((k, v) => MapEntry(k, v)),
      };
}
