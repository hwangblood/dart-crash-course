import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

Future<void> main(List<String> args) async {
  // * JSON Downloading and Parsing with Isolates

  final cp = ReceivePort();
  Isolate.spawn(fetchJSON, cp.sendPort);

  final results = await cp
      .takeWhile((element) => element is Iterable<Todo>)
      .cast<Iterable<Todo>>()
      .take(1)
      .first;

  results.forEach(print);
}

Future<void> fetchJSON(SendPort sp) async {
  final client = HttpClient();
  final uri = Uri.parse('https://jsonplaceholder.typicode.com/todos');

  final todos = await client
      .getUrl(uri)
      .then((request) => request.close())
      .then((response) => response.transform(utf8.decoder).join())
      .then((value) => jsonDecode(value) as List)
      .then((data) => data.map((e) => Todo.fromMap(e)));

  print(todos);
  sp.send(todos);
}

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      completed: map['completed'] ?? false,
    );
  }

  @override
  String toString() {
    return 'Todo(userId: $userId, id: $id, title: $title, completed: $completed)';
  }
}
