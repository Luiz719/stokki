// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pantryitem_edit_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PantryItemEditViewModel)
const pantryItemEditViewModelProvider = PantryItemEditViewModelFamily._();

final class PantryItemEditViewModelProvider
    extends $AsyncNotifierProvider<PantryItemEditViewModel, PantryItem> {
  const PantryItemEditViewModelProvider._({
    required PantryItemEditViewModelFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'pantryItemEditViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pantryItemEditViewModelHash();

  @override
  String toString() {
    return r'pantryItemEditViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PantryItemEditViewModel create() => PantryItemEditViewModel();

  @override
  bool operator ==(Object other) {
    return other is PantryItemEditViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pantryItemEditViewModelHash() =>
    r'2b4cb3250bd2e1771d4a922b24f0a6d8abb60664';

final class PantryItemEditViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          PantryItemEditViewModel,
          AsyncValue<PantryItem>,
          PantryItem,
          FutureOr<PantryItem>,
          int?
        > {
  const PantryItemEditViewModelFamily._()
    : super(
        retry: null,
        name: r'pantryItemEditViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PantryItemEditViewModelProvider call(int? pantryitemId) =>
      PantryItemEditViewModelProvider._(argument: pantryitemId, from: this);

  @override
  String toString() => r'pantryItemEditViewModelProvider';
}

abstract class _$PantryItemEditViewModel extends $AsyncNotifier<PantryItem> {
  late final _$args = ref.$arg as int?;
  int? get pantryitemId => _$args;

  FutureOr<PantryItem> build(int? pantryitemId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<PantryItem>, PantryItem>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PantryItem>, PantryItem>,
              AsyncValue<PantryItem>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
