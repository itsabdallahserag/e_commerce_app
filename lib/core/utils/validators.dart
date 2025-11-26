class Validators {
  Validators._(); //todo: to prevent create object from this class
  static String? validateEmail (String? val){
    RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if(val == null || val.trim().isEmpty){
      return 'This Field is Required' ;
    }else if(emailRegExp.hasMatch(val) == false){
      return 'Enter Valid Email';
    }else{
      return null ;
    }
  }
  static String? validatePassword (String? val){
    RegExp passwordRegExp = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$");
    if(val == null || val.trim().isEmpty){
      return 'Please enter password' ;
    }else if(val.length < 8 || passwordRegExp.hasMatch(val) == false){
      return 'Enter valid password';
    }else{
      return null ;
    }
  }
  static String? validateConfirmPassword (String? val,String? password){
    if(val == null || val.trim().isEmpty){
      return 'This Field is Required' ;
    }else if(val != password){
      return 'passwords not match';
    }else{
      return null ;
    }
  }
  static String? validateUserName (String? val){
    RegExp userNameRegExp = RegExp(r"^\s*([A-Za-z]{3,}([.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    if(val == null || val.trim().isEmpty){
      return 'This Field is Required' ;
    }else if(userNameRegExp.hasMatch(val) == false){
      return 'Enter valid UserName';
    }else{
      return null ;
    }
  }
  static String? validateFullName (String? val){
    if(val == null || val.trim().isEmpty){
      return 'This Field is Required' ;
    }else{
      return null ;
    }
  }
  static String? validatePhoneNumber (String? val){
    if(val == null || val.trim().isEmpty){
      return 'This Field is Required' ;
    }else if(val.trim().length < 11){
      return 'Phone Number must be 11 digits';
    }else{
      return null ;
    }
  }
}