import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/utils/app_size.dart';
import 'package:flutter_clean_architecture/src/modules/home/domain/entities/film_entity.dart';

class DetailFilmScreen extends StatefulWidget {
  final FilmEntity filmData;

  const DetailFilmScreen({super.key, required this.filmData});

  @override
  State<DetailFilmScreen> createState() => _DetailFilmScreenState();
}

class _DetailFilmScreenState extends State<DetailFilmScreen>
    with TickerProviderStateMixin {
  late AnimationController _rotateController;

  @override
  void initState() {
    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _rotateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Stack(
          alignment: const Alignment(-1, 12),
          children: [
            Stack(
              alignment: const Alignment(0, 0),
              children: [
                Image.network(
                  widget.filmData.movieBanner,
                  width: AppSize.width,
                ),
                Icon(
                  Icons.play_circle_outline,
                  size: AppSize.width / 4,
                  color: Colors.white.withOpacity(0.4),
                ),
              ],
            ),
            Image.network(
              widget.filmData.image,
              width: AppSize.width / 3,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(AppSize.width / 3 + 5, 5, 5, 5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.filmData.title,
                  style: Theme.of(context).textTheme.headline4,
                ),
                RichText(
                  text: TextSpan(
                    text: '- Other Name: ',
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            '${widget.filmData.originalTitleRomanised}\n(${widget.filmData.originalTitle})',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Text(
                  '- Time: ${widget.filmData.runningTime}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  '- Release date: ${widget.filmData.releaseDate}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  '- Director: ${widget.filmData.director}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  '- Producer: ${widget.filmData.producer}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  '- Description: ${widget.filmData.description}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
