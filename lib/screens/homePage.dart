import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/festivalPost_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Post List'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade900,
      ),
      body: Scrollbar(
        radius: const Radius.circular(10),
        thickness: 5,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(right: 15,left: 15,top: 15,bottom: 25),
          itemCount: allPost.length,
           separatorBuilder: (context,i){
            return const SizedBox(height: 20);
           },
          itemBuilder: (context,i){
            return post(festivalPost: allPost[i]);
          },
        ),
      ),
    );
  }

  Widget post({
    required List festivalPost,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${festivalPost[0].festivalName}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple.shade900,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed('allPost', arguments: festivalPost);
              },
              child: Text(
                'See more',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey.shade500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 160,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: festivalPost.length,
            separatorBuilder: (context, i) {
              return const SizedBox(width: 20);
            },
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('postEdit', arguments: festivalPost[i]);
                },
                child: Container(
                  width: 170,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        '${festivalPost[i].image}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
