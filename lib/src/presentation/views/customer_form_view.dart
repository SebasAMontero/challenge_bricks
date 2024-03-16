import 'package:auto_route/auto_route.dart';
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
  final _controllerFullName = TextEditingController();

  /// Form key to validate every textfield, to show error text or to disable submit customer.
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerFullName.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<BlocCustomerForm, BlocCustomerFormState>(
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
                'An error occurred fetching data.',
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
                          controller: _controllerFullName,
                          decoration: const InputDecoration(
                            labelText: 'Name',
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
                          decoration: const InputDecoration(labelText: 'Email'),
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
                          decoration: const InputDecoration(labelText: 'City'),
                          items: state.listCities
                              .map(
                                (city) => DropdownMenuItem<String>(
                                  value: city.name,
                                  child: Text(city.name),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: BricksButton(
                      // TODO(SAM): Add event
                      onTap: () {
                        context.router.push(const HomeRoute());
                      },
                      title: 'Submit Customer',
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
