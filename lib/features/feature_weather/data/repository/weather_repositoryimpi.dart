import 'package:dio/dio.dart';
import '../data_source/remote/api_provider.dart';
import '../models/current_city_model.dart';
import '../../domain/entities/current_city_entity.dart';
import '../../../../core/resources/datastate.dart';
import '../../domain/repository/wather_repository.dart';

class WeatherRepositoryImpi extends WeatherRepository {
  ApiProvider apiProvider;
  WeatherRepositoryImpi(this.apiProvider);
  @override
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(
      String cityName) async {
    try {
      Response response = await apiProvider.callCurrentWather(cityName);

      if (response.statusCode == 200) {
        CurrentCityEntity currentCityEntity =
            CurrentCityModel.fromJson(response.data);
        return DataSuccess(currentCityEntity);
      } else {
        return const DataFailed("Something went wrong try again...");
      }
    } catch (e) {
      return const DataFailed(":plse checj your connection...");
    }
  }
}
