import 'package:flutter/material.dart';
import 'package:flutter_dictionary_application/model/words.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  Words word;
  DetailPage({required this.word, Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detay'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.word.english,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.pink,
              ),
            ),
            Text(
              widget.word.turkish,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
