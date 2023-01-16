import 'package:flutter/material.dart';
import 'package:test_hello_cse/Views/list_popular_movies.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.center,
          matchTextDirection: true,
          repeat: ImageRepeat.noRepeat,
          fit: BoxFit.cover,
          image: AssetImage('assets/images/background.webp'),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Center(
          child: Column(
        children: [
          Container(
            height: height * 0.20,
            margin: EdgeInsets.only(top: height * 0.2),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                alignment: Alignment.center,
                matchTextDirection: true,
                repeat: ImageRepeat.noRepeat,
                image: AssetImage('assets/images/tmdb.png'),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.2,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 38, 175, 199),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MoviesPopularList()));
                },
                child: Text(
                  'Visitez',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )),
          )
        ],
      )),
    );
  }
}
