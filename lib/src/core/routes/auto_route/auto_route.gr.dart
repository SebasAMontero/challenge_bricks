// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:bricks_app_flutter/src/presentation/pages/customer_detail_page.dart'
    as _i1;
import 'package:bricks_app_flutter/src/presentation/pages/customer_form_page.dart'
    as _i2;
import 'package:bricks_app_flutter/src/presentation/pages/home_page.dart'
    as _i3;
import 'package:flutter/material.dart' as _i5;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    CustomerDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CustomerDetailRouteArgs>(
          orElse: () => CustomerDetailRouteArgs(
                idClient: pathParams.getInt('clientName'),
                clientName: pathParams.getString('clientName'),
                clientEmail: pathParams.getString('clientEmail'),
                clientCity: pathParams.getString('clientCity'),
              ));
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CustomerDetailPage(
          key: args.key,
          idClient: args.idClient,
          clientName: args.clientName,
          clientEmail: args.clientEmail,
          clientCity: args.clientCity,
        ),
      );
    },
    CustomerFormRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CustomerFormPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CustomerDetailPage]
class CustomerDetailRoute extends _i4.PageRouteInfo<CustomerDetailRouteArgs> {
  CustomerDetailRoute({
    _i5.Key? key,
    required int idClient,
    required String clientName,
    required String clientEmail,
    required String clientCity,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          CustomerDetailRoute.name,
          args: CustomerDetailRouteArgs(
            key: key,
            idClient: idClient,
            clientName: clientName,
            clientEmail: clientEmail,
            clientCity: clientCity,
          ),
          rawPathParams: {
            'clientName': clientName,
            'clientEmail': clientEmail,
            'clientCity': clientCity,
          },
          initialChildren: children,
        );

  static const String name = 'CustomerDetailRoute';

  static const _i4.PageInfo<CustomerDetailRouteArgs> page =
      _i4.PageInfo<CustomerDetailRouteArgs>(name);
}

class CustomerDetailRouteArgs {
  const CustomerDetailRouteArgs({
    this.key,
    required this.idClient,
    required this.clientName,
    required this.clientEmail,
    required this.clientCity,
  });

  final _i5.Key? key;

  final int idClient;

  final String clientName;

  final String clientEmail;

  final String clientCity;

  @override
  String toString() {
    return 'CustomerDetailRouteArgs{key: $key, idClient: $idClient, clientName: $clientName, clientEmail: $clientEmail, clientCity: $clientCity}';
  }
}

/// generated route for
/// [_i2.CustomerFormPage]
class CustomerFormRoute extends _i4.PageRouteInfo<void> {
  const CustomerFormRoute({List<_i4.PageRouteInfo>? children})
      : super(
          CustomerFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerFormRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
