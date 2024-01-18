import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class UserHelper {
  static Future<Map<String, dynamic>> ambilDetailPengguna(String token) async {
    final url = Uri.parse('http://10.0.2.2:8000/api/user');

    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        // Tangani respons error
        print('Gagal mengambil detail pengguna. Kode status: ${response.statusCode}');
        return {};
      }
    } catch (e) {
      // Tangani kesalahan jaringan atau lainnya
      print('Error mengambil detail pengguna: $e');
      return {};
    }
  }
}
