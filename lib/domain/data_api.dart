import 'dart:convert';
import 'package:http/http.dart' as http;

class DataApi {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<Map<String, dynamic>> fetchFakeUserData(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$userId'));

    if (response.statusCode == 200) {
      Map<String, dynamic> userData = json.decode(response.body);

      Map<String, dynamic> selectedFields = {
        'id': userData['id'].toString(),
        'name': userData['name'],
        'username': userData['username'],
        'birthDate': "01/01/2000",
        'password': "0000000",
        'urlImage': "",
        'email': userData['email'],
        'diseases': "",
        'phone': userData['phone']
      };

      return selectedFields;
    } else {
      throw Exception('Falha ao carregar dados do usuário da API');
    }
  }
}
