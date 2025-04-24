///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsRu implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override String get dog => 'Dog';
	@override String get app => 'App';
	@override String get errorLoadingImage => 'Ошибка при загрузке изображения';
	@override String get noInternetMessage => 'Нет подключения к Интернету. Проверьте соединение';
	@override String get serverError => 'Ошибка сервера';
	@override late final _TranslationsSettingsPageRu settingsPage = _TranslationsSettingsPageRu._(_root);
}

// Path: settingsPage
class _TranslationsSettingsPageRu implements TranslationsSettingsPageEn {
	_TranslationsSettingsPageRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get settings => 'Настройки';
	@override String get termsOfUse => 'Условия использования';
	@override String get privacyPolicy => 'Политика конфиденциальности';
	@override String get shareApp => 'Поделиться приложением';
	@override String get rateApp => 'Оценить приложение';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'dog': return 'Dog';
			case 'app': return 'App';
			case 'errorLoadingImage': return 'Ошибка при загрузке изображения';
			case 'noInternetMessage': return 'Нет подключения к Интернету. Проверьте соединение';
			case 'serverError': return 'Ошибка сервера';
			case 'settingsPage.settings': return 'Настройки';
			case 'settingsPage.termsOfUse': return 'Условия использования';
			case 'settingsPage.privacyPolicy': return 'Политика конфиденциальности';
			case 'settingsPage.shareApp': return 'Поделиться приложением';
			case 'settingsPage.rateApp': return 'Оценить приложение';
			default: return null;
		}
	}
}

