import 'package:flutter/material.dart';
import 'package:flutter_sqflite_app/db_handler.dart';
import 'package:flutter_sqflite_app/models/notes_model.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  DbHandler? dbHandler;
  late Future<List<NotesModel>> notesList;

  @override
  void initState() {
    super.initState();
    dbHandler = DbHandler();
    loadData();
  }

  loadData() async {
    notesList = dbHandler!.getNotesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes SQLITE'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: notesList,
                builder: (context, AsyncSnapshot<List<NotesModel>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            direction: DismissDirection.endToStart,
                            background: Container(
                                color: Colors.blue, child: Icon(Icons.delete)),
                            onDismissed: (direction) {
                              setState(() {
                                dbHandler!.delete(snapshot.data![index].id!);
                                notesList = dbHandler!.getNotesList();
                                snapshot.data!.remove(snapshot.data![index]);
                              });
                            },
                            key: ValueKey<int>(snapshot.data![index].id!),
                            child: Card(
                              child: ListTile(
                                title: Text(
                                    snapshot.data![index].title.toString()),
                                subtitle: Text(
                                    snapshot.data![index].email.toString()),
                              ),
                            ),
                          );
                        });
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dbHandler!
              .insert(NotesModel(
                  title: 'Second Note',
                  age: 21,
                  desription: 'This is my second Note',
                  email: 'ahannan@outlook.com'))
              .then((value) {
            print('Data Added');
            setState(() {
              notesList = dbHandler!.getNotesList();
            });
          }).onError((error, stackTrace) {
            print(error.toString());
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
