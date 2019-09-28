import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_to_object_example/lesson.dart';

Future<List<Course>> fetchPhotos(http.Client client) async {
  final response =
  await client.get('https://jsonplaceholder.typicode.com/photos');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Course> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Course>((json) => Course.fromJson(json)).toList();
}

/*
id": "",
  "title": "Literatura",
  "description": "Literatura é muito mais do que livros e história, é um encontro com a nossa cultura. Se você também já se perdeu no meio de todo aquele monte de autores, períodos e tipos de textos, este curso é para você. Cola aí e vem aprender Literatura de um jeito mais divertido com a gente!",
  "author": "Fabio Carradini",
  "author_info": "Fabio Carradini é um verdadeiro showman em pessoa quando o assunto é dar aula. Se tem alguém conhecido e amado entre os jovens, esse cara é o Prof. Fabio. Todos que já tiveram aula com ele jamais esquecem do seu nome e do seu poder de oratória. Sem contar as risadas que ele arranca da galera toda hora.",
  "year": 0,
  "lessons": [
 */

class Course {
  final int id;
  final String title;
  final String description;
  final String author;
  final String author_info;
  final List<Lesson> lessons;

  Course({this.id, this.title, this.description, this.author, this.author_info, this.lessons});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      author: json['author'] as String,
      author_info: json['author_info'] as String,
      lessons: json['lessons'] as List,
    );
  }
}

class CourseFromJsonPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Course>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Course> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].title);
      },
    );
  }
}