import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/src/core/utils/app_size.dart';
import 'package:flutter_boilerplate/src/core/utils/extensions/build_context.dart';
import 'package:flutter_boilerplate/src/modules/app/routes.dart';
import 'package:flutter_boilerplate/src/modules/home/domain/entities/film_entity.dart';
import 'package:flutter_boilerplate/src/modules/home/presentation/bloc/film_bloc/film_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    reloadData();
    AppSize.config(context);
    super.didChangeDependencies();
  }

  Future<void> reloadData() async {
    context.read<FilmBloc>().add(FetchFilmsEvent());
    await Future.delayed(const Duration(seconds: 2));
  }

  void openDetailPage(FilmEntity data) {
    AppNavigator.push(Routes.secondScreen, data);
  }

  Widget filmCard(FilmEntity data) {
    return InkWell(
      onTap: () => openDetailPage(data),
      child: Row(
        children: [
          Image.network(
            width: AppSize.width / 4,
            data.image,
            fit: BoxFit.fill,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.title),
                  Text("${data.originalTitleRomanised} (${data.originalTitle})")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                context.res().appName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Expanded(
                  child: BlocConsumer<FilmBloc, FilmState>(
                      builder: (ctx, state) {
                        if (state.status == FilmStateStatus.loadSuccess) {
                          return RefreshIndicator(
                            onRefresh: reloadData,
                            child: ListView.separated(
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    filmCard(state.films[index]),
                                separatorBuilder: (context, index) =>
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      child: Divider(height: 1),
                                    ),
                                itemCount: state.films.length),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      listener: (ctx, state) {})),
            ],
          ),
        ),
      ),
    );
  }
}
