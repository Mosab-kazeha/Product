import 'package:dio/dio.dart';

Dio dio = Dio();

getData() async {
  Response response = await dio.get('https://dummyjson.com/products');
  print(response.data['products']);
  return response.data['products'];
}
