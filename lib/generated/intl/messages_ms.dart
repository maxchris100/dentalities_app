// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ms locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ms';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "login_emailInput_label": MessageLookupByLibrary.simpleMessage("Emel"),
    "login_emailInput_placeholder": MessageLookupByLibrary.simpleMessage(
      "Contoh: contoh@gmail_com",
    ),
    "login_phoneInput_label": MessageLookupByLibrary.simpleMessage(
      "Nombor Telefon (WhatsApp)",
    ),
    "login_phoneInput_placeholder": MessageLookupByLibrary.simpleMessage(
      "Masukkan Nombor Telefon",
    ),
    "login_submit": MessageLookupByLibrary.simpleMessage("Hantar OTP"),
    "login_title": MessageLookupByLibrary.simpleMessage(
      "Masukkan maklumat pemegang polisi untuk menerima OTP_",
    ),
    "otpVerification_resend": MessageLookupByLibrary.simpleMessage(
      "Hantar Semula Kod",
    ),
    "otpVerification_title": MessageLookupByLibrary.simpleMessage(
      "Periksa emel atau WhatsApp anda untuk OTP",
    ),
  };
}
