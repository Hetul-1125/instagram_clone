import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/post_card.dart';

class feedScreen extends StatefulWidget {
  const feedScreen({Key? key}) : super(key: key);

  @override
  State<feedScreen> createState() => _feedScreenState();
}

class _feedScreenState extends State<feedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          title: Image.asset(
            'assets/instagram.jpeg',
            height: 32,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.messenger_outline),
            ),
          ]),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('posts').orderBy('datepublised',descending: true).snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting)
              {
                return Center(child: const CircularProgressIndicator());
              }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) => postCard(snap: snapshot.data!.docs[index].data(),));
          }),
    );
  }
}
