// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoppinglist_edit_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ShoppinglistEditViewModel)
const shoppinglistEditViewModelProvider = ShoppinglistEditViewModelFamily._();

final class ShoppinglistEditViewModelProvider
    extends $AsyncNotifierProvider<ShoppinglistEditViewModel, Shoppinglist> {
  const ShoppinglistEditViewModelProvider._({
    required ShoppinglistEditViewModelFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'shoppinglistEditViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$shoppinglistEditViewModelHash();

  @override
  String toString() {
    return r'shoppinglistEditViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ShoppinglistEditViewModel create() => ShoppinglistEditViewModel();

  @override
  bool operator ==(Object other) {
    return other is ShoppinglistEditViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$shoppinglistEditViewModelHash() =>
    r'39e34072cadec5a64117c028c70b756e6e051c0b';

final class ShoppinglistEditViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ShoppinglistEditViewModel,
          AsyncValue<Shoppinglist>,
          Shoppinglist,
          FutureOr<Shoppinglist>,
          int?
        > {
  const ShoppinglistEditViewModelFamily._()
    : super(
        retry: null,
        name: r'shoppinglistEditViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ShoppinglistEditViewModelProvider call(int? shoppinglistId) =>
      ShoppinglistEditViewModelProvider._(argument: shoppinglistId, from: this);

  @override
  String toString() => r'shoppinglistEditViewModelProvider';
}

abstract class _$ShoppinglistEditViewModel
    extends $AsyncNotifier<Shoppinglist> {
  late final _$args = ref.$arg as int?;
  int? get shoppinglistId => _$args;

  FutureOr<Shoppinglist> build(int? shoppinglistId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<Shoppinglist>, Shoppinglist>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Shoppinglist>, Shoppinglist>,
              AsyncValue<Shoppinglist>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
