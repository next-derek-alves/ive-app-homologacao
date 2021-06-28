import 'package:ivedigital/features/home/domain/entities/course_entity.dart';

class CourseModel extends ICourseEntity {
  CourseModel(
    int id,
    String name,
    dynamic price,
    String description,
    String slug,
  ) : super(
          id,
          name,
          price,
          description,
          slug,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'slug': slug,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      map['id'],
      map['name'],
      map['price'],
      map['description'],
      map['slug'],
    );
  }
}
