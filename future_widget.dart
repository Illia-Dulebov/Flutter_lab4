import 'package:flutter/material.dart';
import 'package:instagram_app/post_json.dart';

class FutureWidgetPost extends StatefulWidget {
  final int val;
  FutureWidgetPost(this.val);

  int get value => this.val;

  @override
  _FutureWidgetPostState createState() => _FutureWidgetPostState();
}

class _FutureWidgetPostState extends State<FutureWidgetPost> {
  late Future<Post> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar:
            AppBar(title: const Text('Fetch Data Example'), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, widget.value + 10);
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {},
          ),
        ]),
        body: Center(
          child: FutureBuilder<Post>(
            future: futurePost,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
