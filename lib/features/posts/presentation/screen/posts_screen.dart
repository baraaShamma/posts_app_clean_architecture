import 'package:flutter/material.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() => AppBar(
    title: Text('Posts'),

  );

  Widget _buildBody() {
    return Padding(
        padding: const EdgeInsets.all(10),
        child:Center(
          child: Text("posts"),
        )
    );
  }

}
