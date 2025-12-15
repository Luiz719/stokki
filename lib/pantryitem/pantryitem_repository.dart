import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:stokki/supabase_provider.dart';
import 'package:stokki/pantryitem/pantryitem.dart';

part 'pantryitem_repository.g.dart';

class PantryItemRepository {
  final SupabaseClient _supabase;

  PantryItemRepository(this._supabase);

  Future<PantryItem?> findById(int id) async {
    final results = await _supabase.from('PantryItem').select().eq('id', id);
    if (results.isEmpty) {
      return Future.value(null);
    }
    return PantryItem.fromDocument(results.first);
  }

  Future<List<PantryItem>> find() async {
    final results = await _supabase.from('PantryItem').select().order('created_at');
    return results.map((doc) => PantryItem.fromDocument(doc)).toList();
  }

  Future<PantryItem> insert(PantryItem pantryitem) async {
    final pantryitemData = pantryitem.toJson()..remove('id');
    final results = await _supabase.from('PantryItem').insert(pantryitemData).select();
    return PantryItem.fromDocument(results.first);
  }

  Future<void> update(int id, PantryItem pantryitem) async {
    final pantryitemData = pantryitem.toJson()..remove('id');
    await _supabase.from('PantryItem').update(pantryitemData).eq('id', id);
  }

  Future<void> delete(int id) async {
    await _supabase.from('PantryItem').delete().eq('id', id);
  }
}

@riverpod
PantryItemRepository pantryitemRepository(Ref ref) {
  final supabase = ref.watch(supabaseProvider);
  return PantryItemRepository(supabase);
}
