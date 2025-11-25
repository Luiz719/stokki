import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stokki/shoppingitem/shoppingitem.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:stokki/supabase_provider.dart';
import 'package:stokki/shoppinglist/shoppinglist.dart';

part 'shoppinglist_repository.g.dart';

class ShoppinglistRepository {
  final SupabaseClient _supabase;

  ShoppinglistRepository(this._supabase);

  Future<Shoppinglist?> findById(int id) async {
    final results = await _supabase.from('ShoppingList').select().eq('id', id);
    if (results.isEmpty) {
      return Future.value(null);
    }
    return Shoppinglist.fromDocument(results.first);
  }

  Future<List<Shoppinglist>> find() async {
    final results = await _supabase.from('ShoppingList').select().order('created_at');
    return results.map((doc) => Shoppinglist.fromDocument(doc)).toList();
  }

  Future<Shoppinglist> insert(Shoppinglist shoppinglist) async {
    final shoppinglistData = shoppinglist.toJson()..remove('id');
    final results = await _supabase.from('ShoppingList').insert(shoppinglistData).select();
    return Shoppinglist.fromDocument(results.first);
  }

  Future<void> update(int id, Shoppinglist shoppinglist) async {
    final shoppinglistData = shoppinglist.toJson()..remove('id');
    await _supabase.from('ShoppingList').update(shoppinglistData).eq('id', id);
  }

  Future<void> delete(int id) async {
    await _supabase.from('ShoppingList').delete().eq('id', id);
  }

  Future<Shoppinglist> createList(String name) async {
    final response = await _supabase
        .from('ShoppingList')
        .insert({'title': name})
        .select()
        .single();
    return Shoppinglist.fromJson(response);
  }

  // --- Itens ---
  Future<List<Shoppingitem>> getItems(String listId) async {
    final response = await _supabase
        .from('ShoppingItem')
        .select()
        .eq('listId', listId)
        .order('created_at');
    return (response as List).map((e) => Shoppingitem.fromJson(e)).toList();
  }

  Future<void> addItem(String listId, String name) async {
    await _supabase.from('ShoppingItem').insert({
      'listId': listId,
      'title': name,
      'isPurchased': false,
    });
  }

  Future<void> toggleItem(String itemId, bool currentValue) async {
    await _supabase
        .from('ShoppingItem')
        .update({'isPurchased': !currentValue}).eq('id', itemId);
  }
  
   Future<void> deleteItem(String itemId) async {
    await _supabase.from('ShoppingItem').delete().eq('id', itemId);
  }
}

@riverpod
ShoppinglistRepository shoppinglistRepository(Ref ref) {
  final supabase = ref.watch(supabaseProvider);
  return ShoppinglistRepository(supabase);
}
