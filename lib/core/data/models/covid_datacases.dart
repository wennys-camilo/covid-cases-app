import 'covid_case.dart';

class CovidDataCases {
  final int count;
  final String? next;
  final String? previous;
  final List<CovidCase> results;
  CovidDataCases({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory CovidDataCases.fromMap(Map<String, dynamic> map) {
    return CovidDataCases(
      count: map['count'],
      next: map['next'] != null ? map['next'] : null,
      previous: map['previous'] != null ? map['previous'] : null,
      results: List<CovidCase>.from(
          map['results']?.map((x) => CovidCase.fromMap(x))),
    );
  }
}
