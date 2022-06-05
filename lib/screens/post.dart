import 'package:flutter/material.dart';
import 'package:stickereditor/stickereditor.dart';

import '../models/festivalPost_models.dart';

class PostEdit extends StatefulWidget {
  const PostEdit({Key? key}) : super(key: key);

  @override
  _PostEditState createState() => _PostEditState();
}

class _PostEditState extends State<PostEdit> {


  @override
  Widget build(BuildContext context) {

    dynamic args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Edit Post'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.deepPurple.shade900,
      ),
      body: StickerEditingView(
        isnetwork: false,
        height: 300,
        width: 300,
        imgUrl: args.image,
        fonts: myFonts,
        palletColor: myColors,
        assetList: myAssets,
      ),
    );
  }
}
