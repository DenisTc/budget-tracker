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

  /// `Название категории`
  String get categoryName {
    return Intl.message(
      'Название категории',
      name: 'categoryName',
      desc: '',
      args: [],
    );
  }

  /// `Укажите название новой категории`
  String get enterNewCategoryName {
    return Intl.message(
      'Укажите название новой категории',
      name: 'enterNewCategoryName',
      desc: '',
      args: [],
    );
  }

  /// `Категория с таким именем уже существует`
  String get categoryNameAlreadyExists {
    return Intl.message(
      'Категория с таким именем уже существует',
      name: 'categoryNameAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось добавить категорию, попробуйте позже`
  String get failedToAddCategory {
    return Intl.message(
      'Не удалось добавить категорию, попробуйте позже',
      name: 'failedToAddCategory',
      desc: '',
      args: [],
    );
  }

  /// `Ок`
  String get ok {
    return Intl.message(
      'Ок',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Применить`
  String get accept {
    return Intl.message(
      'Применить',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Очистить фильтры`
  String get clearFilters {
    return Intl.message(
      'Очистить фильтры',
      name: 'clearFilters',
      desc: '',
      args: [],
    );
  }

  /// `Очистить`
  String get clear {
    return Intl.message(
      'Очистить',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Укажите дату`
  String get enterDate {
    return Intl.message(
      'Укажите дату',
      name: 'enterDate',
      desc: '',
      args: [],
    );
  }

  /// `Период`
  String get period {
    return Intl.message(
      'Период',
      name: 'period',
      desc: '',
      args: [],
    );
  }

  /// `Количество опреаций по категориям за {month} {year}`
  String operationsByCategoryForMonthByYear(Object month, Object year) {
    return Intl.message(
      'Количество опреаций по категориям за $month $year',
      name: 'operationsByCategoryForMonthByYear',
      desc: '',
      args: [month, year],
    );
  }

  /// `Количество операций по категориям:`
  String get operationsByCategory {
    return Intl.message(
      'Количество операций по категориям:',
      name: 'operationsByCategory',
      desc: '',
      args: [],
    );
  }

  /// `Добавляйте транзакции и смотрите свою статистику!`
  String get addTransactionsAndViewStats {
    return Intl.message(
      'Добавляйте транзакции и смотрите свою статистику!',
      name: 'addTransactionsAndViewStats',
      desc: '',
      args: [],
    );
  }

  /// `Прибыль`
  String get profit {
    return Intl.message(
      'Прибыль',
      name: 'profit',
      desc: '',
      args: [],
    );
  }

  /// `Прибыль (доходы-расходы)`
  String get profitDescription {
    return Intl.message(
      'Прибыль (доходы-расходы)',
      name: 'profitDescription',
      desc: '',
      args: [],
    );
  }

  /// `Удалить транзакцию?`
  String get deleteTransaction {
    return Intl.message(
      'Удалить транзакцию?',
      name: 'deleteTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Доходы и расходы`
  String get incomeAndExpenses {
    return Intl.message(
      'Доходы и расходы',
      name: 'incomeAndExpenses',
      desc: '',
      args: [],
    );
  }

  /// `Используемые категории`
  String get usedCategories {
    return Intl.message(
      'Используемые категории',
      name: 'usedCategories',
      desc: '',
      args: [],
    );
  }

  /// `Здесь пусто!`
  String get emptyHere {
    return Intl.message(
      'Здесь пусто!',
      name: 'emptyHere',
      desc: '',
      args: [],
    );
  }

  /// `Добавьте новые транзакции чтобы контролировать свои расходы и доходы!`
  String get addTransactionsToControl {
    return Intl.message(
      'Добавьте новые транзакции чтобы контролировать свои расходы и доходы!',
      name: 'addTransactionsToControl',
      desc: '',
      args: [],
    );
  }

  /// `Удалить`
  String get delete {
    return Intl.message(
      'Удалить',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Редактировать`
  String get edit {
    return Intl.message(
      'Редактировать',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Добавить категорию`
  String get addCategory {
    return Intl.message(
      'Добавить категорию',
      name: 'addCategory',
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
