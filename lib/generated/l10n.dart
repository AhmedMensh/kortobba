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

  /// `Kortoba`
  String get app_name {
    return Intl.message(
      'Kortoba',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get login {
    return Intl.message(
      'تسجيل الدخول',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `الدخول`
  String get enter {
    return Intl.message(
      'الدخول',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `اسم المستخدم`
  String get user_name {
    return Intl.message(
      'اسم المستخدم',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `كلمة السر`
  String get password {
    return Intl.message(
      'كلمة السر',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `الرئيسية`
  String get home {
    return Intl.message(
      'الرئيسية',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `المفضلة`
  String get favorites {
    return Intl.message(
      'المفضلة',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك قم بالدخول لإتمام الشراء`
  String get please_login_to_complete_the_purchase {
    return Intl.message(
      'من فضلك قم بالدخول لإتمام الشراء',
      name: 'please_login_to_complete_the_purchase',
      desc: '',
      args: [],
    );
  }

  /// `نقل إلى سلة التسوق`
  String get add_to_cart {
    return Intl.message(
      'نقل إلى سلة التسوق',
      name: 'add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `ج.م`
  String get l_e {
    return Intl.message(
      'ج.م',
      name: 'l_e',
      desc: '',
      args: [],
    );
  }

  /// `قائمه المفضله فارغه`
  String get favorites_list_empty {
    return Intl.message(
      'قائمه المفضله فارغه',
      name: 'favorites_list_empty',
      desc: '',
      args: [],
    );
  }

  /// `وصل حديثا`
  String get recently_arrived {
    return Intl.message(
      'وصل حديثا',
      name: 'recently_arrived',
      desc: '',
      args: [],
    );
  }

  /// `لا تتوافر بيانات`
  String get no_data_available {
    return Intl.message(
      'لا تتوافر بيانات',
      name: 'no_data_available',
      desc: '',
      args: [],
    );
  }

  /// `هذا الحقل مطلوب`
  String get field_required {
    return Intl.message(
      'هذا الحقل مطلوب',
      name: 'field_required',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
