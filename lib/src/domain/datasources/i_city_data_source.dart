/// {@template ICityDataSource}
/// Abstract class that defines the contract for the city data source.
/// {@endtemplate}
abstract class ICityDataSource {
  Future<List<dynamic>> fetchCities();
}
