// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get register => 'تسجيل';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get resetPassword => 'إعادة تعيين كلمة المرور';

  @override
  String get sendResetLink => 'إرسال رابط إعادة التعيين';

  @override
  String get backToLogin => 'العودة إلى تسجيل الدخول';

  @override
  String get createAccount => 'إنشاء حساب جديد';

  @override
  String get alreadyHaveAccount => 'هل لديك حساب بالفعل؟ تسجيل الدخول';

  @override
  String get loginToAccount => 'تسجيل الدخول إلى حسابك';

  @override
  String get enterEmail => 'أدخل بريدك الإلكتروني';

  @override
  String get enterPassword => 'أدخل كلمة المرور';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟';

  @override
  String get or => 'أو';

  @override
  String get loginWithGoogle => 'تسجيل الدخول باستخدام جوجل';

  @override
  String get createAccountTitle => 'إنشاء حساب';

  @override
  String get enterName => 'أدخل اسمك';

  @override
  String get invalidName => 'الاسم غير صحيح';

  @override
  String get invalidEmail => 'البريد الإلكتروني غير صحيح';

  @override
  String get invalidEmailAddress => 'عنوان البريد الإلكتروني غير صحيح';

  @override
  String get invalidPassword => 'كلمة المرور غير صحيحة';

  @override
  String get confirmYourPassword => 'أكد كلمة المرور';

  @override
  String get pleaseConfirmPassword => 'يرجى تأكيد كلمة المرور';

  @override
  String get passwordsDoNotMatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get signUpWithGoogle => 'التسجيل باستخدام جوجل';

  @override
  String get registrationFailed => 'فشل التسجيل';

  @override
  String get forgetPassword => 'نسيت كلمة المرور';

  @override
  String get passwordResetSent =>
      'تم إرسال رسالة إعادة تعيين كلمة المرور. تحقق من بريدك الإلكتروني.';

  @override
  String errorPrefix(Object error) {
    return 'خطأ: $error';
  }

  @override
  String get searchForEvent => 'ابحث عن فعالية';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get language => 'اللغة';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get welcomeBack => 'مرحبًا بعودتك ✨';

  @override
  String get guest => 'زائر';

  @override
  String get all => 'الكل';

  @override
  String get addEvent => 'إضافة فعالية';

  @override
  String get title => 'العنوان';

  @override
  String get eventTitle => 'عنوان الفعالية';

  @override
  String get pleaseEnterEventTitle => 'يرجى إدخال عنوان الفعالية';

  @override
  String get description => 'الوصف';

  @override
  String get eventDescription => 'وصف الفعالية';

  @override
  String get pleaseEnterEventDescription => 'يرجى إدخال وصف الفعالية';

  @override
  String get eventDate => 'تاريخ الفعالية';

  @override
  String get chooseDate => 'اختر التاريخ';

  @override
  String get eventTime => 'وقت الفعالية';

  @override
  String get chooseTime => 'اختر الوقت';
}
