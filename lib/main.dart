import 'package:budget_tracker/src/core/di/init_di.dart';
import 'package:budget_tracker/src/core/localization/generated/l10n.dart';
import 'package:budget_tracker/src/core/theme/app_theme.dart';
import 'package:budget_tracker/src/feature/category/presentation/cubit/category_cubit.dart';
import 'package:budget_tracker/src/feature/category_list/presentation/cubit/category_list_cubit.dart';
import 'package:budget_tracker/src/feature/dashboard/dashboard.dart';
import 'package:budget_tracker/src/feature/statistics/presentation/cubit/statistics_cubit.dart';
import 'package:budget_tracker/src/feature/transaction/presentation/cubit/transaction_cubit.dart';
import 'package:budget_tracker/src/feature/transaction_list/presentation/cubit/transaction_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TransactionCubit>(
          create: (context) => getIt<TransactionCubit>(),
        ),
        BlocProvider<TransactionListCubit>(
          create: (context) => getIt<TransactionListCubit>(),
        ),
        BlocProvider<CategoryCubit>(
          create: (context) => getIt<CategoryCubit>(),
        ),
        BlocProvider<CategoryListCubit>(
          create: (context) => getIt<CategoryListCubit>(),
        ),
        BlocProvider<StatisticsCubit>(
          create: (context) => getIt<StatisticsCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const Dashboard(),
      ),
    );
  }
}
