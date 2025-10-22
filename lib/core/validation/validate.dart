

class Validation {
  // Validation cho Email
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email không được để trống';
    }
    
    // Kiểm tra định dạng email bằng RegExp
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value.trim())) {
      return 'Email không đúng định dạng';
    }
    
    // Kiểm tra độ dài tối đa
    if (value.trim().length > 100) {
      return 'Email quá dài';
    }
    
    return null;
  }

  // Validation cho Password
  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Mật khẩu không được để trống';
    }
    
    // Kiểm tra độ dài tối thiểu và tối đa
    if (value.length < 6) {
      return 'Mật khẩu phải có ít nhất 6 ký tự';
    }
    
    if (value.length > 50) {
      return 'Mật khẩu quá dài';
    }
    
    // (Tùy chọn) Yêu cầu ký tự đặc biệt - hiện đang bị comment
    // final hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);
    // if (!hasSpecialChar) {
    //   return 'Mật khẩu phải chứa ít nhất 1 ký tự đặc biệt';
    // }
    
    return null;
  }

  // Validation cho tài khoản (email hoặc username)
  static String? validateAccount(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Tài khoản không được để trống';
    }
    
    // Kiểm tra độ dài tối thiểu và tối đa
    if (value.trim().length < 3) {
      return 'Tài khoản phải có ít nhất 3 ký tự';
    }
    
    if (value.trim().length > 100) {
      return 'Tài khoản quá dài';
    }
    
    return null;
  }

  // Validation toàn bộ form đăng nhập
  static Map<String, String?> validateLoginForm({
    required String email,
    required String password,
  }) {
    return {
      'email': validateEmail(email),
      'password': validatePassword(password),
    };
  }
}