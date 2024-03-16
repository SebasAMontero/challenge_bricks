/// Class where all the String constants are stored.
class Strings {
  const Strings._();

  static const String appTitle = 'Bricks App';
  static const String baseUrl = 'https://api.develop.bricks.com.ar/tax/';
  static const String customerEndpoint = 'customer';
  static const String cityEndpoint = 'city';

  /// 'Clientes'
  static const String homePageAppBarTitle = 'Clientes';

  /// Used in error States of Bloc.
  static const String errorFetchingData = 'An error occurred fetching data.';

  /// Label text used in texformfields
  static const String labelTextName = 'Name';

  /// Label text used in texformfields
  static const String labelTextEmail = 'Email';

  /// Label text used in texformfields
  static const String labelTextCity = 'City';

   /// Used in the customer form view to submit a customer.
  static const String submitCustomer = 'Submit Customer';
}
