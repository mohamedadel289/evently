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
  String get forgotPassword => 'نسيت كلمة المرور？';

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

  @override
  String get personalizeExperience => 'خصص تجربتك';

  @override
  String get chooseThemeLanguage =>
      'اختر المظهر واللغة المفضلين لديك\nللبدء بتجربة مريحة ومخصصة\nتناسب أسلوبك.';

  @override
  String get theme => 'المظهر';

  @override
  String get english => 'الإنجليزية';

  @override
  String get arabic => 'العربية';

  @override
  String get letsStart => 'لنبدأ';

  @override
  String get skip => 'تخطي';

  @override
  String get next => 'التالي';

  @override
  String get home => 'الرئيسية';

  @override
  String get favorites => 'المفضلة';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get eventCreatedSuccessfully => 'تم إنشاء الفعالية بنجاح';

  @override
  String get failedToCreateEvent => 'فشل إنشاء الفعالية';

  @override
  String get somethingWentWrong => 'حدث خطأ ما';

  @override
  String get loginFailed => 'فشل تسجيل الدخول';

  @override
  String get googleSignInFailed => 'فشل تسجيل الدخول باستخدام جوجل';

  @override
  String get sport => 'رياضة';

  @override
  String get birthday => 'عيد ميلاد';

  @override
  String get updateEvent => 'تحديث الفعالية';

  @override
  String get editEvent => 'تعديل الفعالية';

  @override
  String get meeting => 'اجتماع';

  @override
  String get eventDetails => 'تفاصيل الفعالية';

  @override
  String get findEventsThatInspireYou => 'اكتشف فعاليات تلهمك';

  @override
  String get findEventsDescription =>
      'انغمس في عالم من الفعاليات المصممة لتناسب اهتماماتك الفريدة. سواء كنت تحب الموسيقى الحية أو ورش الفن أو التواصل المهني أو اكتشاف تجارب جديدة، لدينا ما يناسب الجميع. ستساعدك توصياتنا المختارة على الاستكشاف والتواصل والاستفادة من كل فرصة من حولك.';

  @override
  String get effortlessEventPlanning => 'خطط للفعاليات بسهولة';

  @override
  String get effortlessEventPlanningDescription =>
      'تخلص من عناء تنظيم الفعاليات باستخدام أدوات التخطيط المتكاملة. بدءًا من إرسال الدعوات وإدارة تأكيدات الحضور وحتى جدولة التذكيرات وتنسيق التفاصيل، نحن نهتم بكل شيء. خطط بسهولة وركز على ما يهم: إنشاء تجربة لا تُنسى لك ولضيوفك.';

  @override
  String get connectWithFriends => 'تواصل مع أصدقائك وشارك اللحظات';

  @override
  String get connectWithFriendsDescription =>
      'اجعل كل فعالية لا تُنسى من خلال مشاركة التجربة مع الآخرين. يتيح لك تطبيقنا دعوة أصدقائك وإبقاء الجميع على اطلاع والاحتفال باللحظات معًا. التقط الحماس وشاركه مع شبكتك لتستعيد أجمل الذكريات.';
}
