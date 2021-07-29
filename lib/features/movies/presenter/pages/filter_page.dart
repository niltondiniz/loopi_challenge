import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:loopi_challenge/core/usecase/usecase.dart';
import 'package:loopi_challenge/features/movies/domain/entities/genre_entity.dart';
import 'package:loopi_challenge/features/movies/presenter/controllers/filter_controller.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/on_error_widget.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/vertical_space_widget.dart';
import 'package:loopi_challenge/features/movies/presenter/widgets/white_title_widget.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends ModularState<FilterPage, FilterController> {
  @override
  void initState() {
    controller.getGenres(NoParams());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder(
      store: store,
      onLoading: (context) => Center(
        child: CircularProgressIndicator(),
      ),
      onError: (context, error) => Center(
        child: OnErrorWidget(),
      ),
      onState: (context, List<GenreEntity> listGenre) => Scaffold(
        appBar: AppBar(
          title: Text("Genres Filter"),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WhiteTitleWidget(text: "Speed Filter"),
                    VerticalSpaceWidget(height: 16),
                    Container(
                      padding: EdgeInsets.only(top: 8),
                      height: 50,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: listGenre.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 16,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return TextButton(
                              onPressed: () {
                                Navigator.pop(context, [listGenre[index].id]);
                              },
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Theme.of(context).accentColor),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Theme.of(context).accentColor),
                                  ),
                                ),
                              ),
                              child: Center(
                                  child: Text(
                                listGenre[index].name,
                                style: Theme.of(context).textTheme.button,
                              )),
                            );
                          }),
                    ),
                    VerticalSpaceWidget(height: 32),
                    WhiteTitleWidget(text: "Genres Selector"),
                    VerticalSpaceWidget(height: 16),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: listGenre.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 7,
                  ),
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    if (controller.checkedGenres.length <= index) {
                      controller.checkedGenres.add(false);
                    }
                    return Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: controller.checkedGenres[index],
                            onChanged: (newValue) {
                              setState(() {
                                setState(() {
                                  controller.checkedGenres[index] = newValue!;
                                });
                              });
                            },
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                controller.checkedGenres[index] =
                                    !controller.checkedGenres[index];
                              });
                            },
                            child: Text(listGenre[index].name,
                                style: Theme.of(context).textTheme.button,
                                textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40),
                    primary: Theme.of(context).accentColor),
                onPressed: () {
                  Navigator.pop<List<int>>(
                      context, controller.selectedGenres(listGenre));
                },
                child: Text(
                  'Go!',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
