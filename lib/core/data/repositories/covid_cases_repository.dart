import '../models/covid_datacases.dart';
import '../datasources/covid_cases_remote_datasource.dart';
import '../../helpers/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CovidCasesRepository {
  Future<Either<Failure, CovidDataCases>> getCases({String? url});
}

class CovidCasesImpl implements CovidCasesRepository {
  final CovidCasesRemoteDatasource _remoteDatasource;

  const CovidCasesImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, CovidDataCases>> getCases({String? url}) async {
    try {
      final response = await _remoteDatasource.fetch(url);
      return Right(response!);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
