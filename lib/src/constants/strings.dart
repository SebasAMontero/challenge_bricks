/// Class where all the String constants are stored.
class Strings {
  const Strings._();

  static const String appTitle = 'Bricks App';
  static const String baseUrl = 'https://api.develop.bricks.com.ar/tax/';
  static const String customerEndpoint = 'customer';
  static const String customerCountEndpoint = 'customer/count';
  static const String cityEndpoint = 'city';

  /// 'Clientes'
  static const String homePageAppBarTitle = 'Clientes';

  /// 'Clientes'
  static const String homeViewCustomerCount = 'Customer count: ';

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

  /// Validation error message for name input.
  static const String validateNameErrorMessage =
      'Name should be at least 3 characters long';

  /// Validation error message for email input.
  static const String validateEmailErrorMessage =
      'Please enter a valid email address';

  /// Validation error message for email input when the field is empty.
  static const String validateEmailEmptyErrorMessage =
      'Please enter an email address';

  /// Validation error message for city input.
  static const String validateCityErrorMessage = 'Please select a city';

  /// Title of the view Customer Form.
  static const String customerFormViewTitle = 'Please fill customer details';

  /// Prefix for the Name label in the view Customer Detail
  static const String customerDetailNamePrefix = 'Name: ';

  /// Prefix for the Email label in the view Customer Detail
  static const String customerDetailEmailPrefix = 'Email: ';

  /// Prefix for the City label in the view Customer Detail
  static const String customerDetailCityPrefix = 'City: ';

  /// Text for the delete user button in the view Customer Detail
  static const String customerDetailDeleteUserButtonText = 'Delete User';

  /// Title text for the delete user dialog in the view Customer Detail
  static const String customerDetailDeleteUserDialogTitle = 'Delete User';

  /// Confirmation text for the delete user dialog in the view Customer Detail
  static const String customerDetailDeleteUserDialogConfirmation =
      'Are you sure you want to\n delete ';

  /// Text to indicate deletion
  static const String commonDelete = 'Delete';

  /// Text to indicate cancelling an action
  static const String commonCancel = 'Cancel';

  /// Text to indicate this character ?
  static const String commonQuestionMark = '?';

  /// Text previous to the number of pages
  static const String homeViewPageNumber = 'Page: ';
}
