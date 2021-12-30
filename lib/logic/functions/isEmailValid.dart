// ignore_for_file: file_names, unnecessary_null_comparison, unnecessary_new, curly_braces_in_flow_control_structures

String? isEmailValid(String? email) {
  if (email == null) return "Email required";
  if (email != null && email.isEmpty) {
    return "Email required";
  } else {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern as String);
    if (regex.hasMatch(email)) {
      return null;
    } else
      return "Enter a Valid email";
  }
}
