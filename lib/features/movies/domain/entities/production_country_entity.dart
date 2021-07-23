import 'package:equatable/equatable.dart';

class ProductionCountryEntity extends Equatable {
  final String acronym;
  final String name;

  ProductionCountryEntity({
    required this.acronym,
    required this.name,
  });

  @override
  List<Object?> get props => [
        acronym,
        name,
      ];
}
