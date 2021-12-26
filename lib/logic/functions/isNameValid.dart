// ignore_for_file: file_names




String? isNameValid(String? name) {
  if (name != null && name.isEmpty) {
    return "Enter a name";
  } else {
    return null;
  }
}