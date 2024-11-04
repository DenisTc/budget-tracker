// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Транзакции`
  String get transactions {
    return Intl.message(
      'Транзакции',
      name: 'transactions',
      desc: '',
      args: [],
    );
  }

  /// `Статистика`
  String get statistics {
    return Intl.message(
      'Статистика',
      name: 'statistics',
      desc: '',
      args: [],
    );
  }

  /// `Добавить транзакцию`
  String get addTransaction {
    return Intl.message(
      'Добавить транзакцию',
      name: 'addTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Сумма транзакции`
  String get sumOfTransaction {
    return Intl.message(
      'Сумма транзакции',
      name: 'sumOfTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Категория`
  String get category {
    return Intl.message(
      'Категория',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Тип транзакции`
  String get typeOfTransaction {
    return Intl.message(
      'Тип транзакции',
      name: 'typeOfTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Расход`
  String get expense {
    return Intl.message(
      'Расход',
      name: 'expense',
      desc: '',
      args: [],
    );
  }

  /// `Доход`
  String get income {
    return Intl.message(
      'Доход',
      name: 'income',
      desc: '',
      args: [],
    );
  }

  /// `Добавить`
  String get add {
    return Intl.message(
      'Добавить',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Выберите дату`
  String get selectDate {
    return Intl.message(
      'Выберите дату',
      name: 'selectDate',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, выберите тип транзакции`
  String get pleaseSelectTransactionType {
    return Intl.message(
      'Пожалуйста, выберите тип транзакции',
      name: 'pleaseSelectTransactionType',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, введите сумму`
  String get pleaseEnterAmount {
    return Intl.message(
      'Пожалуйста, введите сумму',
      name: 'pleaseEnterAmount',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, введите сумму больше 0`
  String get pleaseEnterAmountGreaterThanZero {
    return Intl.message(
      'Пожалуйста, введите сумму больше 0',
      name: 'pleaseEnterAmountGreaterThanZero',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, выберите категорию`
  String get pleaseSelectCategory {
    return Intl.message(
      'Пожалуйста, выберите категорию',
      name: 'pleaseSelectCategory',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, выберите дату`
  String get pleaseSelectDate {
    return Intl.message(
      'Пожалуйста, выберите дату',
      name: 'pleaseSelectDate',
      desc: '',
      args: [],
    );
  }

  /// `Ваши транзакции`
  String get yourTransactions {
    return Intl.message(
      'Ваши транзакции',
      name: 'yourTransactions',
      desc: '',
      args: [],
    );
  }

  /// `Дата: $date`
  String get date {
    return Intl.message(
      'Дата: \$date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Дата: {date}`
  String dateNdate(Object date) {
    return Intl.message(
      'Дата: $date',
      name: 'dateNdate',
      desc: '',
      args: [date],
    );
  }

  /// `Ошибка загрузки категорий`
  String get categoryLoadingError {
    return Intl.message(
      'Ошибка загрузки категорий',
      name: 'categoryLoadingError',
      desc: '',
      args: [],
    );
  }

  /// `Категория транзакции`
  String get transactionCategory {
    return Intl.message(
      'Категория транзакции',
      name: 'transactionCategory',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
