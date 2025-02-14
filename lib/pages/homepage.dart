import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/news_cubit.dart';
import '../bloc/news_state.dart';
import '../generic_widgets/bottom_icon.dart';
import '../generic_widgets/generic_back_button.dart';
import 'get_all_news_page.dart';

class Homepage extends StatelessWidget {
  final int index;

  Homepage({required this.index});

  Future<void> _initialNews(BuildContext context) async {
    await context.read<NewsCubit>().getNewsData(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 67,
        leading: GenericBackButton(
          onPressFunction: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => GetAllNewsPage(),
              ),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Row(
              children: [
                Icon(Icons.ios_share),
                SizedBox(
                  width: 25,
                ),
                Icon(Icons.bookmark),
              ],
            ),
          )
        ],
      ),
      body: FutureBuilder<void>(
        future: _initialNews(context),
        builder: (context, _) {
          return BlocBuilder<NewsCubit, NewsState>(
            builder: (BuildContext context, NewsState state) {
              if (state is IntialNewsState) {
                context.read<NewsCubit>().getNewsData(index);
              }
              if (state is NewsLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is NewsSuccessState) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('  ${state.newsModel.sourceName}'),
                                Text(' • '),
                                Text(state.newsModel.date),
                                Text(' • '),
                                Flexible(
                                  child: Text(
                                    '${state.newsModel.author} ',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              state.newsModel.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                image: NetworkImage(state.newsModel.imageUrl),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              state.newsModel.description,
                              style: TextStyle(fontSize: 19),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          height: 50,
                          width: 230,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BottomIcon(
                                color: Colors.grey.shade100,
                                icon: Icon(Icons.favorite_border),
                              ),
                              Text(
                                '6.7k',
                                style: TextStyle(fontSize: 20),
                              ),
                              BottomIcon(
                                color: Colors.grey.shade100,
                                icon: Icon(Icons.comment),
                              ),
                              Text(
                                '12k',
                                style: TextStyle(fontSize: 20),
                              ),
                              BottomIcon(
                                color: Colors.blueAccent,
                                icon: Icon(Icons.headset_outlined),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else if (state is NewsErrorState) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      'Error: ${state.errorMsg}',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                );
              }
              return Container();
            },
          );
        },
      ),
    );
  }
}
