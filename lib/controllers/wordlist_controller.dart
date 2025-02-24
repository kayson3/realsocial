import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../constants.dart';

class WordListNotifier extends StateNotifier<List<String>> {
  final SupabaseClient supabase;

  WordListNotifier(this.supabase) : super([]) {
    _fetchWords();
  }

  Future<void> _fetchWords() async {
    // Fetch words from the database
    final response = await supabase.from('words').select();
    state = response.map<String>((word) => word['word'] as String).toList();
  }

  Future<void> addWord(String word) async {
    // Update the UI instantly (optimistic update)
    state = [...state, word];

    // ✅ Show toast notification at 5, 12, 17, 21, 25 words
    if ([5, 12, 17, 21, 25].contains(state.length)) {
      Fluttertoast.showToast(
        msg: "You have ${state.length} words!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
      );
    }

    try {
      // Save the word to the database
      await supabase.from('words').insert({'word': word}).then((v) {
        Constants.loggerd("Added Successfully: $v");
      });
    } catch (error) {
      Constants.loggerd("Error adding word: $error");
      // Revert state if insertion fails
      state = state.where((w) => w != word).toList();
    }
  }
}
