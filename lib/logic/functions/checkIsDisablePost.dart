  /// check if the html empty or not if empty the post button will be disable if not the post button will be enable
   // ignore_for_file: file_names

   bool isDisAbleFunction(String? s) {
    /// variable to return it
    bool temp = true;

    /// if for empty or null return true
    if (s == null || s == '') {
      temp = true;
    }

    /// else  return flase
    else {
      temp = false;
    }
    return temp;
  }