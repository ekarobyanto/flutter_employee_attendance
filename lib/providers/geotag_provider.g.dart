// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geotag_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$geotaggingHash() => r'92dd272365fb2daccf582b285f96e1bdf1a80fa2';

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

/// See also [geotagging].
@ProviderFor(geotagging)
const geotaggingProvider = GeotaggingFamily();

/// See also [geotagging].
class GeotaggingFamily extends Family<AsyncValue<Placemark>> {
  /// See also [geotagging].
  const GeotaggingFamily();

  /// See also [geotagging].
  GeotaggingProvider call(
    LatLng latlng,
  ) {
    return GeotaggingProvider(
      latlng,
    );
  }

  @override
  GeotaggingProvider getProviderOverride(
    covariant GeotaggingProvider provider,
  ) {
    return call(
      provider.latlng,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'geotaggingProvider';
}

/// See also [geotagging].
class GeotaggingProvider extends AutoDisposeFutureProvider<Placemark> {
  /// See also [geotagging].
  GeotaggingProvider(
    LatLng latlng,
  ) : this._internal(
          (ref) => geotagging(
            ref as GeotaggingRef,
            latlng,
          ),
          from: geotaggingProvider,
          name: r'geotaggingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$geotaggingHash,
          dependencies: GeotaggingFamily._dependencies,
          allTransitiveDependencies:
              GeotaggingFamily._allTransitiveDependencies,
          latlng: latlng,
        );

  GeotaggingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.latlng,
  }) : super.internal();

  final LatLng latlng;

  @override
  Override overrideWith(
    FutureOr<Placemark> Function(GeotaggingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GeotaggingProvider._internal(
        (ref) => create(ref as GeotaggingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        latlng: latlng,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Placemark> createElement() {
    return _GeotaggingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GeotaggingProvider && other.latlng == latlng;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, latlng.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GeotaggingRef on AutoDisposeFutureProviderRef<Placemark> {
  /// The parameter `latlng` of this provider.
  LatLng get latlng;
}

class _GeotaggingProviderElement
    extends AutoDisposeFutureProviderElement<Placemark> with GeotaggingRef {
  _GeotaggingProviderElement(super.provider);

  @override
  LatLng get latlng => (origin as GeotaggingProvider).latlng;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
