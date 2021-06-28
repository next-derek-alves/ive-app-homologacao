import 'package:equatable/equatable.dart';

abstract class ILoginResponse extends Equatable {
  final String? token;
  final String? type;
  final int? expires;

  ILoginResponse(this.token, this.type, this.expires);

  Map<String, dynamic> toMap();

  @override
  List<Object?> get props => [token, type, expires];
}
