import 'package:flutter/material.dart';
import 'package:flutter_dictionary_application/model/words.dart';
import 'package:flutter_dictionary_application/views/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool search = false;
  String searchWord = "";

  Future<List<Words>> showAllWords() async {
    List<Words> wordsList = [];

    var w1 = Words(1, "Dog", "Kopek");
    var w2 = Words(2, "Fish", "Balik");
    var w3 = Words(3, "Table", "Masa");

    wordsList.add(w1);
    wordsList.add(w2);
    wordsList.add(w3);
    return wordsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: search
            ? TextField(
                decoration: const InputDecoration(
                  hintText: "Arama icin Yaziniz",
                  icon: Icon(Icons.edit),
                ),
                onChanged: (searchResult) {
                  print("arama sonucu: $searchResult");
                  setState(() {
                    searchResult = searchWord;
                  });
                },
              )
            : const Text('AnaSayfa'),
        backgroundColor: Colors.cyan.shade300,
        actions: [
          search
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      search = false;
                    });
                  },
                  icon: const Icon(Icons.search_off))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      search = true;
                    });
                  },
                  icon: const Icon(Icons.search)),
        ],
      ),
      body: FutureBuilder<List<Words>>(
        future: showAllWords(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Words> wordsList = snapshot.data;
            return ListView.builder(
              itemCount: wordsList.length,
              itemBuilder: (BuildContext context, int index) {
                var word = wordsList[index];
                return Card(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  elevation: 5,
                  color: index % 2 == 0 ? Colors.cyan : Colors.green.shade400,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.cyan.shade200,
                      child: Text(word.wordId.toString()),
                    ),
                    title: Center(child: Text(word.english)),
                    subtitle: Center(child: Text(word.turkish)),
                    trailing: const Icon(Icons.arrow_forward),
                    contentPadding: const EdgeInsets.all(10),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(word: word),
                          ));
                    },
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
