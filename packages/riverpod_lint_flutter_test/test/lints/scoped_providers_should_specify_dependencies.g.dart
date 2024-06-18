// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scoped_providers_should_specify_dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(UnimplementedScoped)
const unimplementedScopedProvider = UnimplementedScopedProvider._();

final class UnimplementedScopedProvider
    extends $NotifierProvider<UnimplementedScoped, int> {
  const UnimplementedScopedProvider._(
      {super.runNotifierBuildOverride, UnimplementedScoped Function()? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          retry: null,
          name: r'unimplementedScopedProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[],
          allTransitiveDependencies: const <ProviderOrFamily>[],
        );

  final UnimplementedScoped Function()? _createCb;

  @override
  String debugGetCreateSourceHash() => _$unimplementedScopedHash();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<int>(value),
    );
  }

  @$internal
  @override
  UnimplementedScoped create() => _createCb?.call() ?? UnimplementedScoped();

  @$internal
  @override
  UnimplementedScopedProvider $copyWithCreate(
    UnimplementedScoped Function() create,
  ) {
    return UnimplementedScopedProvider._(create: create);
  }

  @$internal
  @override
  UnimplementedScopedProvider $copyWithBuild(
    int Function(
      Ref<int>,
      UnimplementedScoped,
    ) build,
  ) {
    return UnimplementedScopedProvider._(runNotifierBuildOverride: build);
  }

  @$internal
  @override
  $NotifierProviderElement<UnimplementedScoped, int> $createElement(
          $ProviderPointer pointer) =>
      $NotifierProviderElement(this, pointer);
}

String _$unimplementedScopedHash() =>
    r'0511a23bd69f21f42fa4f20a9078f6a200a073cb';

abstract class _$UnimplementedScoped extends $Notifier<int> {
  int build() => throw MissingScopeException(ref);
  @$internal
  @override
  int runBuild() => build();
}

typedef ScopedRef = Ref<int>;

@ProviderFor(scoped)
const scopedProvider = ScopedProvider._();

final class ScopedProvider extends $FunctionalProvider<int, int>
    with $Provider<int, ScopedRef> {
  const ScopedProvider._(
      {int Function(
        ScopedRef ref,
      )? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          retry: null,
          name: r'scopedProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[],
          allTransitiveDependencies: const <ProviderOrFamily>[],
        );

  final int Function(
    ScopedRef ref,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$scopedHash();

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
  ScopedProvider $copyWithCreate(
    int Function(
      ScopedRef ref,
    ) create,
  ) {
    return ScopedProvider._(create: create);
  }

  @override
  int create(ScopedRef ref) {
    final _$cb = _createCb ?? scoped;
    return _$cb(ref);
  }
}

String _$scopedHash() => r'bbf25968b1186d2dd63d10545364453712d491cf';

typedef RootRef = Ref<int>;

@ProviderFor(root)
const rootProvider = RootProvider._();

final class RootProvider extends $FunctionalProvider<int, int>
    with $Provider<int, RootRef> {
  const RootProvider._(
      {int Function(
        RootRef ref,
      )? create})
      : _createCb = create,
        super(
          from: null,
          argument: null,
          retry: null,
          name: r'rootProvider',
          isAutoDispose: true,
          dependencies: null,
          allTransitiveDependencies: null,
        );

  final int Function(
    RootRef ref,
  )? _createCb;

  @override
  String debugGetCreateSourceHash() => _$rootHash();

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
  RootProvider $copyWithCreate(
    int Function(
      RootRef ref,
    ) create,
  ) {
    return RootProvider._(create: create);
  }

  @override
  int create(RootRef ref) {
    final _$cb = _createCb ?? root;
    return _$cb(ref);
  }
}

String _$rootHash() => r'1cd85d73316aad02169ff0f5e7af5cf1423410ff';

// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use_from_same_package, unreachable_from_main, invalid_use_of_internal_member
