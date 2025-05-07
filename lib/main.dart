import 'package:flutter/material.dart';
import 'package:todolist/storage.dart';
import 'package:todolist/app_theme.dart';
import 'package:todolist/search_bar.dart';

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
      theme: AppTheme.lightTheme.copyWith(
        textTheme: AppTheme.lightTheme.textTheme.apply(
          fontFamily: 'CascadiaMono', // Menambahkan font ke textTheme
        ),
      ),
      darkTheme: AppTheme.darkTheme.copyWith(
        textTheme: AppTheme.darkTheme.textTheme.apply(fontFamily: 'RobotoSlab'),
      ),
      themeMode: ThemeMode.system, //otomatis mengikuti sistem
      home: const TodoHomePage(),
    );
  }
}

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});
  @override
  TodoHomePageState createState() => TodoHomePageState();
}

class TodoHomePageState extends State<TodoHomePage> {
  final List<Map<String, dynamic>> _todos = []; //Daftar Tugas
  final TextEditingController _controller =
      TextEditingController(); //input teks
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    TodoStorage.loadTodos().then((loadedTodos) {
      setState(() {
        _todos.addAll(loadedTodos);
      });
    });
  }

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
  Widget build(BuildContext context) {
    final filteredTodos =
        _todos.where((todo) {
          return todo['title'].toString().toLowerCase().contains(
            _searchText.toLowerCase(),
          );
        }).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Daftar Tugas',
          style: TextStyle(
            fontWeight: FontWeight.bold, //biar tulisannya tebal
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchBarWidget(
              controller: _searchController,
              onChanged: (text) {
                setState(() {
                  _searchText = text;
                });
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'tambahkan tugas',
                      border: OutlineInputBorder(),
                    ),
                    //langsung enter aja...
                    onSubmitted: (value) {
                      if (value.trim().isNotEmpty) {
                        _addTodo();
                      }
                    }, // bisa menekan Enter untuk menambahkan tugas
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addTodo,
                  child: const Text(
                    'Tambah',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredTodos.length,
                itemBuilder: (context, index) {
                  final todo =
                      filteredTodos[index]; //ambil data dari hasil filter
                  final originalIndex = _todos.indexOf(todo);

                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                        value: todo['isDone'],
                        onChanged: (_) => _toggleDone(originalIndex),
                      ),
                      title: Text(
                        todo['title'],
                        style: TextStyle(
                          decoration:
                              todo['isDone']
                                  ? TextDecoration.lineThrough
                                  : null,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _removeTodo(originalIndex),
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
