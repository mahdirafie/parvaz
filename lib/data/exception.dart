
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

class LoginWrongInfo implements Exception{
  final String message = 'اطلاعات وارد شده صحیح نمی باشد';
}

class SignUpUserAlreadyExistsException implements Exception {
  final String message = 'کاربر در حال حاضر وجود دارد! لطفا وارد شوید.';
}

class SignUpWrongInfo implements Exception{
  final String message = 'اطلاعات وارد شده صحیح نمی باشد';
}

class GetAllStudentNotFound implements Exception{
  final String message = 'داده ای یافت نشد';
}

class GetAllStudentServer implements Exception{
  final String message = 'سرور مشکل دارد';
}

class ProfileUserNotFound implements Exception {
  final String message = 'کاربر یافت نشد';
}

class ProfileBadRequest implements Exception{
  final String message = 'درخواست شما مشکل دارد';
}

class NotFound implements Exception{
  final String message = 'یافت نشد';
}


class CooperationRequestAlreadyMadeException implements Exception {
  final String message = 'دعوت به همکاری قبلا داده شده است!';
}

class SaveForCooperationRequestAlreadyMadeException implements Exception {
  final String message = 'قبلا ذخیره شده است!';
}