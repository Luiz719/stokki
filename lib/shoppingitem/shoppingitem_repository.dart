import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:stokki/supabase_provider.dart';
import 'package:stokki/shoppingitem/shoppingitem.dart';

part 'shoppingitem_repository.g.dart';

class ShoppingitemRepository {
  final SupabaseClient _supabase;

  ShoppingitemRepository(this._supabase);

  Future<Shoppingitem?> findById(int id) async {
    final results = await _supabase.from('ShoppingItem').select().eq('id', id);
    if (results.isEmpty) {
      return Future.value(null);
    }
    return Shoppingitem.fromDocument(results.first);
  }

  Future<List<Shoppingitem>> find() async {
    final results = await _supabase.from('ShoppingItem').select().order('created_at');
    return results.map((doc) => Shoppingitem.fromDocument(doc)).toList();
  }

  Future<Shoppingitem> insert(Shoppingitem shoppingitem) async {
    final shoppingitemData = shoppingitem.toJson()..remove('id');
    final results = await _supabase.from('ShoppingItem').insert(shoppingitemData).select();
    return Shoppingitem.fromDocument(results.first);
  }

  Future<void> update(int id, Shoppingitem shoppingitem) async {
    final shoppingitemData = shoppingitem.toJson()..remove('id');
    await _supabase.from('ShoppingItem').update(shoppingitemData).eq('id', id);
  }

  Future<void> delete(int id) async {
    await _supabase.from('ShoppingItem').delete().eq('id', id);
  }
}

@riverpod
ShoppingitemRepository shoppingitemRepository(Ref ref) {
  final supabase = ref.watch(supabaseProvider);
  return ShoppingitemRepository(supabase);
}
