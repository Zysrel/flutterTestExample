import 'package:http/http.dart' as http;

class TaskRepository {
  final http.Client client;

  TaskRepository({required this.client});

  Future<Tasks> fetchTasks() async {
    final response = await client.get(
      Uri.parse("https://jsonplaceholder.typicode.com/todos"),
    );

    if (response.statusCode == 200) {
      return Tasks();
    } else {
      throw Exception('Failed to load tasks');
    }
  }
}

class Tasks {}
