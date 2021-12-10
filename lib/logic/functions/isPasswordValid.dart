// ignore_for_file: file_names

String? isPasswordValid(String? password) {
  if (password != null && password.isEmpty) {
    return "Required Password";
  } else {
    if (password!.length >= 8) {
      return null;
    } else {
      return "Password is at least 8 characters";
    }
  }
}