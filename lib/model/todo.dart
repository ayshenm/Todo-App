class Todo {
  Todo(
      {required this.id,
      required this.todo,
      required this.complated,
      required this.userId});

  int? id;
  String? todo;
  bool? complated;
  int? userId;

  //from json

  Todo.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    todo = json["todo"];
    complated = json["complated"];
    userId = json["userId"];
  }

  //to json

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['todo'] = todo;
    data['complated'] = complated;
    data['userId'] = userId;

    return data;
  }
}
