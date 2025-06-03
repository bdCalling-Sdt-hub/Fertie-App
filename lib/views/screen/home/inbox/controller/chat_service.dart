import 'dart:convert';

import 'package:fertie_application/data/api_constants.dart';
import 'package:http/http.dart' as http;

class ChatService {

  Stream<String> getChatResponses(String message, String conversationId) async* {
    final client = http.Client();

    try {
      final request = http.Request(
        'POST',
        Uri.parse(ApiConstants.longPollingWithHistory),
      );

      request.headers['Content-Type'] = 'application/json';
      request.headers['Authorization'] = 'Bearer ${ApiConstants.tempBToken}';

      request.body = jsonEncode({
        'message': message,
        'conversationId': conversationId,
      });

      final response = await client.send(request);
      if (response.statusCode == 200) {
        await for (var line in response.stream.transform(utf8.decoder).transform(LineSplitter())) {
          // line = line.trim();

          // Handle Server-Sent Events format
          if (line.startsWith('data: ')) {
            // Remove 'data: ' prefix
            final jsonString = line.substring(6);

            // if (jsonString.isNotEmpty) {
              try {
                final jsonChunk = jsonDecode(jsonString);

                // Check if chunk exists and extract it
                if (jsonChunk is Map<String, dynamic> && jsonChunk.containsKey('chunk')) {
                  yield jsonChunk['chunk'];
                }
              } catch (e) {
                print('Error parsing chunk: $e, line: $line');
                yield "Error: Failed to parse chunk";
              }
            // }
          }
        }
      } else {
        yield "Error: ${response.statusCode}";
      }
    } catch (e) {
      yield "Error: $e";
    } finally {
      client.close();
    }
  }

}