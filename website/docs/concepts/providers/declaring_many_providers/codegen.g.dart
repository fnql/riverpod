// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'codegen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

typedef CityRef = Ref<String>;

@ProviderFor(city)
const cityProvider = CityProvider._();

final class CityProvider extends $FunctionalProvider<String, String>
    with $Provider<String, CityRef> {
  const CityProvider._(
      {String Function(
        CityRef ref,
      )? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          retry: null,
          name: r'cityProvider',
          isAutoDispose: true,
          dependencies: null,
          allTransitiveDependencies: null,
        );

  final String Function(
    CityRef ref,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$cityHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<String>(value),
    );
  }

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(this, pointer);

  @override
  CityProvider $copyWithCreate(
    String Function(
      CityRef ref,
    ) create,
  ) {
    return CityProvider._(create: create);
  }

  @override
  String create(CityRef ref) {
    final _$cb = _createCb ?? city;
    return _$cb(ref);
  }
}

String _$cityHash() => r'6a5023a3aba119f1ecaee6c7db44b3f519e72759';

typedef CountryRef = Ref<String>;

@ProviderFor(country)
const countryProvider = CountryProvider._();

final class CountryProvider extends $FunctionalProvider<String, String>
    with $Provider<String, CountryRef> {
  const CountryProvider._(
      {String Function(
        CountryRef ref,
      )? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          retry: null,
          name: r'countryProvider',
          isAutoDispose: true,
          dependencies: null,
          allTransitiveDependencies: null,
        );

  final String Function(
    CountryRef ref,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$countryHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<String>(value),
    );
  }

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(this, pointer);

  @override
  CountryProvider $copyWithCreate(
    String Function(
      CountryRef ref,
    ) create,
  ) {
    return CountryProvider._(create: create);
  }

  @override
  String create(CountryRef ref) {
    final _$cb = _createCb ?? country;
    return _$cb(ref);
  }
}

String _$countryHash() => r'9fabd1cffe35f15a0a03339193da2d646c260137';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
