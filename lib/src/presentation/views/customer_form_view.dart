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
                    height: 60.0,
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
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: BricksButton(
                      onTap: () {
                        context.read<BlocCustomerForm>().add(
                              BlocCustomerFormEventSubmitCustomer(
                                name: _controllerName.text,
                                email: _controllerEmail.text,
                                cityId: cityId,
                              ),
                            );
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
