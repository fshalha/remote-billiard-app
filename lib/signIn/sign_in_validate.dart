import 'package:email_validator/email_validator.dart';


// ignore: non_constant_identifier_names
int validate_sign_in(String username, email,dob, pwd1, pwd2) {

  bool validEmail = validate_email(email);
  bool validUsername = validate_username(username);
  bool validpwd = validate_password(pwd1);
  bool confirmpwd = confirmPwd(pwd1, pwd2);
  bool validDOB = validate_DOB(dob);

  /*
  0 = invalid user name
  1 = invalid email
  2 = invalid date of birth
  3 = invalid pasword
  4 = passwords do not match
  

  */

  if (validEmail && validUsername && validpwd && confirmpwd && validDOB) return 100;

  if(!validUsername) return 0;
  else if(!validEmail) return 1;
  else if (!validDOB) return 2;
  else if(!validpwd) return 3;
  else if(!confirmpwd) return 4;
  

}

bool validate_username(String name){
  if(name == null) return false;
  else return true ;
}

// ignore: non_constant_identifier_names
bool validate_email(String email){
  if (email == null) return false;
  else if(!EmailValidator.validate(email)) return false;
  else if(email != null && EmailValidator.validate(email)) return true;

}
// ignore: non_constant_identifier_names
bool validate_password(String passwd){
  if(passwd == null) return false;
  else if(passwd.length <4) return false;
  else return true ;
}

// ignore: non_constant_identifier_names
// ignore: missing_return
bool confirmPwd(String p1,p2){
  if (p2 == null || p1 == null) return false;
  else if(p2 != p1) return false;
  else if(p2 == p1) return true;

}

// ignore: non_constant_identifier_names
bool validate_DOB(String dob){
  String b = "[0-9]{1,2}" + "-" + "[0-9]{1,2}" + "-" "[0-9]{1,4}" ;
  RegExp regExp = new RegExp(b);
  if (dob == null ) return false;
  else if(regExp.hasMatch(dob)) return true;
  else return false;

}

