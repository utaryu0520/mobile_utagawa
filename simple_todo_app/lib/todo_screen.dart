import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController todoController = TextEditingController();
  String todoText = '';

  @override
  void initState() {
    super.initState();
    loadTodo();
  }

  Future<void> loadTodo() async {
  final prefs = await SharedPreferences.getInstance();
  setState(() {
    todoText = prefs.getString('todo') ?? '';
    todoController.text = todoText; // ← これを追加
  });
}


  Future<void> saveTodo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('todo', todoController.text);

    setState(() {
      todoText = todoController.text;
      todoController.clear();
    });
  }

  Future<void> clearTodo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('todo');

    setState(() {
      todoText = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ToDo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: todoController,
              decoration: const InputDecoration(
                labelText: 'やることを入力',
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: saveTodo,
              child: const Text('追加'),
            ),

            const SizedBox(height: 20),

            if (todoText.isNotEmpty)
              Card(
                child: ListTile(
                  title: Text(todoText),
                  trailing: IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: clearTodo,
                  ),
                ),
              )
            else
              const Text('ToDo はありません'),
          ],
        ),
      ),
    );
  }
}
