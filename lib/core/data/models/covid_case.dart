class CovidCase {
  final String? city;
  final String? cityIbgeCode;
  final int? confirmed;
  final double? confirmedPer100kInhaB;
  final String? date;
  final double? deathRate;
  final int? deaths;
  final int? estimatedPopulation;
  final int? estimatedPopulation2019;
  final bool? isLast;
  final int? orderForPlace;
  final String? placeType;
  final String? state;
  CovidCase({
    this.city,
    this.cityIbgeCode,
    this.confirmed,
    this.confirmedPer100kInhaB,
    this.date,
    this.deathRate,
    this.deaths,
    this.estimatedPopulation,
    this.estimatedPopulation2019,
    this.isLast,
    this.orderForPlace,
    this.placeType,
    this.state,
  });

  factory CovidCase.fromMap(Map<String, dynamic> map) {
    return CovidCase(
      city: map['city'] != null ? map['city'] : null,
      cityIbgeCode:
          map['city_ibge_code'] != null ? map['city_ibge_code'] : null,
      confirmed: map['confirmed'] != null ? map['confirmed'] : null,
      confirmedPer100kInhaB: map['confirmed_per_100k_inhabitants'] != null
          ? map['confirmed_per_100k_inhabitants']
          : null,
      date: map['date'] != null ? map['date'] : null,
      deathRate: map['death_rate'] != null ? map['death_rate'] : null,
      deaths: map['deaths'] != null ? map['deaths'] : null,
      estimatedPopulation: map['estimated_population'] != null
          ? map['estimated_population']
          : null,
      estimatedPopulation2019: map['estimated_population_2019'] != null
          ? map['estimated_population_2019']
          : null,
      isLast: map['is_last'] != null ? map['is_last'] : null,
      orderForPlace:
          map['order_for_place'] != null ? map['order_for_place'] : null,
      placeType: map['place_type'] != null ? map['place_type'] : null,
      state: map['state'] != null ? map['state'] : null,
    );
  }
}
