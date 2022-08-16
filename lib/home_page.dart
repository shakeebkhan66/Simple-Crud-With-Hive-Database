import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Box<String> taskBox;

  final taskController = TextEditingController();
  final taskDateController = TextEditingController();

  @override
  void initState() {
    taskBox = Hive.box<String>('tasksbox');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: const Center(
          child: Text(
            "Crud Operations Hive DB",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ValueListenableBuilder(
                  valueListenable: taskBox.listenable(),
                  builder: (BuildContext context, Box<String> tasks, _) {
                    return ListView.separated(
                      itemCount: tasks.keys.length,
                      itemBuilder: (_, i) => const Divider(),
                      separatorBuilder: (ctx, i) {
                        final key = tasks.keys.toList()[i];
                        final value = tasks.get(key);
                        return ListTile(
                          title: Text(
                            key,
                            style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(value.toString()),
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 17,
          ),
          MaterialButton(
            color: Colors.green[200],
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return Dialog(
                      child: SizedBox(
                        height: 240,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 8.0),
                              child: TextFormField(
                                controller: taskController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.edit_note,
                                    color: Colors.green[200],
                                  ),
                                  hintText: "Enter your task",
                                  labelText: "Task Name",
                                  labelStyle: TextStyle(
                                      color: Colors.green[200],
                                      fontWeight: FontWeight.bold),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 8.0),
                              child: TextFormField(
                                controller: taskDateController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.date_range,
                                    color: Colors.green[200],
                                  ),
                                  hintText: "Enter Date",
                                  labelText: "Enter Today Date",
                                  labelStyle: TextStyle(
                                      color: Colors.green[200],
                                      fontWeight: FontWeight.bold),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MaterialButton(
                              onPressed: () {
                                final key = taskController.text.toString();
                                final value =
                                    taskDateController.text.toString();
                                taskBox.put(key, value);

                                taskController.clear();
                                taskDateController.clear();
                                Navigator.pop(context);
                              },
                              color: Colors.green[200],
                              child: const Text(
                                "Submit",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: const Text(
              "Add",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          MaterialButton(
            color: Colors.blue[200],
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return Dialog(
                      child: SizedBox(
                        height: 240,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 8.0),
                              child: TextFormField(
                                controller: taskController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.edit_note,
                                    color: Colors.blue[200],
                                  ),
                                  hintText: "Enter your task",
                                  labelText: "Task Name",
                                  labelStyle: TextStyle(
                                      color: Colors.blue[200],
                                      fontWeight: FontWeight.bold),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 8.0),
                              child: TextFormField(
                                controller: taskDateController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.date_range,
                                    color: Colors.blue[200],
                                  ),
                                  hintText: "Enter Date",
                                  labelText: "Enter Today Date",
                                  labelStyle: TextStyle(
                                      color: Colors.blue[200],
                                      fontWeight: FontWeight.bold),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MaterialButton(
                              onPressed: () {
                                final key = taskController.text.toString();
                                final value = taskDateController.text.toString();
                                taskBox.put(key, value);
                                taskController.clear();
                                Navigator.pop(context);
                              },
                              color: Colors.blue[200],
                              child: const Text(
                                "Submit",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: const Text(
              "Update",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          MaterialButton(
            color: Colors.red[200],
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return Dialog(
                      child: SizedBox(
                        height: 240,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 8.0),
                              child: TextFormField(
                                controller: taskController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.edit_note,
                                    color: Colors.red[200],
                                  ),
                                  hintText: "Enter task key",
                                  labelText: "Task Key",
                                  labelStyle: TextStyle(
                                      color: Colors.red[200],
                                      fontWeight: FontWeight.bold),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MaterialButton(
                              onPressed: () {
                                final key = taskController.text.toString();
                                taskBox.delete(key);

                                taskController.clear();
                                Navigator.pop(context);
                              },
                              color: Colors.red[200],
                              child: const Text(
                                "Submit",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: const Text(
              "Delete",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
