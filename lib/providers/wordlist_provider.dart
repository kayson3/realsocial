import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/wordlist_controller.dart';
import '../providers/supabase_provider.dart';

final wordListProvider =
    StateNotifierProvider<WordListNotifier, List<String>>((ref) {
  final supabase = ref.watch(supabaseProvider);
  return WordListNotifier(supabase);
});
