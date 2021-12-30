// ignore_for_file: file_names

// String? isPasswordValid(String? password) {
//   if (password != null && password.isEmpty) {
//     return "Required Password";
//   } else {
//     if (password!.length >= 8) {
//       return null;
//     } else {
//       return "Password is at least 8 characters";
//     }
//   }
// }
String? isPasswordCompliant(String? password)
{

  bool isComplient = false;
  bool hasUppercase  = false;
  bool hasDigits = false;
  bool hasLowercase = false;
  bool hasSpecialCharacters = false;
  var character='';
  var i=0;
  print(password);


  if(isPasswordValid(password)!=null){
    return isPasswordValid(password);
  }

  if (password!=null&&!password.isEmpty) {
    // Check if valid special characters are present
    hasSpecialCharacters = password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    while (i < password.length){
      character = password.substring(i,i+1);
      print(character);

      if (isDigit(character , 0)){
        hasDigits=true;
      }else{

        if (character == character.toUpperCase()) {
          hasUppercase=true;
        }
        if (character == character.toLowerCase()){
          hasLowercase=true;
        }
      }
      i++;
    }
  }


  if(hasDigits==false){
    return "Password must contain numbers,special marks and upper and lower caps";
  }
  if(hasUppercase==false){
    return "Password must contain numbers,special marks and upper and lower caps";
  }
  if(hasLowercase==false){
    return "Password must contain numbers,special marks and upper and lower caps";
  }

  isComplient = hasDigits & hasUppercase & hasLowercase & hasSpecialCharacters;
  return null;
}

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


bool isDigit(String s, int idx) =>
    "0".compareTo(s[idx]) <= 0 && "9".compareTo(s[idx]) >= 0;