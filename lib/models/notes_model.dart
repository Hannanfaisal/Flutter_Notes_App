class NotesModel {
  int? id;
  final String? title;
  final int? age;
  final String? desription;
  final String? email;

  NotesModel(
      {this.id,
      required this.title,
      required this.age,
      required this.desription,
      required this.email});

  NotesModel.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        title = res['title'],
        age = res['age'],
        desription = res['description'],
        email = res['email'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'age': age,
      'description': desription,
      'email': email
    };
  }
}
