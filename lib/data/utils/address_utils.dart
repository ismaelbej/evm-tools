const String zeroAddress = "0x0000000000000000000000000000000000000000";
final RegExp validAddress = RegExp(r'^[0-9a-fA-F]+$');

bool isAddress(String input) {
  return validAddress.hasMatch(input);
}
