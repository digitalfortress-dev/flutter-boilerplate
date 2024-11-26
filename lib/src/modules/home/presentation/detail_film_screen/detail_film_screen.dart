import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/modules/home/domain/entities/film_entity.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: const Alignment(-1, 6),
              children: [
                Stack(
                  alignment: const Alignment(0, 0),
                  children: [
                    Image.network(
                      widget.filmData.youtubeId != null
                          ? 'https://img.youtube.com/vi/${widget.filmData.youtubeId}/mqdefault.jpg'
                          : widget.filmData.imageUrl,
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      fit: BoxFit.fill,
                    ),
                    Icon(
                      Icons.play_circle_outline,
                      size: MediaQuery.of(context).size.width / 4,
                      color: Colors.white.withOpacity(0.4),
                    ),
                  ],
                ),
                Image.network(
                  widget.filmData.imageUrl,
                  width: MediaQuery.of(context).size.width / 3,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width / 3 + 5, 5, 5, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.filmData.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '- Other Name: ',
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              '${widget.filmData.titleEnglish}\n(${widget.filmData.titleJapanese})',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '- Producers: ${widget.filmData.producers.map((e) => e.name).join(',')}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    '- Licensors: ${widget.filmData.licensors.map((e) => e.name).join(',')}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    '- Background: ${widget.filmData.background}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    '- Description: ${widget.filmData.synopsis}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
