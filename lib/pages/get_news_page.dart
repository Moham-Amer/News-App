import 'package:flutter/material.dart';
import 'package:news_app/generic_widgets/generic_button.dart';
import 'package:news_app/pages/get_all_news_page.dart';
import '../generic_widgets/generic_back_button.dart';

class GetNewsPage extends StatelessWidget {
  GetNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 67,
        leading: GenericBackButton(
          onPressFunction: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/onBoardingBackground.jpg'),
            fit: BoxFit.cover,
            opacity: 0.6,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GetAllNewsPage(),
                  ),
                );
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "Get All News",
                style: TextStyle(fontSize: 30),
              ),
            ),
            GenericButton(
              text: 'Show Latest News',
              index: 0,
            ),
            GenericButton(
              text: 'Show Next Latest News',
              index: 1,
            ),
          ],
        ),
      ),
    );
  }
}
