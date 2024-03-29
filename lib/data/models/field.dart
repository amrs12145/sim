class Field {
  String? id;
  String name;
  String description;
  String? img;
  int coursesRelatedCount;
  num? progress;

  Field({
    required this.id,
    required this.name,
    required this.description,
    required this.img,
    required this.coursesRelatedCount,
    required this.progress,
  });

  static List<Field> fromJsonList(List list) =>
      list.map((e) => Field.fromJson(e)).toList();

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      img: json['img'],
      coursesRelatedCount:
          json['courses_related_count'] ?? json['courses_count'],
      progress: json['progress'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'img': img,
        'courses_related_count': coursesRelatedCount,
        'progress': progress,
      };
}
