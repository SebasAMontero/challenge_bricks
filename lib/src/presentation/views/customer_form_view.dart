import 'package:auto_route/auto_route.dart';
import 'package:bricks_app_flutter/src/constants/strings.dart';
import 'package:bricks_app_flutter/src/core/routes/auto_route/auto_route.gr.dart';
import 'package:bricks_app_flutter/src/presentation/bloc/bloc_customer_form/bloc_customer_form.dart';
import 'package:bricks_app_flutter/src/presentation/widgets/bricks_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template CustomerFormView}
/// View of the Customer form page.
/// {@endtemplate}
class CustomerFormView extends StatefulWidget {
  /// {@macro HomeView}
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

  var cityId = 0;

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerName.dispose();

    super.dispose();
  }

// TODO(SAM): String constants and extract widgets.
  /// Validates if the user typed a valid email, it must contain @.
  String? _validateEmailInput(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter an email address';
    }
    final bool emailValid =
        RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$').hasMatch(email);

    if (!emailValid) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  /// Validates if the user typed a valid name, it must be at least 3 characters long.
  String? _validateNameInput(String? name) {
    if (name == null || name.length < 3) {
      return 'Name should be at least 3 characters long';
    }
    return null;
  }

  /// Validates if the user selected a city.
  String? _validateCityInput(String? city) {
    if (city == null || city.isEmpty) {
      return 'Please select a city';
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
                  fontSize: 20.0,
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
                    height: 20.0,
                  ),
                  const SizedBox(
                    child: Center(
                      child: Text(
                        'Please fill customer details',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.person_outline,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _controllerName,
                          decoration: const InputDecoration(
                            labelText: Strings.labelTextName,
                          ),
                          validator: _validateNameInput,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.email_outlined,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _controllerEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: Strings.labelTextEmail,
                          ),
                          validator: _validateEmailInput,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ],
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
                  const SizedBox(height: 20),
                  Center(
                    child: BricksButton(
                      onTap: () {
                        _submitForm();
                      },
                      title: Strings.submitCustomer,
                      isEnabled: true,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
