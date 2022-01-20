import '../models/covid_datacases.dart';

import '../../helpers/failure.dart';
import 'package:dio/dio.dart';

import 'remote_datasource.dart';

abstract class CovidCasesRemoteDatasource {
  Future<CovidDataCases?> fetch(String? url);
}

class CovidCasesRemoteDatasourceImpl extends RemoteDatasource
    implements CovidCasesRemoteDatasource {
  final Dio _httpClient;

  const CovidCasesRemoteDatasourceImpl(this._httpClient);

  @override
  Future<CovidDataCases?> fetch(String? url) async {
    try {
      final Response response = await _httpClient.get(
          url ??
              "https://api.brasil.io/v1/dataset/covid19/caso/data/?search=&date=&state=&pla",
          options: Options(headers: {
            'Authorization': 'Token 8b34c604f8c467c5950550f6870bde20dc5229fb'
          }));
      final result = handleResponse<Map<String, dynamic>>(response);
      if (result == null) return null;
      return CovidDataCases.fromMap(result);
    } on Failure {
      rethrow;
    } on DioError catch (error, stackTrace) {
      throw error.response?.statusCode == 429
          ? ServerError.mayResquest(stackTrace: stackTrace)
          : ServerError.generic(stackTrace: stackTrace);
    } catch (error, stackTrace) {
      throw DatasourceError(message: error.toString(), stackTrace: stackTrace);
    }
  }
}
