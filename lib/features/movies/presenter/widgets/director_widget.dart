import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loopi_challenge/core/enums/job_enum.dart';
import 'package:loopi_challenge/features/movies/data/datasources/endpoints/tmdb_endpoints.dart';
import 'package:loopi_challenge/features/movies/domain/entities/people_entity.dart';

class DirectorWidget extends StatefulWidget {
  final List<PeopleEntity> movieCast;
  const DirectorWidget({Key? key, required this.movieCast}) : super(key: key);

  @override
  _DirectorWidgetState createState() => _DirectorWidgetState();
}

class _DirectorWidgetState extends State<DirectorWidget> {
  List<PeopleEntity> getDirectorList() {
    List<PeopleEntity> directorList =
        widget.movieCast.where((e) => e.job == JobList.director).toList();
    return directorList;
  }

  @override
  Widget build(BuildContext context) {
    List<PeopleEntity> directorList = getDirectorList();

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: directorList.length,
        itemBuilder: (BuildContext context, int index) {
          print("url: " + directorList[index].profilePath);

          var actorPicture = directorList[index].profilePath == ''
              ? 'https://appvital.com/images/profile/file-uploader-api-profile-avatar-2.jpg'
              : TheMovieDBEndpoint.movieMediaBaseUrl185Quality() +
                  directorList[index].profilePath;

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
                      directorList[index].name,
                      style: Theme.of(context).textTheme.button,
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    directorList[index].job == JobList.actor
                        ? directorList[index].gender == 1
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
