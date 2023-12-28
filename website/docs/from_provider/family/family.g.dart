// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'family.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$randomHash() => r'517b12aad4df7b31f8872b89af74e7880377b2ea';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [random].
@ProviderFor(random)
const randomProvider = RandomFamily();

/// See also [random].
class RandomFamily extends Family {
  /// See also [random].
  const RandomFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'randomProvider';

  /// See also [random].
  RandomProvider call({
    required int seed,
    required int max,
  }) {
    return RandomProvider(
      seed: seed,
      max: max,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(int Function(RandomRef ref) create) {
    return _$RandomFamilyOverride(this, create);
  }

  @override
  String toString() => 'randomProvider';
}

class _$RandomFamilyOverride implements FamilyOverride {
  _$RandomFamilyOverride(this.from, this.create);

  final int Function(RandomRef ref) create;

  @override
  final RandomFamily from;

  @override
  _RandomProviderElement createElement(
    ProviderContainer container,
    covariant RandomProvider provider,
  ) {
    return provider._copyWith(create).createElement(container);
  }

  @override
  String toString() => 'randomProvider.overrideWith($create)';
}

/// See also [random].
class RandomProvider extends AutoDisposeProvider<int> {
  /// See also [random].
  RandomProvider({
    required int seed,
    required int max,
  }) : this._internal(
          (ref) => random(
            ref as RandomRef,
            seed: seed,
            max: max,
          ),
          from: randomProvider,
          name: r'randomProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$randomHash,
          dependencies: RandomFamily._dependencies,
          allTransitiveDependencies: RandomFamily._allTransitiveDependencies,
          seed: seed,
          max: max,
        );

  RandomProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.seed,
    required this.max,
  }) : super.internal();

  final int seed;
  final int max;

  @override
  Override overrideWith(
    int Function(RandomRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      providerOverride: RandomProvider._internal(
        (ref) => create(ref as RandomRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        seed: seed,
        max: max,
      ),
    );
  }

  @override
  ({
    int seed,
    int max,
  }) get argument {
    return (
      seed: seed,
      max: max,
    );
  }

  @override
  _RandomProviderElement createElement(
    ProviderContainer container,
  ) {
    return _RandomProviderElement(this, container);
  }

  RandomProvider _copyWith(
    int Function(RandomRef ref) create,
  ) {
    return RandomProvider._internal(
      (ref) => create(ref as RandomRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      seed: seed,
      max: max,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RandomProvider && other.seed == seed && other.max == max;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, seed.hashCode);
    hash = _SystemHash.combine(hash, max.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  String toString() => 'randomProvider$argument';
}

mixin RandomRef on AutoDisposeProviderRef<int> {
  /// The parameter `seed` of this provider.
  int get seed;

  /// The parameter `max` of this provider.
  int get max;
}

class _RandomProviderElement extends AutoDisposeProviderElement<int>
    with RandomRef {
  _RandomProviderElement(super.provider, super.container);

  @override
  int get seed => (origin as RandomProvider).seed;
  @override
  int get max => (origin as RandomProvider).max;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
