import 'package:assignment/infrastructure/Model/modelData.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiService {
  static var uri = "https://randomuser.me/api/?results=10";
}

class DataFromApi {
  Future<List<ModelData>> getdatafromapi() async {
    try {
      final Response response = await Dio().get(ApiService.uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = (response.data["results"] as List)
            .map((e) => ModelData.fromJson(e))
            .toList();

        print(data);
        return data;
      }
      throw Exception("servererror");
    } catch (e) {
      throw Exception("client error");
    }
  }
}

final DataFromApiprovider = Provider<DataFromApi>((ref) => DataFromApi());
