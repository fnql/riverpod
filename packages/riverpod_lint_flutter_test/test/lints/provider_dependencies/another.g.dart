// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'another.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

typedef BRef = Ref<int>;

@ProviderFor(b)
const bProvider = BProvider._();

final class BProvider extends $FunctionalProvider<int, int>
    with $Provider<int, BRef> {
  const BProvider._(
      {int Function(
        BRef ref,
      )? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          retry: null,
          name: r'bProvider',
          isAutoDispose: true,
          dependencies: null,
          allTransitiveDependencies: null,
        );

  final int Function(
    BRef ref,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$bHash();

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
  BProvider $copyWithCreate(
    int Function(
      BRef ref,
    ) create,
  ) {
    return BProvider._(create: create);
  }

  @override
  int create(BRef ref) {
    final _$cb = _createCb ?? b;
    return _$cb(ref);
  }
}

String _$bHash() => r'31624e9aa10c9cd7941c9626e841c6df3468723b';

typedef AnotherScopedRef = Ref<int>;

@ProviderFor(anotherScoped)
const anotherScopedProvider = AnotherScopedProvider._();

final class AnotherScopedProvider extends $FunctionalProvider<int, int>
    with $Provider<int, AnotherScopedRef> {
  const AnotherScopedProvider._(
      {int Function(
        AnotherScopedRef ref,
      )? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          retry: null,
          name: r'anotherScopedProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[],
          allTransitiveDependencies: const <ProviderOrFamily>[],
        );

  final int Function(
    AnotherScopedRef ref,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$anotherScopedHash();

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
  AnotherScopedProvider $copyWithCreate(
    int Function(
      AnotherScopedRef ref,
    ) create,
  ) {
    return AnotherScopedProvider._(create: create);
  }

  @override
  int create(AnotherScopedRef ref) {
    final _$cb = _createCb ?? anotherScoped;
    return _$cb(ref);
  }
}

String _$anotherScopedHash() => r'edf3ccffb7c3ce1b1e4ffdd4009aeed4fa38c3f8';

typedef AnotherNonEmptyScopedRef = Ref<int>;

@ProviderFor(anotherNonEmptyScoped)
const anotherNonEmptyScopedProvider = AnotherNonEmptyScopedProvider._();

final class AnotherNonEmptyScopedProvider extends $FunctionalProvider<int, int>
    with $Provider<int, AnotherNonEmptyScopedRef> {
  const AnotherNonEmptyScopedProvider._(
      {int Function(
        AnotherNonEmptyScopedRef ref,
      )? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          retry: null,
          name: r'anotherNonEmptyScopedProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[anotherScopedProvider],
          allTransitiveDependencies: const <ProviderOrFamily>[
            AnotherNonEmptyScopedProvider.$allTransitiveDependencies0,
          ],
        );

  static const $allTransitiveDependencies0 = anotherScopedProvider;

  final int Function(
    AnotherNonEmptyScopedRef ref,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$anotherNonEmptyScopedHash();

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
  AnotherNonEmptyScopedProvider $copyWithCreate(
    int Function(
      AnotherNonEmptyScopedRef ref,
    ) create,
  ) {
    return AnotherNonEmptyScopedProvider._(create: create);
  }

  @override
  int create(AnotherNonEmptyScopedRef ref) {
    final _$cb = _createCb ?? anotherNonEmptyScoped;
    return _$cb(ref);
  }
}

String _$anotherNonEmptyScopedHash() =>
    r'56da5331e55d74e8e10ff710d20618f217394a69';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
