// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get yandexIdTitle => 'Yandex ID';

  @override
  String get searchHint => 'Search tracks';

  @override
  String get trackOpenFailed => 'Failed to open track';

  @override
  String get sourceCode => 'Source code';

  @override
  String get logoutTitle => 'Log out';

  @override
  String get logoutConfirmation => 'Are you sure?';

  @override
  String get logoutCancel => 'Cancel';

  @override
  String get logoutConfirm => 'Log out';

  @override
  String get nothingFound => 'Nothing found';

  @override
  String get errorTitle => 'Something went wrong';

  @override
  String get errorRetry => 'Retry';

  @override
  String get aboutCopyrightText => 'Copyright (c) 2026 Timur Zhdikhanov';
}
