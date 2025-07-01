import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/di/injection_container.dart';
import 'package:nested/nested.dart';

class RouterUtils {
  static final RouterUtils _singleton = RouterUtils._();

  factory RouterUtils() => _singleton;

  RouterUtils._();

  /// The _buildRouteGeneric method is a helper method that creates a MaterialPageRoute with a BlocProvider for the given Cubit(s).
  static MaterialPageRoute buildRouteGeneric3<
    C extends Cubit,
    D extends Cubit,
    E extends Cubit
  >(Widget child) => _buildRouteGeneric([
    BlocProvider<C>(create: (context) => getIt<C>()),
    BlocProvider<D>(create: (context) => getIt<D>()),
    BlocProvider<E>(create: (context) => getIt<E>()),
  ], child);

  /// The _buildRouteGeneric method is a helper method that creates a MaterialPageRoute with a BlocProvider for the given Cubit(s).
  static MaterialPageRoute buildRouteGeneric2<C extends Cubit, D extends Cubit>(
    Widget child,
  ) => _buildRouteGeneric([
    BlocProvider<C>(create: (context) => getIt<C>()),
    BlocProvider<D>(create: (context) => getIt<D>()),
  ], child);

  /// The _buildRouteGeneric method is a helper method that creates a MaterialPageRoute with a BlocProvider for the given Cubit(s).
  static MaterialPageRoute buildRouteGeneric<C extends Cubit>(Widget child) =>
      _buildRouteGeneric([
        BlocProvider<C>(create: (context) => getIt<C>()),
      ], child);

  /// The _buildRouteGeneric method is a helper method that creates a MaterialPageRoute with a BlocProvider for the given Cubit(s).
  static MaterialPageRoute _buildRouteGeneric(
    List<SingleChildWidget> blocProviders,
    Widget child,
  ) => MaterialPageRoute(
    builder: (_) {
      return MultiBlocProvider(providers: blocProviders, child: child);
    },
  );

  ///  The _buildRoute method is a helper method that creates a MaterialPageRoute with the given child widget.
  static MaterialPageRoute buildRoute(Widget child) =>
      MaterialPageRoute(builder: (_) => child);
}
