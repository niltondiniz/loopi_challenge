import 'package:flutter/material.dart';
import 'package:loopi_challenge/features/movies/domain/entities/movie_entity.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/detail_action_widget.dart';

import 'detail_info_widget.dart';

class DetailInfoRowWidget extends StatelessWidget {
  final MovieEntity movie;
  const DetailInfoRowWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DetailInfoWidget(
          value: movie.releaseDate!,
          label: "Lançamento",
        ),
        DetailActionWidget(
          text: movie.runtime.toString() + "Min",
          icon: Icons.timer,
          action: () {},
        ),
        DetailInfoWidget(
          value: "\$" + (movie.budget! / 1000000).round().toString() + "M",
          label: "Orçamento",
        ),
        DetailInfoWidget(
          value: "\$" + (movie.revenue! / 1000000).round().toString() + "M",
          label: "Bilheteria",
        ),
      ],
    );
  }
}
