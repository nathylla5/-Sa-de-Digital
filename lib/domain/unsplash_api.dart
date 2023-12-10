import 'dart:convert';
import 'package:http/http.dart' as http;

class UnsplashApi {
  final String apiKey = '27Iic8DirGKVxhF5MxROPLy5-1wCqbtJbaAyucpKIHI';

  Future<String> buscarFoto(String topico) async {
    final String baseUrl = 'https://api.unsplash.com/photos/random';
    final String queryParameters = 'query=$topico';

    final String url = '$baseUrl?$queryParameters&client_id=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final String imageUrl = data['urls']['regular'];
        return imageUrl;
      } else {
        throw Exception('Erro ao buscar foto do Unsplash');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }
}