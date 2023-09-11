import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<String> tasks = [];

  final TextEditingController _textEditingController = TextEditingController();
  void addtask() {
    setState(() {
      String newTask = _textEditingController.text;
      if (newTask.isNotEmpty) {
        tasks.add(newTask);
        _textEditingController.clear();
      }
    });
  }

  void deletetask(index) {
    setState(() {
      (tasks.removeAt(index));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 80, 0, 8),
                child: SizedBox(
                  width: 280,
                  child: TextField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                        labelText: "Write your Task",
                        border: OutlineInputBorder()),
                    onSubmitted: (value) {
                      addtask();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 80, 8, 8),
                child: SizedBox(
                  height: 60,
                  width: 70,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(51))),
                    onPressed: addtask,
                    child: const Icon(
                      Icons.add,
                      size: 26,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return TextField(
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: (tasks[index]).toString(),
                          suffixIcon: IconButton(
                              onPressed: () {
                                deletetask(index);
                              },
                              icon: const Icon(Icons.delete))),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
