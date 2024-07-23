// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login Screen`
  String get loginText {
    return Intl.message(
      'Login Screen',
      name: 'loginText',
      desc: '',
      args: [],
    );
  }

  /// `Suggested For You`
  String get suggestedForYou {
    return Intl.message(
      'Suggested For You',
      name: 'suggestedForYou',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message(
      'See All',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Spacial For You`
  String get spacialForYou {
    return Intl.message(
      'Spacial For You',
      name: 'spacialForYou',
      desc: '',
      args: [],
    );
  }

  /// `Shop By Category`
  String get shopByCategory {
    return Intl.message(
      'Shop By Category',
      name: 'shopByCategory',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'passwordsDon\'tMatch' key

  // skipped getter for the 'alreadyHaveAnAccount?' key

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Manage Account`
  String get manageAccount {
    return Intl.message(
      'Manage Account',
      name: 'manageAccount',
      desc: '',
      args: [],
    );
  }

  /// `Profile Info`
  String get profileInfo {
    return Intl.message(
      'Profile Info',
      name: 'profileInfo',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Update Account`
  String get updateAccount {
    return Intl.message(
      'Update Account',
      name: 'updateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Phone`
  String get mobilePhone {
    return Intl.message(
      'Mobile Phone',
      name: 'mobilePhone',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Repeat Password`
  String get repeatPassword {
    return Intl.message(
      'Repeat Password',
      name: 'repeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `Must Be Different`
  String get mustBeDifferent {
    return Intl.message(
      'Must Be Different',
      name: 'mustBeDifferent',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get productDetails {
    return Intl.message(
      'Product Details',
      name: 'productDetails',
      desc: '',
      args: [],
    );
  }

  /// `Category Details`
  String get categoryDetails {
    return Intl.message(
      'Category Details',
      name: 'categoryDetails',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Order Info`
  String get orderInfo {
    return Intl.message(
      'Order Info',
      name: 'orderInfo',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Sub Total`
  String get subTotal {
    return Intl.message(
      'Sub Total',
      name: 'subTotal',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Check Out`
  String get checkout {
    return Intl.message(
      'Check Out',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now`
  String get buyNow {
    return Intl.message(
      'Buy Now',
      name: 'buyNow',
      desc: '',
      args: [],
    );
  }

  /// `Add To Cart`
  String get addToCart {
    return Intl.message(
      'Add To Cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'areYouSuretyYouWantToLogout?' key

  /// `Category Complaint`
  String get categoryComplaint {
    return Intl.message(
      'Category Complaint',
      name: 'categoryComplaint',
      desc: '',
      args: [],
    );
  }

  /// `Write Your Complaint Here`
  String get writeYourComplaintHere {
    return Intl.message(
      'Write Your Complaint Here',
      name: 'writeYourComplaintHere',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout ?`
  String get logoutText {
    return Intl.message(
      'Are you sure you want to logout ?',
      name: 'logoutText',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get oldPassword {
    return Intl.message(
      'Old Password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Password Changed`
  String get passwordChanged {
    return Intl.message(
      'Password Changed',
      name: 'passwordChanged',
      desc: '',
      args: [],
    );
  }

  /// `Password Not Changed`
  String get passwordNotChanged {
    return Intl.message(
      'Password Not Changed',
      name: 'passwordNotChanged',
      desc: '',
      args: [],
    );
  }

  /// `Not Valid Email`
  String get notValidEmail {
    return Intl.message(
      'Not Valid Email',
      name: 'notValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Not Valid Password`
  String get notValidPassword {
    return Intl.message(
      'Not Valid Password',
      name: 'notValidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Not Valid Phone`
  String get notValidPhone {
    return Intl.message(
      'Not Valid Phone',
      name: 'notValidPhone',
      desc: '',
      args: [],
    );
  }

  /// `Not Valid Name`
  String get notValidName {
    return Intl.message(
      'Not Valid Name',
      name: 'notValidName',
      desc: '',
      args: [],
    );
  }

  /// `Not Valid Old Password`
  String get notValidOldPassword {
    return Intl.message(
      'Not Valid Old Password',
      name: 'notValidOldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Not Valid Confirm Password`
  String get notValidConfirmPassword {
    return Intl.message(
      'Not Valid Confirm Password',
      name: 'notValidConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Not Valid New Password`
  String get notValidNewPassword {
    return Intl.message(
      'Not Valid New Password',
      name: 'notValidNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Not Valid`
  String get notValid {
    return Intl.message(
      'Not Valid',
      name: 'notValid',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Complaints`
  String get complaints {
    return Intl.message(
      'Complaints',
      name: 'complaints',
      desc: '',
      args: [],
    );
  }

  /// `FAQs`
  String get fAQs {
    return Intl.message(
      'FAQs',
      name: 'fAQs',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `App Language`
  String get appLanguage {
    return Intl.message(
      'App Language',
      name: 'appLanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get englishLanguage {
    return Intl.message(
      'English',
      name: 'englishLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabicLanguage {
    return Intl.message(
      'Arabic',
      name: 'arabicLanguage',
      desc: '',
      args: [],
    );
  }

  /// `logOut`
  String get logOut {
    return Intl.message(
      'logOut',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Old Password`
  String get pleaseEnterOldPassword {
    return Intl.message(
      'Please Enter Old Password',
      name: 'pleaseEnterOldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter New Password`
  String get pleaseEnterNewPassword {
    return Intl.message(
      'Please Enter New Password',
      name: 'pleaseEnterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Confirm Password`
  String get pleaseEnterConfirmPassword {
    return Intl.message(
      'Please Enter Confirm Password',
      name: 'pleaseEnterConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Name`
  String get pleaseEnterYourName {
    return Intl.message(
      'Please Enter Your Name',
      name: 'pleaseEnterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Phone`
  String get pleaseEnterYourPhone {
    return Intl.message(
      'Please Enter Your Phone',
      name: 'pleaseEnterYourPhone',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Email`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'Please Enter Your Email',
      name: 'pleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Password`
  String get pleaseEnterYourPassword {
    return Intl.message(
      'Please Enter Your Password',
      name: 'pleaseEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email`
  String get invalidEmail {
    return Intl.message(
      'Invalid Email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Password`
  String get invalidPassword {
    return Intl.message(
      'Invalid Password',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Phone`
  String get invalidPhone {
    return Intl.message(
      'Invalid Phone',
      name: 'invalidPhone',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Name`
  String get invalidName {
    return Intl.message(
      'Invalid Name',
      name: 'invalidName',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Old Password`
  String get invalidOldPassword {
    return Intl.message(
      'Invalid Old Password',
      name: 'invalidOldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Confirm Password`
  String get invalidConfirmPassword {
    return Intl.message(
      'Invalid Confirm Password',
      name: 'invalidConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid New Password`
  String get invalidNewPassword {
    return Intl.message(
      'Invalid New Password',
      name: 'invalidNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid`
  String get invalid {
    return Intl.message(
      'Invalid',
      name: 'invalid',
      desc: '',
      args: [],
    );
  }

  /// `Wrong Phone`
  String get wrongPhone {
    return Intl.message(
      'Wrong Phone',
      name: 'wrongPhone',
      desc: '',
      args: [],
    );
  }

  /// `Wrong Password`
  String get wrongPassword {
    return Intl.message(
      'Wrong Password',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Length Must Be Equal 11`
  String get lengthMustBeEqual11 {
    return Intl.message(
      'Length Must Be Equal 11',
      name: 'lengthMustBeEqual11',
      desc: '',
      args: [],
    );
  }

  /// `Repeat Password`
  String get RepeatPassword {
    return Intl.message(
      'Repeat Password',
      name: 'RepeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password Not Match`
  String get passwordNotMatch {
    return Intl.message(
      'Password Not Match',
      name: 'passwordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Password Not Changed Successfully`
  String get passwordNotChangedSuccessfully {
    return Intl.message(
      'Password Not Changed Successfully',
      name: 'passwordNotChangedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Password Changed Successfully`
  String get passwordChangedSuccessfully {
    return Intl.message(
      'Password Changed Successfully',
      name: 'passwordChangedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `I Already Have An Account`
  String get iAlreadyHaveAnAccount {
    return Intl.message(
      'I Already Have An Account',
      name: 'iAlreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register Screen`
  String get registerText {
    return Intl.message(
      'Register Screen',
      name: 'registerText',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email`
  String get enterYourEmail {
    return Intl.message(
      'Enter Your Email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get enterYourPassword {
    return Intl.message(
      'Enter Your Password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Name`
  String get enterYourName {
    return Intl.message(
      'Enter Your Name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Phone`
  String get enterYourPhone {
    return Intl.message(
      'Enter Your Phone',
      name: 'enterYourPhone',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email To Reset Password`
  String get enterYourEmailToResetPassword {
    return Intl.message(
      'Enter Your Email To Reset Password',
      name: 'enterYourEmailToResetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your New Password`
  String get enterYourNewPassword {
    return Intl.message(
      'Enter Your New Password',
      name: 'enterYourNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Confirm Password`
  String get enterYourConfirmPassword {
    return Intl.message(
      'Enter Your Confirm Password',
      name: 'enterYourConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Old Password`
  String get enterYourOldPassword {
    return Intl.message(
      'Enter Your Old Password',
      name: 'enterYourOldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
