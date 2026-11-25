// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get sendResetLink => 'Send Reset Link';

  @override
  String get backToLogin => 'Back to Login';

  @override
  String get createAccount => 'Create Account';

  @override
  String get alreadyHaveAccount => 'Already have an account? Login';

  @override
  String get loginToAccount => 'Login to your account';

  @override
  String get enterEmail => 'Enter your email';

  @override
  String get enterPassword => 'Enter your password';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get or => 'Or';

  @override
  String get loginWithGoogle => 'Login with Google';

  @override
  String get createAccountTitle => 'Create an account';

  @override
  String get enterName => 'Enter your name';

  @override
  String get invalidName => 'Invalid name';

  @override
  String get invalidEmail => 'Invalid email';

  @override
  String get invalidEmailAddress => 'Invalid email address';

  @override
  String get invalidPassword => 'Invalid password';

  @override
  String get confirmYourPassword => 'Confirm your password';

  @override
  String get pleaseConfirmPassword => 'Please confirm your password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get signUpWithGoogle => 'Sign Up with Google';

  @override
  String get registrationFailed => 'Registration failed';

  @override
  String get forgetPassword => 'Forget Password';

  @override
  String get passwordResetSent =>
      'Password reset email sent. Please check your inbox.';

  @override
  String errorPrefix(Object error) {
    return 'Error: $error';
  }

  @override
  String get searchForEvent => 'Search for event';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get language => 'Language';

  @override
  String get logout => 'Logout';

  @override
  String get welcomeBack => 'Welcome Back ✨';

  @override
  String get guest => 'Guest';

  @override
  String get all => 'All';

  @override
  String get addEvent => 'Add Event';

  @override
  String get title => 'Title';

  @override
  String get eventTitle => 'Event Title';

  @override
  String get pleaseEnterEventTitle => 'Please enter event title';

  @override
  String get description => 'Description';

  @override
  String get eventDescription => 'Event Description';

  @override
  String get pleaseEnterEventDescription => 'Please enter event description';

  @override
  String get eventDate => 'Event Date';

  @override
  String get chooseDate => 'Choose date';

  @override
  String get eventTime => 'Event Time';

  @override
  String get chooseTime => 'Choose time';
}
