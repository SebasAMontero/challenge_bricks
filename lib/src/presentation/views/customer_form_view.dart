import 'package:auto_route/auto_route.dart';
import 'package:bricks_app_flutter/src/constants/doubles.dart';
import 'package:bricks_app_flutter/src/constants/strings.dart';
import 'package:bricks_app_flutter/src/core/routes/auto_route/auto_route.gr.dart';
import 'package:bricks_app_flutter/src/presentation/bloc/bloc_customer_form/bloc_customer_form.dart';
import 'package:bricks_app_flutter/src/presentation/widgets/bricks_button.dart';
import 'package:bricks_app_flutter/src/presentation/widgets/bricks_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template CustomerFormView}
/// View of the Customer form page.
/// {@endtemplate}
class CustomerFormView extends StatefulWidget {
  /// {@macro CustomerFormView}
  const CustomerFormView({Key? key}) : super(key: key);

  @override
  State<CustomerFormView> createState() => _CustomerFormViewState();
}

class _CustomerFormViewState extends State<CustomerFormView> {
  /// Controller of the textfield to add the email of the customer.
  final _controllerEmail = TextEditingController();

  /// Controller of the textfield to add the full name of the customer.
  final _controllerName = TextEditingController();

  /// Form key to validate every textfield, to show error text or to disable submit customer.
  final _formKey = GlobalKey<FormState>();

  /// Bool that indicates that the form is valid to send and submit user.
  var formIsValid = false;

  /// Id of the city chosen from the dropdown to add to the event.
  var cityId = 0;

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerName.dispose();
    super.dispose();
  }

  /// Validates if the user typed a valid email.
  String? _validateEmailInput(String? email) {
    if (email == null || email.isEmpty) {
      return Strings.validateEmailEmptyErrorMessage;
    }
    final bool emailValid =
        RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$').hasMatch(email);

    if (!emailValid) {
      return Strings.validateEmailErrorMessage;
    }

    return null;
  }

  /// Validates if the user typed a valid name, it must be at least 3 characters long.
  String? _validateNameInput(String? name) {
    if (name == null || name.length < 3) {
      return Strings.validateNameErrorMessage;
    }
    return null;
  }

  /// Validates if the user selected a city.
  String? _validateCityInput(String? city) {
    if (city == null || city.isEmpty) {
      return Strings.validateCityErrorMessage;
    }
    return null;
  }

  /// Submits the form, adding the event Submit Customer prior to a validation.
  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.read<BlocCustomerForm>().add(
          BlocCustomerFormEventSubmitCustomer(
            name: _controllerName.text,
            email: _controllerEmail.text,
            cityId: cityId,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<BlocCustomerForm, BlocCustomerFormState>(
        listener: (context, state) {
          if (state is BlocCustomerFormStateSubmitCustomerSuccess) {
            context.router.push(const HomeRoute());
          }
        },
        builder: (context, state) {
          if (state is BlocCustomerFormStateLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            );
          }
          if (state is BlocCustomerFormStateError) {
            return const Center(
              child: Text(
                Strings.errorFetchingData,
                style: TextStyle(
                  fontSize: Doubles.fontSizeLarge,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  const SizedBox(
                    child: Center(
                      child: Text(
                        Strings.customerFormViewTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Doubles.fontSizeLarge,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  BricksTextFormField(
                    controller: _controllerName,
                    validator: _validateNameInput,
                    iconData: Icons.person_outline,
                    labelText: Strings.labelTextName,
                  ),
                  const SizedBox(height: 20),
                  BricksTextFormField(
                    controller: _controllerEmail,
                    validator: _validateEmailInput,
                    iconData: Icons.email_outlined,
                    labelText: Strings.labelTextEmail,
                    isEmail: true,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.location_city_outlined,
                        ),
                      ),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          menuMaxHeight: 300,
                          decoration: const InputDecoration(
                            labelText: Strings.labelTextCity,
                          ),
                          items: state.listCities
                              .map(
                                (city) => DropdownMenuItem<String>(
                                  value: city.id.toString(),
                                  onTap: () => setState(() {
                                    cityId = city.id;
                                  }),
                                  child: Text(city.name),
                                ),
                              )
                              .toList(),
                          onChanged: (String? value) {},
                          validator: _validateCityInput,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Center(
                    child: BricksButton(
                      onTap: () {
                        _submitForm();
                      },
                      title: Strings.submitCustomer,
                      isEnabled: true,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
