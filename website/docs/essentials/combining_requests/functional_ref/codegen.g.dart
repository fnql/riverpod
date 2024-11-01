// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'codegen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

typedef OtherRef = Ref<int>;

@ProviderFor(other)
const otherProvider = OtherProvider._();

final class OtherProvider extends $FunctionalProvider<int, int>
    with $Provider<int, OtherRef> {
  const OtherProvider._(
      {int Function(
        OtherRef ref,
      )? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          retry: null,
          name: r'otherProvider',
          isAutoDispose: true,
          dependencies: null,
          allTransitiveDependencies: null,
        );

  final int Function(
    OtherRef ref,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$otherHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<int>(value),
    );
  }

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(this, pointer);

  @override
  OtherProvider $copyWithCreate(
    int Function(
      OtherRef ref,
    ) create,
  ) {
    return OtherProvider._(create: create);
  }

  @override
  int create(OtherRef ref) {
    final _$cb = _createCb ?? other;
    return _$cb(ref);
  }
}

String _$otherHash() => r'5d27b2b1b1c6bd17ba0844f74ade2088611be371';

typedef ExampleRef = Ref<int>;

@ProviderFor(example)
const exampleProvider = ExampleProvider._();

final class ExampleProvider extends $FunctionalProvider<int, int>
    with $Provider<int, ExampleRef> {
  const ExampleProvider._(
      {int Function(
        ExampleRef ref,
      )? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          retry: null,
          name: r'exampleProvider',
          isAutoDispose: true,
          dependencies: null,
          allTransitiveDependencies: null,
        );

  final int Function(
    ExampleRef ref,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$exampleHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<int>(value),
    );
  }

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(this, pointer);

  @override
  ExampleProvider $copyWithCreate(
    int Function(
      ExampleRef ref,
    ) create,
  ) {
    return ExampleProvider._(create: create);
  }

  @override
  int create(ExampleRef ref) {
    final _$cb = _createCb ?? example;
    return _$cb(ref);
  }
}

String _$exampleHash() => r'6115819b119e2f16f22c69aae827632e3b585775';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
