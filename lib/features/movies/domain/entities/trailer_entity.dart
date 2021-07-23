import 'package:equatable/equatable.dart';

class TrailerEntity extends Equatable {
  final String key;
  final String site;
  final String name;

  TrailerEntity({
    required this.key,
    required this.site,
    required this.name,
  });

  @override
  List<Object?> get props => [
        key,
        site,
        name,
      ];
}
