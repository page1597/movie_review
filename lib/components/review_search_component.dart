import 'package:flutter/material.dart';
import 'package:movie_review/model/movie.dart';

class reviewSearchComponent extends StatelessWidget {
  const reviewSearchComponent({Key? key, required this.movie, required this.me})
      : super(key: key);

// 리뷰 검색 컴포넌트
  final List<Movie> movie;
  final bool me;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        width: width * 0.9,
        height: 50,
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              'assets/ddabong.jpeg',
              width: 40,
              height: 48,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '영화 제목: ${movie[0].title}',
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    '${movie[0].review}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12, height: 1),
                  ),
                  // Text(
                  //   '감독: ${movie[0]['director'].toString()}',
                  //   style: const TextStyle(fontSize: 12),
                  // )
                ],
              ),
            ),
          ],
        ));
  }
}
