// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pantryitem_list_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PantryItemListViewModel)
const pantryItemListViewModelProvider = PantryItemListViewModelProvider._();

final class PantryItemListViewModelProvider
    extends $AsyncNotifierProvider<PantryItemListViewModel, List<PantryItem>> {
  const PantryItemListViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pantryItemListViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pantryItemListViewModelHash();

  @$internal
  @override
  PantryItemListViewModel create() => PantryItemListViewModel();
}

String _$pantryItemListViewModelHash() =>
    r'4981eefec7059bb41ae3cbb38e6628c4b2378db6';

abstract class _$PantryItemListViewModel
    extends $AsyncNotifier<List<PantryItem>> {
  FutureOr<List<PantryItem>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<PantryItem>>, List<PantryItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<PantryItem>>, List<PantryItem>>,
              AsyncValue<List<PantryItem>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
