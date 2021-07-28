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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.movieCast.length,
        itemBuilder: (BuildContext context, int index) {
          print("url: " + widget.movieCast[index].profilePath);

          var actorPicture = widget.movieCast[index].profilePath == ''
              ? 'https://appvital.com/images/profile/file-uploader-api-profile-avatar-2.jpg'
              : TheMovieDBEndpoint.movieMediaBaseUrl185Quality() +
                  widget.movieCast[index].profilePath;

          return Padding(
            padding: const EdgeInsets.only(right: 32),
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
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
                      widget.movieCast[index].name,
                      style: Theme.of(context).textTheme.headline3,
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    widget.movieCast[index].job == JobList.actor
                        ? widget.movieCast[index].gender == 1
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
