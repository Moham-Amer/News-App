import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outlined_text/outlined_text.dart';
import '../bloc/news_cubit.dart';
import '../bloc/news_state.dart';
import '../generic_widgets/generic_back_button.dart';
import 'homepage.dart';

class GetAllNewsPage extends StatelessWidget {
  GetAllNewsPage({super.key});

  Future<void> _initialAllNews(BuildContext context) async {
    await context.read<NewsCubit>().getAllNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 67,
        leading: GenericBackButton(
          onPressFunction: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: FutureBuilder<void>(
          future: _initialAllNews(context),
          builder: (context, snapshot) {
            return BlocBuilder<NewsCubit, NewsState>(
                builder: (BuildContext context, NewsState state) {
              if (state is IntialNewsState) {
                context.read<NewsCubit>().getAllNewsData();
              }
              if (state is NewsLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is AllNewsSuccessState) {
                return SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Breaking News",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 230,
                            child: ListView.separated(
                                itemCount: 10,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    width: 10,
                                  );
                                },
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Homepage(index: index),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 300,
                                      width: MediaQuery.of(context).size.width *
                                          0.92,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              state.newsModel[index].imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 20,
                                            left: 40,
                                            right: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Colors.white),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Text(
                                                      state.newsModel[index]
                                                          .author,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            bottom: -5,
                                            right: 10,
                                            left: 10,
                                            child: SizedBox(
                                              height: 105,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  OutlinedText(
                                                    text: Text(
                                                      state.newsModel[index]
                                                          .sourceName,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    strokes: [
                                                      OutlinedTextStroke(
                                                          color: Colors.black,
                                                          width: 2),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  SizedBox(
                                                    height: 60,
                                                    child: OutlinedText(
                                                      text: Text(
                                                        state.newsModel[index]
                                                            .title,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                      strokes: [
                                                        OutlinedTextStroke(
                                                            color: Colors.black,
                                                            width: 2)
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                "Recommended for You",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Homepage(index: index),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: SizedBox(
                                            height: 140,
                                            width: 140,
                                            child: Image(
                                              image: NetworkImage(state
                                                  .newsModel[index].imageUrl),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.50,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.newsModel[index].author,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              state.newsModel[index].title,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            maxLines: 4,overflow: TextOverflow.ellipsis,),
                                            Text(state.newsModel[index].date)
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            itemCount: 10,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 10,
                              );
                            },
                          )
                        ],
                      )),
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
            });
          }),
    );
  }
}
