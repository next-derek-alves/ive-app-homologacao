import 'package:equatable/equatable.dart';

abstract class ICourseEntity extends Equatable {
  final int id;
  final String name;
  final dynamic price;
  final String description;
  final String slug;

  ICourseEntity(this.id, this.name, this.price, this.description, this.slug);

  @override
  List<Object?> get props => [id, name, price, description, slug];

  toMap() {}

  static fromMap(x) {}
}
