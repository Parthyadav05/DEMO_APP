import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'home_model.dart';
import 'local_db.dart';

Future<List<Model>> fetchEventsFromApi() async {
  String apiKey = dotenv.env['API_KEY']!;
  try {
    final response = await http.get(Uri.parse(apiKey));

    if (response.statusCode == 200) {
      List<Model> events = [];
      List<dynamic> jsonList = jsonDecode(response.body);

      jsonList.forEach((json) {
        Model event = Model.fromJson(json);
        events.add(event);
        DatabaseHelper.insertEvent(event);
      });

      return events;
    } else {
      throw Exception('Failed to load events');
    }
  } catch (e) {
    throw Exception('Failed to fetch events: $e');
  }
}
