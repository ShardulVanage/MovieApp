
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/pages/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightGreen,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovie = [];
  List topRatedMovie = [];
  List tv = [];
  final String apiKey = 'c133949f063a1d4a7446db7a8745a116';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMTMzOTQ5ZjA2M2ExZDRhNzQ0NmRiN2E4NzQ1YTExNiIsInN1YiI6IjYwZmJjMGNlOTlkNWMzMDA1ZmVmYzg2OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lT_deHKYtuaufd84Vsg-lmNyTkkISpRChInxvdYK2dE';

  loadmovies() async {
    TMDB tmdbwithcustomlogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map trendingResult = await tmdbwithcustomlogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbwithcustomlogs.v3.movies.getTopRated();
    Map tvResult = await tmdbwithcustomlogs.v3.tv.getPouplar();

    setState(() {
      trendingMovie = trendingResult['results'];
      topRatedMovie = topRatedResult['results'];
      tv = tvResult['results'];
    });
    print(trendingMovie);
  }

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: MoreGradientColors.instagram,
          )),
        ),
        title: Center(
          child: Text(
            "Movie-App",
            style:
                GoogleFonts.bilboSwashCaps(fontSize: 55, color: Colors.white ,fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView(
        children: [
          TrendingMovie(
            Trending: trendingMovie,
          )
        ],
      ),
    );
  }
}


//  "flutter run --no-sound-null-safety" if you get null-safety error run this command in terminal 