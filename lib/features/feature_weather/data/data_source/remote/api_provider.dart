import 'package:dio/dio.dart';

import '../../../../../core/utils/constans.dart';

class ApiProvider {
  final Dio _dio = Dio();
  var apiKey = Constans.apiKeys1;

  // current weather api call and Giving City name return weather

  Future<dynamic> callCurrentWather(cityName) async {
    var reponse = await _dio.get("${Constans.baseUrl}/data/2.5/weather",
        queryParameters: {'q': cityName, 'appid': apiKey, 'units': 'metric'});

    // print(reponse.data);
    return reponse;
  }
}

class Job {
  final String job;
  final String namejob;

  Job(this.job, this.namejob);

  Job.fromJson(Map<String, dynamic> json)
      : job = json['job'],
        namejob = json['namejob'];
}

class Api {}
