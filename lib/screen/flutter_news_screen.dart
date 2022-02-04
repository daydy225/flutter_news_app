import 'package:flutter/material.dart';
import 'package:flutternews/services/api_services.dart';

class FlutterNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(
            text: "Flutter",
            children: <TextSpan>[
              TextSpan(
                  text: "News".toUpperCase(),
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.blue[400])),
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueGrey[900],
      ),
      body: FutureBuilder(
        future: ApiServices().testApiConnect(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List articles = snapshot.data["articles"];

            return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                          child: Image.network(articles[index]["urlToImage"]),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            articles[index]["title"],
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.bottomLeft,
                          child: articles[index]["author"] == null
                              ? const Text(
                                  "unknown author name",
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                )
                              : Text(
                                  articles[index]["author"],
                                  style: const TextStyle(
                                      fontStyle: FontStyle.italic),
                                ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Source - " + articles[index]["source"]["name"],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
