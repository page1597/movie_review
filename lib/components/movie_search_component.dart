import 'package:flutter/material.dart';
import 'package:movie_review/model/movie.dart';

class movieSearchComponent extends StatelessWidget {
  const movieSearchComponent({Key? key, required this.movie}) : super(key: key);

// 리뷰 검색 컴포넌트
  final List<Movie> movie;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.9,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assets/ddabong.jpeg',
            width: 40,
            height: 48,
            fit: BoxFit.fill,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '영화 제목: ${movie[0].title}',
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  '감독: ${movie[0].director}',
                  style: const TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
