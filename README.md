# Yandex Dictionary Api

Package to access the Yandex.Dictionary API over HTTP.

## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  yandex_dictionary_api: ^latest
```

Import it:

```dart
import 'package:yandex_dictionary_api/yandex_dictionary_api.dart';
```

## Usage Examples

Create the Yandex Dictionary API object as follows.

```dart
final yandexDictionaryKey = YandexDictionaryKey(apiKey: '');
final yandexDictionaryApi = YandexDictionaryApi(key: yandexDictionaryKey);
```

You can call 2 functions with yandexDictionaryApi: `getLangs` and `lookup`.

- getLangs
> Returns a list of translation directions supported by the service.

```dart
final getLangsResponse = await yandexDictionaryApi.getLangs();
```

The lookup service can be used with the language list returned from here.

- lookup
> Searches for a word or phrase in the dictionary and returns an automatically generated dictionary entry.

```dart
final lookupRequest = YandexLookupRequest(lang: 'en-ru', text: 'hello');
final result = await yandexDictionaryApi.lookup(lookupRequest);
```

## Error Handling

API throws YandexDictionaryException in incorrect cases.

- YandexDictionaryInvalidKeyException
> Thrown when invalid API key.

- YandexDictionaryBlockedKeyException
> Thrown when this API key has been blocked.

- YandexDictionaryDailyRequestLimitException
> Exceeded the daily limit on the number of requests.

- YandexDictionaryTextTooLongException
> The text size exceeds the maximum.

- YandexDictionaryLangNotSupportedException
> The specified translation direction is not supported.

- YandexDictionaryUnknownException
> Thrown when unknown error cases.

## For more API documentation

visit [offical API documentation](https://yandex.ru/dev/tech-only/doc/dg/ru/)
