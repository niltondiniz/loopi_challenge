import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loopi_challenge/core/enums/job_enum.dart';
import 'package:loopi_challenge/features/movies/data/datasources/endpoints/tmdb_endpoints.dart';
import 'package:loopi_challenge/features/movies/domain/entities/people_entity.dart';

class CastWidget extends StatefulWidget {
  final List<PeopleEntity> movieCast;
  const CastWidget({Key? key, required this.movieCast}) : super(key: key);

  @override
  _CastWidgetState createState() => _CastWidgetState();
}

class _CastWidgetState extends State<CastWidget> {
  List<PeopleEntity> getCast() {
    List<PeopleEntity> cast =
        widget.movieCast.where((e) => e.job == JobList.actor).toList();
    return cast;
  }

  @override
  Widget build(BuildContext context) {
    var cast = getCast();

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cast.length,
        itemBuilder: (BuildContext context, int index) {
          print("url: " + cast[index].profilePath);

          var actorPicture = cast[index].profilePath == ''
              ? 'https://appvital.com/images/profile/file-uploader-api-profile-avatar-2.jpg'
              : TheMovieDBEndpoint.movieMediaBaseUrl185Quality() +
                  cast[index].profilePath;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(actorPicture),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 100,
                  child: Center(
                    child: Text(
                      cast[index].name,
                      style: Theme.of(context).textTheme.button,
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    cast[index].job == JobList.actor
                        ? cast[index].gender == 1
                            ? "Atriz"
                            : "Ator"
                        : "Diretor",
                    style: Theme.of(context).textTheme.bodyText1,
                    overflow: TextOverflow.fade,
                  ),
                )
              ],
            ),
          );
        });
  }
}
