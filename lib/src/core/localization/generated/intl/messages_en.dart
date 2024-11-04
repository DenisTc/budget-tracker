// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(date) => "Дата: ${date}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accept": MessageLookupByLibrary.simpleMessage("Применить"),
        "add": MessageLookupByLibrary.simpleMessage("Добавить"),
        "addTransaction":
            MessageLookupByLibrary.simpleMessage("Добавить транзакцию"),
        "category": MessageLookupByLibrary.simpleMessage("Категория"),
        "categoryLoadingError":
            MessageLookupByLibrary.simpleMessage("Ошибка загрузки категорий"),
        "categoryName":
            MessageLookupByLibrary.simpleMessage("Название категории"),
        "categoryNameAlreadyExists": MessageLookupByLibrary.simpleMessage(
            "Категория с таким именем уже существует"),
        "clear": MessageLookupByLibrary.simpleMessage("Очистить"),
        "clearFilters":
            MessageLookupByLibrary.simpleMessage("Очистить фильтры"),
        "date": MessageLookupByLibrary.simpleMessage("Дата: \$date"),
        "dateNdate": m0,
        "enterDate": MessageLookupByLibrary.simpleMessage("Укажите дату"),
        "enterNewCategoryName": MessageLookupByLibrary.simpleMessage(
            "Укажите название новой категории"),
        "expense": MessageLookupByLibrary.simpleMessage("Расход"),
        "failedToAddCategory": MessageLookupByLibrary.simpleMessage(
            "Не удалось добавить категорию, попробуйте позже"),
        "income": MessageLookupByLibrary.simpleMessage("Доход"),
        "ok": MessageLookupByLibrary.simpleMessage("Ок"),
        "period": MessageLookupByLibrary.simpleMessage("Период"),
        "pleaseEnterAmount":
            MessageLookupByLibrary.simpleMessage("Пожалуйста, введите сумму"),
        "pleaseEnterAmountGreaterThanZero":
            MessageLookupByLibrary.simpleMessage(
                "Пожалуйста, введите сумму больше 0"),
        "pleaseSelectCategory": MessageLookupByLibrary.simpleMessage(
            "Пожалуйста, выберите категорию"),
        "pleaseSelectDate":
            MessageLookupByLibrary.simpleMessage("Пожалуйста, выберите дату"),
        "pleaseSelectTransactionType": MessageLookupByLibrary.simpleMessage(
            "Пожалуйста, выберите тип транзакции"),
        "selectDate": MessageLookupByLibrary.simpleMessage("Выберите дату"),
        "statistics": MessageLookupByLibrary.simpleMessage("Статистика"),
        "sumOfTransaction":
            MessageLookupByLibrary.simpleMessage("Сумма транзакции"),
        "transactionCategory":
            MessageLookupByLibrary.simpleMessage("Категория транзакции"),
        "transactions": MessageLookupByLibrary.simpleMessage("Транзакции"),
        "typeOfTransaction":
            MessageLookupByLibrary.simpleMessage("Тип транзакции"),
        "yourTransactions":
            MessageLookupByLibrary.simpleMessage("Ваши транзакции")
      };
}
