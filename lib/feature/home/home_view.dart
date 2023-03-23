import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_news_full_app/product/models/news.dart';
import 'package:firebase_news_full_app/product/utility/exception/custom_exception.dart';
import 'package:firebase_news_full_app/product/utility/firebase/firebase_collection.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Future<FirebaseApp> _initFirebaseSdk = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const _HomeListView(),
    );
  }
}

class _HomeListView extends StatelessWidget {
  const _HomeListView();

  @override
  Widget build(BuildContext context) {
    final news = FirebaseCollection.news.reference;
    final response = news.withConverter(
      fromFirestore: (snapshot, options) {
        return News().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        if (value != null) {
          throw FirebaseCustomException('$value not null!');
        } else {
          return value.toJson();
        }
      },
    ).get();
    return FutureBuilder(
      future: response,
      builder: (
        BuildContext context,
        AsyncSnapshot<QuerySnapshot<News?>> snapshot,
      ) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Placeholder();
          case ConnectionState.waiting:
          case ConnectionState.active:
            return const CircularProgressIndicator();
          case ConnectionState.done:
            if (snapshot.hasData) {
              final values = snapshot.data!.docs.map((e) => e.data()).toList();
              return ListView.builder(
                itemCount: values.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        Image.network(values[index]?.backgroundImage ?? ''),
                        Text(values[index]?.title ?? 'Başlik'),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Text('Veri Yok');
            }
        }
      },
    );
  }
}
