import 'dart:convert';

import 'package:http/http.dart' as http;

class Post {
  final int userId;
  final int id;
  final String title;

  Post({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

Future<Post> fetchPost() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/12'));

  if (response.statusCode == 200) {
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}
