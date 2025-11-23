import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokki/shoppingitem/shoppingitem_list_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://enhamqfbeqnlejidxrws.supabase.co', //
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVuaGFtcWZiZXFubGVqaWR4cndzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM5Mjg5NzQsImV4cCI6MjA3OTUwNDk3NH0.N8vlWiTRzoS77AfCCXxA0fiweyBp7S6FaBoA_kkIUTw',
  );

  runApp(ProviderScope(child: MaterialApp(home: ShoppingitemListPage())));
}
