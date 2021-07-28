import 'package:loopi_challenge/features/movies/data/models/people_model.dart';

abstract class IPeopleDatasource {
  Future<List<PeopleModel>> getMoviesCastByMovieId(int id);
}
