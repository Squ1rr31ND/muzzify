// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get yandexIdTitle => 'Яндекс ID';

  @override
  String get searchHint => 'Поиск треков';

  @override
  String get trackOpenFailed => 'Не удалось открыть трек';

  @override
  String get sourceCode => 'Код проекта';

  @override
  String get logoutTitle => 'Выйти';

  @override
  String get logoutConfirmation => 'Вы уверены?';

  @override
  String get logoutCancel => 'Отмена';

  @override
  String get logoutConfirm => 'Выйти';

  @override
  String get nothingFound => 'Ничего не найдено';

  @override
  String get errorTitle => 'Что-то пошло не так';

  @override
  String get errorRetry => 'Повторить';

  @override
  String get aboutCopyrightText => 'Copyright (c) 2026 Тимур Ждиханов';
}
