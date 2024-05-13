class InputValidator {
  static String? phone(value) {
    if (value!.isEmpty) {
      return "يجب ادخال رقم الجوال";
    } else {
      return null;
    }
  }
  static String? city(value) {
    if (value!.isEmpty) {
      return "يجب اختيار اسم المدينه";
    } else {
      return null;
    }
  }
  static String? userName(String? value) {
    if (value!.isEmpty) {
      return "يجب ادخال اسم المستخدم";
    } else if (value.length<2){
      return "يجب ان يكون الاسم حرفين على الاقل";
    }
    else {
      return null;
    }
  }

  static String? password(value) {
    if (value!.isEmpty) {
      return "يجب ادخال كلمة المرور";
    } else if (value.length < 7) {
      return "يجب ان تكون كلمة المرور سبع احرف على الاقل";
    } else {
      return null;
    }
  }

  static String? passwordForRegister(password,confirmPassword) {
    if (password!.isEmpty) {
      return "يجب ادخال كلمة المرور";
    } else if (password.length < 7) {
      return "يجب ان تكون كلمة المرور سبع احرف على الاقل";
    } else if (password != confirmPassword) {
      return "";
    } else {
      return null;
    }
  }

  static String? confirmPasswordForRegister(confirmPassword,password) {
    if (confirmPassword!.isEmpty) {
      return "يجب تأكيد كلمة المرور";
    } else if (confirmPassword != password) {
      return "كلمتا المرور غير متطابقه";
    } else {
      return null;
    }
  }
}
