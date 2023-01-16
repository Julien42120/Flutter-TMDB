import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_hello_cse/Models/moviesVM.dart';
import 'package:test_hello_cse/Models/movies_counter.dart';
import 'package:test_hello_cse/Views/favorite_movies.dart';
import 'package:test_hello_cse/Views/list_popular_movies.dart';

class BottomBarCustom extends StatefulWidget {
  @override
  State<BottomBarCustom> createState() => _BottomBarCustomState();
}

class _BottomBarCustomState extends State<BottomBarCustom> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {}

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BottomAppBar(
      child: Container(
        height: height * 0.07,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: FaIcon(FontAwesomeIcons.clapperboard,
                  color: Color.fromARGB(255, 0, 0, 0), size: 35),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MoviesPopularList()));
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavoriteMovies()));
                },
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: FaIcon(FontAwesomeIcons.solidHeart,
                            color: Color.fromARGB(255, 0, 0, 0), size: 35)),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Consumer<MoviesVM>(
                        builder: (context, value, child) => MovieCounter(
                          count: value.lst.length.toString(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
