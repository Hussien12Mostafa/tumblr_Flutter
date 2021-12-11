// ignore_for_file: file_names

String? checkAge(String? Age) {
  if (Age != null && int.parse(Age) >= 13) {
    return null;
  } else
    return "You're too young for this";
}
