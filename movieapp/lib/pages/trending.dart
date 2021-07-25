import 'package:flutter/material.dart';
import 'package:movieapp/utils/Text.dart';

class TrendingMovie extends StatelessWidget {
  final List Trending;
  const TrendingMovie({Key? key, required this.Trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Modify_Text(
            text: "Trending Movie",
            color: Colors.white,
            size: 25,
          ),
          Container(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Trending.length,
              itemBuilder: (context, index) {
                return Container(
                width: 140,
                child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500' +
                                Trending[index]['poster_path']),
                      ),
                    ),
                    height: 200,
                  ),
                  Container(
                    child: Text(Trending[index]['title']),
                  )
                ],
                ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
