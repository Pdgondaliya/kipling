import 'dart:convert';

// Client clientFromJson(String str) {
//   final jsonData = json.decode(str);
//   return Client.fromMap(jsonData);
// }

// String clientToJson(Client data) {
//   final dyn = data.toMap();
//   return json.encode(dyn);
// }

class Todo {
  int id;
  String jsonString;

  Todo({required this.id, required this.jsonString});

  Map<String, dynamic> toMap() {
    return {'id': id, 'jsonString': jsonString};
  }
}
