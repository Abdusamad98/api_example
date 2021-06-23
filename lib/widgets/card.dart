import 'package:api_example/constants/constants.dart';
import 'package:api_example/models/my_result.dart';
import 'package:api_example/pages/web_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final Result result;

  NewsCard({required this.result});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: Color(0xffE1E1E1)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                  'assets/icons/news.jpg',
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'News Name: ',
                    style: commonStyle,
                  ),
                  Text(
                    result.sectionName,
                    style: textStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title: ',
                    style: commonStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Expanded(
                    child: Text(
                      result.webTitle,
                      maxLines: 5,
                      style: textStyle,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Pillar Name: ',
                        style: commonStyle,
                      ),
                      Text(
                        result.pillarName,
                        style: textStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Is Hosted: ',
                        style: commonStyle,
                      ),
                      Text(
                        result.isHosted ? 'Yes' : 'No',
                        style: textStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyWebPage(
                          url: result.webUrl,
                        )));
              },
              child: Container(
                margin: EdgeInsets.only(top: 16.0),
                width: double.infinity,
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Color(0xff0de723),
                  borderRadius: BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                ),
                child: Text(
                  'Go To Website',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
