import 'package:http/http.dart';

import 'http_client.dart';

class HttpImplementation implements HttpClient {
  final Client client;

  HttpImplementation(this.client);
  @override
  Future<HttpResponse> get(String url) async {
    final response = await client.get(Uri.parse(url));
    print(response.statusCode);
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> post(String url, Map<String, dynamic> body) async {
    final response = await client.post(Uri.parse(url), body: body);
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }
}
