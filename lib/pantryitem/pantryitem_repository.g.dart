// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pantryitem_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pantryitemRepository)
const pantryitemRepositoryProvider = PantryitemRepositoryProvider._();

final class PantryitemRepositoryProvider
    extends
        $FunctionalProvider<
          PantryItemRepository,
          PantryItemRepository,
          PantryItemRepository
        >
    with $Provider<PantryItemRepository> {
  const PantryitemRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pantryitemRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pantryitemRepositoryHash();

  @$internal
  @override
  $ProviderElement<PantryItemRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PantryItemRepository create(Ref ref) {
    return pantryitemRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PantryItemRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PantryItemRepository>(value),
    );
  }
}

String _$pantryitemRepositoryHash() =>
    r'8cb113a56311ea5597b59fd7e4913bb47741648e';
