
class AppException implements Exception {
  final String message;

  AppException({this.message = 'خطای نامشخص'});
}

class LoginUserNotFoundException implements Exception {
  final String message =
      "کاربر وارد شده وجود ندارد! در صورت نداشتن حساب ثبت نام کنید";
}

class LoginWrongPasswordException implements Exception {
  final String message = 'رمز عبور وارد شده اشتباه است!';
}

class SignUpUserAlreadyExistsException implements Exception {
  final String message = 'کاربر در حال حاضر وجود دارد! لطفا وارد شوید.';
}
