/// {@template yandex_dictionary_key}
/// All API methods are accessed using a key. Please fill out this simple
/// [form](https://yandex.com/dev/dictionary/keys/get/?service=dict) to get your free API key.
/// {@endtemplate}
final class YandexDictionaryKey {
  /// {@macro yandex_dictionary_api}
  const YandexDictionaryKey({required this.apiKey});

  /// API key.
  final String apiKey;
}

/// {@template yandex_lookup_request}
/// The request to be sent to the lookup service.
/// {@endtemplate}
final class YandexLookupRequest {
  /// {@macro yandex_lookup_request}
  const YandexLookupRequest({
    required this.lang,
    required this.text,
  });

  /// Translation direction (for example, "en-ru"). Set as a pair of
  /// language codes separated by a hyphen. For example, "en-ru" specifies
  /// to translate from English to Russian.
  final String lang;

  /// The word or phrase to find in the dictionary.
  final String text;
}

/// {@template yandex_lookup_response}
/// The response from lookup service.
/// {@endtemplate}
final class YandexLookupResponse {
  /// {@macro yandex_lookup_response}
  const YandexLookupResponse({
    this.def,
  });

  /// Converts a `Map<String, dynamic>` into a [YandexLookupResponse] instance.
  factory YandexLookupResponse.fromJson(Map<String, dynamic> json) {
    return YandexLookupResponse(
      def: (json['def'] as List<dynamic>?)
          ?.map((e) => Def.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Array of dictionary entries.
  final List<Def>? def;

  @override
  String toString() => 'YandexLookupResponse(def: $def)';
}

/// {@template yandex_lookup_response_def}
/// A transcription of the search word may be provided in the ts attribute.
/// {@endtemplate}
final class Def {
  /// {@macro yandex_lookup_response_def}
  const Def({
    this.text,
    this.pos,
    this.ts,
    this.tr,
  });

  /// Converts a `Map<String, dynamic>` into a [Def] instance.
  factory Def.fromJson(Map<String, dynamic> json) {
    return Def(
      text: json['text'] as String?,
      pos: json['pos'] as String?,
      ts: json['ts'] as String?,
      tr: (json['tr'] as List<dynamic>?)
          ?.map((e) => Tr.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Text of the entry, translation, or synonym (mandatory).
  final String? text;

  /// Part of speech (may be omitted).
  final String? pos;

  /// Array of translations.
  final List<Tr>? tr;

  /// Transcription of the [text]
  final String? ts;

  @override
  String toString() => 'Def(text: $text, pos: $pos, tr: $tr, ts: $ts)';
}

/// {@template yandex_lookup_response_tr}
/// A translation value.
/// {@endtemplate}
class Tr {
  /// {@macro yandex_lookup_response_tr}
  Tr({
    this.text,
    this.pos,
    this.syn,
    this.mean,
    this.ex,
  });

  /// Converts a `Map<String, dynamic>` into a [Tr] instance.
  factory Tr.fromJson(Map<String, dynamic> json) {
    return Tr(
      text: json['text'] as String?,
      pos: json['pos'] as String?,
      syn: (json['syn'] as List<dynamic>?)
          ?.map((e) => Syn.fromJson(e as Map<String, dynamic>))
          .toList(),
      mean: (json['mean'] as List<dynamic>?)
          ?.map((e) => Mean.fromJson(e as Map<String, dynamic>))
          .toList(),
      ex: (json['ex'] as List<dynamic>?)
          ?.map((e) => Ex.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Text of the entry, translation, or synonym (mandatory).
  final String? text;

  /// Part of speech (may be omitted).
  final String? pos;

  /// 	Array of synonyms.
  final List<Syn>? syn;

  /// Array of meanings.
  final List<Mean>? mean;

  /// Array of examples.
  final List<Ex>? ex;

  @override
  String toString() =>
      'Tr(text: $text,pos: $pos,syn: $syn,mean: $mean,ex: $ex)';
}

/// {@template yandex_lookup_response_syn}
/// A synonym value.
/// {@endtemplate}
final class Syn {
  /// {@macro yandex_lookup_response_syn}
  Syn({
    this.text,
  });

  /// Converts a `Map<String, dynamic>` into a [Syn] instance.
  factory Syn.fromJson(Map<String, dynamic> json) {
    return Syn(
      text: json['text'] as String?,
    );
  }

  /// Text of the entry, translation, or synonym (mandatory).
  final String? text;

  @override
  String toString() => 'Syn(text: $text)';
}

/// {@template yandex_lookup_response_mean}
/// A meaning value.
/// {@endtemplate}
final class Mean {
  /// {@macro yandex_lookup_response_mean}
  Mean({
    this.text,
  });

  /// Converts a `Map<String, dynamic>` into a [Mean] instance.
  factory Mean.fromJson(Map<String, dynamic> json) {
    return Mean(
      text: json['text'] as String?,
    );
  }

  /// Text of the entry, translation, or synonym (mandatory).
  final String? text;

  @override
  String toString() => 'Mean(text: $text)';
}

/// {@template yandex_lookup_response_ex}
/// A example value.
/// {@endtemplate}
final class Ex {
  /// {@macro yandex_lookup_response_ex}
  const Ex({
    this.text,
    this.tr,
  });

  /// Converts a `Map<String, dynamic>` into a [Ex] instance.
  factory Ex.fromJson(Map<String, dynamic> json) {
    return Ex(
      text: json['text'] as String?,
      tr: (json['tr'] as List<dynamic>?)
          ?.map((e) => ExTr.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Text of the entry, translation, or synonym (mandatory).
  final String? text;

  /// List of example values.
  final List<ExTr>? tr;

  @override
  String toString() => 'Ex(text: $text,tr: $tr)';
}

/// {@template yandex_lookup_response_ex_tr}
/// A example translation value.
/// {@endtemplate}
final class ExTr {
  /// {@macro yandex_lookup_response_ex_tr}
  const ExTr({
    this.text,
  });

  /// Converts a `Map<String, dynamic>` into a [ExTr] instance.
  factory ExTr.fromJson(Map<String, dynamic> json) {
    return ExTr(
      text: json['text'] as String?,
    );
  }

  /// Text of the entry, translation, or synonym (mandatory).
  final String? text;

  @override
  String toString() => 'Tr(text: $text)';
}
