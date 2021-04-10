import '../localization/shareprefence.dart';
import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ExpansionTile(
              title: Text(
                getTranslated(
                  context,
                  'question_1',
                ),
              ),
              children: [Text(getTranslated(context, 'answer_1'))],
            ),
            ExpansionTile(
              title: Text(
                getTranslated(
                  context,
                  'question_2',
                ),
              ),
              children: [Text(getTranslated(context, 'answer_2'))],
            ),
            ExpansionTile(
              title: Text(
                getTranslated(
                  context,
                  'question_3',
                ),
              ),
              children: [Text(getTranslated(context, 'answer_3'))],
            ),
            ExpansionTile(
              title: Text(
                getTranslated(
                  context,
                  'question_4',
                ),
              ),
              children: [Text(getTranslated(context, 'answer_4'))],
            ),
            ExpansionTile(
              title: Text(
                getTranslated(
                  context,
                  'question_5',
                ),
              ),
              children: [Text(getTranslated(context, 'answer_5'))],
            ),
            ExpansionTile(
              title: Text(
                getTranslated(
                  context,
                  'question_6',
                ),
              ),
              children: [Text(getTranslated(context, 'answer_6'))],
            ),
            ExpansionTile(
              title: Text(
                getTranslated(
                  context,
                  'question_7',
                ),
              ),
              children: [Text(getTranslated(context, 'answer_7'))],
            ),
            ExpansionTile(
              title: Text(
                getTranslated(
                  context,
                  'question_8',
                ),
              ),
              children: [Text(getTranslated(context, 'answer_8'))],
            ),
          ],
        ),
      ),
    );
  }
}
