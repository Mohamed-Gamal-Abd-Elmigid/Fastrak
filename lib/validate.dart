bool validEmail(String email) {
  RegExp regex = new RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (!regex.hasMatch(email))
    return false;
  else
    return true;
}

// bool validateStructure(String value) {
//   String pattern =
//       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
//   RegExp regExp = new RegExp(pattern);
//   return regExp.hasMatch(value);
// }
//
// bool validPass(String password) {
//   RegExp pas = new RegExp(
//       r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");
//   if (pas.hasMatch(password))
//     return false;
//   else
//     return true;
// }
