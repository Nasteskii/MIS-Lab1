import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '206017'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _subjects = [];

  void _addSubject(String subject) {
    setState(() {
      _subjects.add(subject);
    });
  }

  void _deleteSubject(int index) {
    setState(() {
      _subjects.removeAt(index);
    });
  }

  void openAddSubjectDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String newSubject = "";
          return AlertDialog(
            backgroundColor: Colors.grey[200],
            title: const Text('Додади предмет'),
            content: TextField(
              cursorColor: Colors.black,
              onChanged: (value) {
                newSubject = value;
              },
            ),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    if (newSubject.isNotEmpty) {
                      _addSubject(newSubject);
                    }
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Додади',
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Откажи')),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 28),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Предмети:',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  _subjects.length.toString(),
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _subjects.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.greenAccent,
                    child: ListTile(
                      title: Text(
                        _subjects[index],
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _deleteSubject(index);
                        },
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: openAddSubjectDialog,
        tooltip: 'Додади предмет',
        child: const Icon(Icons.add),
      ),
    );
  }
}
