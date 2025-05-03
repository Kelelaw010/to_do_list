import 'package:flutter/material.dart';
import 'package:todolist/storage.dart';
import 'package:todolist/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const TodoHomePage(),
    );
  }
}

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});
  @override
  _TodoHomePageState createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  final List<Map<String, dynamic>> _todos = []; //Daftar Tugas
  final TextEditingController _controller =
      TextEditingController(); //input teks

  void _addTodo() {
    final text = _controller.text;
    if (text.isNotEmpty) {
      setState(() {
        _todos.add({'title': text, 'isDone': false});
        _controller.clear();
      });
      //pemanggilan save
      TodoStorage.saveTodos(_todos);
    }
  }

  void _removeTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
    TodoStorage.saveTodos(_todos);
  }

  void _toggleDone(int index) {
    setState(() {
      _todos[index]['isDone'] = !_todos[index]['isDone'];
    });
    TodoStorage.saveTodos(_todos);
  }

  @override
  void initState() {
    super.initState();
    TodoStorage.loadTodos().then((loadedTodos) {
      setState(() {
        _todos.addAll(loadedTodos);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Tugas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'tambahkan tugas',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addTodo,
                  child: const Text('Tambah'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                        value: _todos[index]['isDone'],
                        onChanged: (_) => _toggleDone(index),
                      ),
                      title: Text(
                        _todos[index]['title'],
                        style: TextStyle(
                          decoration:
                              _todos[index]['isDone']
                                  ? TextDecoration.lineThrough
                                  : null,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _removeTodo(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
