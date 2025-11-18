import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fil.dart';
import 'app_localizations_id.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_sg.dart';
import 'app_localizations_th.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fil'),
    Locale('id'),
    Locale('ms'),
    Locale('sg'),
    Locale('th')
  ];

  /// No description provided for @home_myteam.
  ///
  /// In en, this message translates to:
  /// **'My Team'**
  String get home_myteam;

  /// No description provided for @otpVerification_title.
  ///
  /// In en, this message translates to:
  /// **'Check your email or WhatsApp for the OTP'**
  String get otpVerification_title;

  /// No description provided for @otpVerification_resend.
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get otpVerification_resend;

  /// No description provided for @otpVerification_opsModal_nameInput_label.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get otpVerification_opsModal_nameInput_label;

  /// No description provided for @otpVerification_opsModal_nameInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter Full Name'**
  String get otpVerification_opsModal_nameInput_placeholder;

  /// No description provided for @otpVerification_opsModal_phoneInput_label.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get otpVerification_opsModal_phoneInput_label;

  /// No description provided for @otpVerification_opsModal_phoneInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter Phone Number'**
  String get otpVerification_opsModal_phoneInput_placeholder;

  /// No description provided for @otpVerification_opsModal_emailInput_label.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get otpVerification_opsModal_emailInput_label;

  /// No description provided for @otpVerification_opsModal_emailInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Example: Example@gmail.com'**
  String get otpVerification_opsModal_emailInput_placeholder;

  /// No description provided for @otpVerification_opsModal_footer.
  ///
  /// In en, this message translates to:
  /// **'Complete this information for optimal protection, and the Teman team will contact you during operational hours, Monday - Friday (08:00 - 17:00)'**
  String get otpVerification_opsModal_footer;

  /// No description provided for @login_title.
  ///
  /// In en, this message translates to:
  /// **'Enter the policyholder\'s information to receive the OTP.'**
  String get login_title;

  /// No description provided for @login_phoneInput_label.
  ///
  /// In en, this message translates to:
  /// **'Phone Number (WhatsApp)'**
  String get login_phoneInput_label;

  /// No description provided for @login_phoneInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter Phone Number'**
  String get login_phoneInput_placeholder;

  /// No description provided for @login_emailInput_label.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get login_emailInput_label;

  /// No description provided for @login_emailInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Example: example@gmail.com'**
  String get login_emailInput_placeholder;

  /// No description provided for @login_submit.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get login_submit;

  /// No description provided for @chooseClaim_title.
  ///
  /// In en, this message translates to:
  /// **'Your Insurance'**
  String get chooseClaim_title;

  /// No description provided for @chooseClaim_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Select the insurance you want to claim.'**
  String get chooseClaim_subtitle;

  /// No description provided for @chooseClaim_airpaz.
  ///
  /// In en, this message translates to:
  /// **'Airpaz Insurance'**
  String get chooseClaim_airpaz;

  /// No description provided for @chooseClaim_travel.
  ///
  /// In en, this message translates to:
  /// **'Travel Insurance'**
  String get chooseClaim_travel;

  /// No description provided for @chooseClaim_pa.
  ///
  /// In en, this message translates to:
  /// **'Personal Accident Insurance'**
  String get chooseClaim_pa;

  /// No description provided for @chooseClaim_policy.
  ///
  /// In en, this message translates to:
  /// **'Policy Active'**
  String get chooseClaim_policy;

  /// No description provided for @chooseClaim_history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get chooseClaim_history;

  /// No description provided for @chooseClaim_archive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get chooseClaim_archive;

  /// No description provided for @chooseClaim_activeClaim.
  ///
  /// In en, this message translates to:
  /// **'Active Claims'**
  String get chooseClaim_activeClaim;

  /// No description provided for @chooseClaim_title2.
  ///
  /// In en, this message translates to:
  /// **'List Claim'**
  String get chooseClaim_title2;

  /// No description provided for @chooseClaim_subtitle2.
  ///
  /// In en, this message translates to:
  /// **'Watch your Claim Status'**
  String get chooseClaim_subtitle2;

  /// No description provided for @claimSubmission_navTitle.
  ///
  /// In en, this message translates to:
  /// **'Insurance Claim'**
  String get claimSubmission_navTitle;

  /// No description provided for @claimSubmission_airpaz.
  ///
  /// In en, this message translates to:
  /// **'Airpaz Insurance'**
  String get claimSubmission_airpaz;

  /// No description provided for @claimSubmission_travel.
  ///
  /// In en, this message translates to:
  /// **'Travel Insurance'**
  String get claimSubmission_travel;

  /// No description provided for @claimSubmission_pa.
  ///
  /// In en, this message translates to:
  /// **'Personal Accident Insurance'**
  String get claimSubmission_pa;

  /// No description provided for @claimSubmission_driver.
  ///
  /// In en, this message translates to:
  /// **'Driver'**
  String get claimSubmission_driver;

  /// No description provided for @claimSubmission_passenger.
  ///
  /// In en, this message translates to:
  /// **'Passenger'**
  String get claimSubmission_passenger;

  /// No description provided for @claimSubmission_cardPolicyHolder_title.
  ///
  /// In en, this message translates to:
  /// **'Policy Holder Information'**
  String get claimSubmission_cardPolicyHolder_title;

  /// No description provided for @claimSubmission_cardPolicyHolder_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get claimSubmission_cardPolicyHolder_name;

  /// No description provided for @claimSubmission_cardPolicyHolder_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get claimSubmission_cardPolicyHolder_phone;

  /// No description provided for @claimSubmission_cardPolicyHolder_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get claimSubmission_cardPolicyHolder_email;

  /// No description provided for @claimSubmission_cardPolicyHolder_policyNumber.
  ///
  /// In en, this message translates to:
  /// **'Policy No.'**
  String get claimSubmission_cardPolicyHolder_policyNumber;

  /// No description provided for @claimSubmission_accordionReporterInfo_title.
  ///
  /// In en, this message translates to:
  /// **'Reporter Information'**
  String get claimSubmission_accordionReporterInfo_title;

  /// No description provided for @claimSubmission_accordionReporterInfo_isInsuredInput_label.
  ///
  /// In en, this message translates to:
  /// **'Is the reporter the same as the insured?'**
  String get claimSubmission_accordionReporterInfo_isInsuredInput_label;

  /// No description provided for @claimSubmission_accordionReporterInfo_isInsuredInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **''**
  String get claimSubmission_accordionReporterInfo_isInsuredInput_placeholder;

  /// No description provided for @claimSubmission_accordionReporterInfo_nameInput_label.
  ///
  /// In en, this message translates to:
  /// **'Reporter Name'**
  String get claimSubmission_accordionReporterInfo_nameInput_label;

  /// No description provided for @claimSubmission_accordionReporterInfo_nameInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Reporter Name'**
  String get claimSubmission_accordionReporterInfo_nameInput_placeholder;

  /// No description provided for @claimSubmission_accordionReporterInfo_relationshipInput_label.
  ///
  /// In en, this message translates to:
  /// **'Relationship with the insured'**
  String get claimSubmission_accordionReporterInfo_relationshipInput_label;

  /// No description provided for @claimSubmission_accordionReporterInfo_relationshipInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Select relationship'**
  String
      get claimSubmission_accordionReporterInfo_relationshipInput_placeholder;

  /// No description provided for @claimSubmission_accordionReporterInfo_phoneInput_label.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get claimSubmission_accordionReporterInfo_phoneInput_label;

  /// No description provided for @claimSubmission_accordionReporterInfo_phoneInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get claimSubmission_accordionReporterInfo_phoneInput_placeholder;

  /// No description provided for @claimSubmission_accordionInsuredInfo_title.
  ///
  /// In en, this message translates to:
  /// **'Insured Data'**
  String get claimSubmission_accordionInsuredInfo_title;

  /// No description provided for @claimSubmission_accordionInsuredInfo_select.
  ///
  /// In en, this message translates to:
  /// **'Select Insured'**
  String get claimSubmission_accordionInsuredInfo_select;

  /// No description provided for @claimSubmission_accordionInsuredInfo_noPolicy.
  ///
  /// In en, this message translates to:
  /// **'Policy Number'**
  String get claimSubmission_accordionInsuredInfo_noPolicy;

  /// No description provided for @claimSubmission_accordionInsuredInfo_noParticipant.
  ///
  /// In en, this message translates to:
  /// **'Participant Number'**
  String get claimSubmission_accordionInsuredInfo_noParticipant;

  /// No description provided for @claimSubmission_accordionInsuredInfo_fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get claimSubmission_accordionInsuredInfo_fullName;

  /// No description provided for @claimSubmission_accordionInsuredInfo_gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get claimSubmission_accordionInsuredInfo_gender;

  /// No description provided for @claimSubmission_accordionInsuredInfo_countryCode.
  ///
  /// In en, this message translates to:
  /// **'Country Code'**
  String get claimSubmission_accordionInsuredInfo_countryCode;

  /// No description provided for @claimSubmission_accordionInsuredInfo_noPassport.
  ///
  /// In en, this message translates to:
  /// **'Passport Number'**
  String get claimSubmission_accordionInsuredInfo_noPassport;

  /// No description provided for @claimSubmission_accordionInsuredInfo_noID.
  ///
  /// In en, this message translates to:
  /// **'National ID Number'**
  String get claimSubmission_accordionInsuredInfo_noID;

  /// No description provided for @claimSubmission_accordionInsuredInfo_nationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get claimSubmission_accordionInsuredInfo_nationality;

  /// No description provided for @claimSubmission_accordionInsuredInfo_dob.
  ///
  /// In en, this message translates to:
  /// **'Place/Date of Birth'**
  String get claimSubmission_accordionInsuredInfo_dob;

  /// No description provided for @claimSubmission_accordionInsuredInfo_pob.
  ///
  /// In en, this message translates to:
  /// **'Place of Birth'**
  String get claimSubmission_accordionInsuredInfo_pob;

  /// No description provided for @claimSubmission_accordionInsuredInfo_address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get claimSubmission_accordionInsuredInfo_address;

  /// No description provided for @claimSubmission_accordionInsuredInfo_job.
  ///
  /// In en, this message translates to:
  /// **'Occupation'**
  String get claimSubmission_accordionInsuredInfo_job;

  /// No description provided for @claimSubmission_accordionInsuredInfo_dateRelease.
  ///
  /// In en, this message translates to:
  /// **'Date of Issue'**
  String get claimSubmission_accordionInsuredInfo_dateRelease;

  /// No description provided for @claimSubmission_accordionInsuredInfo_dateExpiration.
  ///
  /// In en, this message translates to:
  /// **'Expiration Date'**
  String get claimSubmission_accordionInsuredInfo_dateExpiration;

  /// No description provided for @claimSubmission_accordionPersonalInfo_title.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get claimSubmission_accordionPersonalInfo_title;

  /// No description provided for @claimSubmission_accordionPersonalInfo_phoneInput_label.
  ///
  /// In en, this message translates to:
  /// **'Phone Number (WhatsApp)'**
  String get claimSubmission_accordionPersonalInfo_phoneInput_label;

  /// No description provided for @claimSubmission_accordionPersonalInfo_phoneInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter Phone Number'**
  String get claimSubmission_accordionPersonalInfo_phoneInput_placeholder;

  /// No description provided for @claimSubmission_accordionPersonalInfo_addressInput_label.
  ///
  /// In en, this message translates to:
  /// **'Claim Mailing Address'**
  String get claimSubmission_accordionPersonalInfo_addressInput_label;

  /// No description provided for @claimSubmission_accordionPersonalInfo_addressInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get claimSubmission_accordionPersonalInfo_addressInput_placeholder;

  /// No description provided for @claimSubmission_accordionPersonalInfo_countryInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get claimSubmission_accordionPersonalInfo_countryInput_placeholder;

  /// No description provided for @claimSubmission_accordionPersonalInfo_stateInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'State/Province'**
  String get claimSubmission_accordionPersonalInfo_stateInput_placeholder;

  /// No description provided for @claimSubmission_accordionPersonalInfo_cityInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'City/District'**
  String get claimSubmission_accordionPersonalInfo_cityInput_placeholder;

  /// No description provided for @claimSubmission_accordionPersonalInfo_districtInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Subdistrict'**
  String get claimSubmission_accordionPersonalInfo_districtInput_placeholder;

  /// No description provided for @claimSubmission_accordionPersonalInfo_subdistrictInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Village/Subdivision'**
  String get claimSubmission_accordionPersonalInfo_subdistrictInput_placeholder;

  /// No description provided for @claimSubmission_accordionPersonalInfo_postalCodeInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Postal Code'**
  String get claimSubmission_accordionPersonalInfo_postalCodeInput_placeholder;

  /// No description provided for @claimSubmission_accordionPersonalInfo_street1Input_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Street 1'**
  String get claimSubmission_accordionPersonalInfo_street1Input_placeholder;

  /// No description provided for @claimSubmission_accordionPersonalInfo_street2Input_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Street 2'**
  String get claimSubmission_accordionPersonalInfo_street2Input_placeholder;

  /// No description provided for @claimSubmission_accordionPolicy_title.
  ///
  /// In en, this message translates to:
  /// **'Policy Information of the Insured'**
  String get claimSubmission_accordionPolicy_title;

  /// No description provided for @claimSubmission_accordionPolicy_policyNoInput_label.
  ///
  /// In en, this message translates to:
  /// **'Policy Number (optional)'**
  String get claimSubmission_accordionPolicy_policyNoInput_label;

  /// No description provided for @claimSubmission_accordionPolicy_policyNoInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter Policy Number'**
  String get claimSubmission_accordionPolicy_policyNoInput_placeholder;

  /// No description provided for @claimSubmission_accordionPolicy_policyFileInput_label.
  ///
  /// In en, this message translates to:
  /// **'Upload Policy Document (optional)'**
  String get claimSubmission_accordionPolicy_policyFileInput_label;

  /// No description provided for @claimSubmission_accordionPolicy_policyFileInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Upload File'**
  String get claimSubmission_accordionPolicy_policyFileInput_placeholder;

  /// No description provided for @claimSubmission_accordionAccountInfo_title.
  ///
  /// In en, this message translates to:
  /// **'Bank Account Information'**
  String get claimSubmission_accordionAccountInfo_title;

  /// No description provided for @claimSubmission_accordionAccountInfo_accountName_input.
  ///
  /// In en, this message translates to:
  /// **'Account Holder Name'**
  String get claimSubmission_accordionAccountInfo_accountName_input;

  /// No description provided for @claimSubmission_accordionAccountInfo_accountName_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter name as per the passbook'**
  String get claimSubmission_accordionAccountInfo_accountName_placeholder;

  /// No description provided for @claimSubmission_accordionAccountInfo_accountNameInput_label.
  ///
  /// In en, this message translates to:
  /// **'Account Holder Name'**
  String get claimSubmission_accordionAccountInfo_accountNameInput_label;

  /// No description provided for @claimSubmission_accordionAccountInfo_accountNameInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter name as per the passbook'**
  String get claimSubmission_accordionAccountInfo_accountNameInput_placeholder;

  /// No description provided for @claimSubmission_accordionAccountInfo_bankInput_label.
  ///
  /// In en, this message translates to:
  /// **'Select Bank'**
  String get claimSubmission_accordionAccountInfo_bankInput_label;

  /// No description provided for @claimSubmission_accordionAccountInfo_bankInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Select Bank'**
  String get claimSubmission_accordionAccountInfo_bankInput_placeholder;

  /// No description provided for @claimSubmission_accordionAccountInfo_bankNameInput_label.
  ///
  /// In en, this message translates to:
  /// **'Bank Name'**
  String get claimSubmission_accordionAccountInfo_bankNameInput_label;

  /// No description provided for @claimSubmission_accordionAccountInfo_bankNameInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter Bank Name'**
  String get claimSubmission_accordionAccountInfo_bankNameInput_placeholder;

  /// No description provided for @claimSubmission_accordionAccountInfo_bankBranchInput_label.
  ///
  /// In en, this message translates to:
  /// **'Bank Branch'**
  String get claimSubmission_accordionAccountInfo_bankBranchInput_label;

  /// No description provided for @claimSubmission_accordionAccountInfo_bankBranchInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter Bank Branch'**
  String get claimSubmission_accordionAccountInfo_bankBranchInput_placeholder;

  /// No description provided for @claimSubmission_accordionAccountInfo_accountNumberInput_label.
  ///
  /// In en, this message translates to:
  /// **'Account Number'**
  String get claimSubmission_accordionAccountInfo_accountNumberInput_label;

  /// No description provided for @claimSubmission_accordionAccountInfo_accountNumberInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter Account Number'**
  String
      get claimSubmission_accordionAccountInfo_accountNumberInput_placeholder;

  /// No description provided for @claimSubmission_accordionClaimBenefit_title.
  ///
  /// In en, this message translates to:
  /// **'Claim Type'**
  String get claimSubmission_accordionClaimBenefit_title;

  /// No description provided for @claimSubmission_accordionClaimBenefit_benefitInfo.
  ///
  /// In en, this message translates to:
  /// **'Benefit Information'**
  String get claimSubmission_accordionClaimBenefit_benefitInfo;

  /// No description provided for @claimSubmission_accordionClaimBenefit_serviceTypeInput_label.
  ///
  /// In en, this message translates to:
  /// **'Service Type'**
  String get claimSubmission_accordionClaimBenefit_serviceTypeInput_label;

  /// No description provided for @claimSubmission_accordionClaimBenefit_serviceTypeInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Select service type'**
  String get claimSubmission_accordionClaimBenefit_serviceTypeInput_placeholder;

  /// No description provided for @claimSubmission_accordionClaimBenefit_benefitInput_label.
  ///
  /// In en, this message translates to:
  /// **'Claim Type'**
  String get claimSubmission_accordionClaimBenefit_benefitInput_label;

  /// No description provided for @claimSubmission_accordionClaimBenefit_benefitInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Select claim type'**
  String get claimSubmission_accordionClaimBenefit_benefitInput_placeholder;

  /// No description provided for @claimSubmission_accordionGeneralDoc_title.
  ///
  /// In en, this message translates to:
  /// **'General Documents'**
  String get claimSubmission_accordionGeneralDoc_title;

  /// No description provided for @claimSubmission_accordionSupportingDoc_title.
  ///
  /// In en, this message translates to:
  /// **'Supporting Documents'**
  String get claimSubmission_accordionSupportingDoc_title;

  /// No description provided for @claimSubmission_accordionClaimDetails_title.
  ///
  /// In en, this message translates to:
  /// **'Claim Detail'**
  String get claimSubmission_accordionClaimDetails_title;

  /// No description provided for @claimBenefitUploads_navTitle.
  ///
  /// In en, this message translates to:
  /// **'Claim Insurance'**
  String get claimBenefitUploads_navTitle;

  /// No description provided for @claimBenefitUploads_airpaz.
  ///
  /// In en, this message translates to:
  /// **'Airpaz Claim'**
  String get claimBenefitUploads_airpaz;

  /// No description provided for @claimBenefitUploads_travel.
  ///
  /// In en, this message translates to:
  /// **'Travel Insurance'**
  String get claimBenefitUploads_travel;

  /// No description provided for @claimBenefitUploads_pa.
  ///
  /// In en, this message translates to:
  /// **'Personal Accident Insurance'**
  String get claimBenefitUploads_pa;

  /// No description provided for @claimBenefitUploads_generalDoc.
  ///
  /// In en, this message translates to:
  /// **'General Documents'**
  String get claimBenefitUploads_generalDoc;

  /// No description provided for @claimBenefitUploads_chronologyInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Describe the chronology of events'**
  String get claimBenefitUploads_chronologyInput_placeholder;

  /// No description provided for @claimBenefitUploads_alerts_successSaveDraft.
  ///
  /// In en, this message translates to:
  /// **'Save draft success'**
  String get claimBenefitUploads_alerts_successSaveDraft;

  /// No description provided for @claimBenefitUploads_alerts_failedSaveDraft.
  ///
  /// In en, this message translates to:
  /// **'Save draft failed'**
  String get claimBenefitUploads_alerts_failedSaveDraft;

  /// No description provided for @claimBenefitUploads_changesUnsavedAlert_title.
  ///
  /// In en, this message translates to:
  /// **'You have not completed the file upload process'**
  String get claimBenefitUploads_changesUnsavedAlert_title;

  /// No description provided for @claimBenefitUploads_changesUnsavedAlert_description.
  ///
  /// In en, this message translates to:
  /// **'Save the claim submission as a draft?'**
  String get claimBenefitUploads_changesUnsavedAlert_description;

  /// No description provided for @claimBenefitUploads_changesUnsavedAlert_confirmBack.
  ///
  /// In en, this message translates to:
  /// **'No, go back to home'**
  String get claimBenefitUploads_changesUnsavedAlert_confirmBack;

  /// No description provided for @claimBenefitUploads_changesUnsavedAlert_confirmSave.
  ///
  /// In en, this message translates to:
  /// **'Yes, save as draft'**
  String get claimBenefitUploads_changesUnsavedAlert_confirmSave;

  /// No description provided for @claimPreview_navTitle.
  ///
  /// In en, this message translates to:
  /// **'Claim Insurance'**
  String get claimPreview_navTitle;

  /// No description provided for @claimPreview_airpaz.
  ///
  /// In en, this message translates to:
  /// **'Airpaz Insurance'**
  String get claimPreview_airpaz;

  /// No description provided for @claimPreview_travel.
  ///
  /// In en, this message translates to:
  /// **'Travel Insurance'**
  String get claimPreview_travel;

  /// No description provided for @claimPreview_pa.
  ///
  /// In en, this message translates to:
  /// **'Personal Accident Insurance'**
  String get claimPreview_pa;

  /// No description provided for @claimPreview_cardPolicyHolder_title.
  ///
  /// In en, this message translates to:
  /// **'Policyholder'**
  String get claimPreview_cardPolicyHolder_title;

  /// No description provided for @claimPreview_cardPolicyHolder_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get claimPreview_cardPolicyHolder_name;

  /// No description provided for @claimPreview_cardPolicyHolder_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get claimPreview_cardPolicyHolder_phone;

  /// No description provided for @claimPreview_cardPolicyHolder_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get claimPreview_cardPolicyHolder_email;

  /// No description provided for @claimPreview_cardPolicyHolder_policyNumber.
  ///
  /// In en, this message translates to:
  /// **'Policy No.'**
  String get claimPreview_cardPolicyHolder_policyNumber;

  /// No description provided for @claimPreview_cardInsuredInfo_title.
  ///
  /// In en, this message translates to:
  /// **'Insured Name'**
  String get claimPreview_cardInsuredInfo_title;

  /// No description provided for @claimPreview_cardInsuredInfo_noPolicy.
  ///
  /// In en, this message translates to:
  /// **'Policy No.'**
  String get claimPreview_cardInsuredInfo_noPolicy;

  /// No description provided for @claimPreview_cardInsuredInfo_noParticipant.
  ///
  /// In en, this message translates to:
  /// **'Participant No.'**
  String get claimPreview_cardInsuredInfo_noParticipant;

  /// No description provided for @claimPreview_cardInsuredInfo_fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get claimPreview_cardInsuredInfo_fullName;

  /// No description provided for @claimPreview_cardInsuredInfo_gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get claimPreview_cardInsuredInfo_gender;

  /// No description provided for @claimPreview_cardInsuredInfo_countryCode.
  ///
  /// In en, this message translates to:
  /// **'Country Code'**
  String get claimPreview_cardInsuredInfo_countryCode;

  /// No description provided for @claimPreview_cardInsuredInfo_noPassport.
  ///
  /// In en, this message translates to:
  /// **'Passport Number'**
  String get claimPreview_cardInsuredInfo_noPassport;

  /// No description provided for @claimPreview_cardInsuredInfo_nationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get claimPreview_cardInsuredInfo_nationality;

  /// No description provided for @claimPreview_cardInsuredInfo_dob.
  ///
  /// In en, this message translates to:
  /// **'Place/Date of Birth'**
  String get claimPreview_cardInsuredInfo_dob;

  /// No description provided for @claimPreview_cardInsuredInfo_pob.
  ///
  /// In en, this message translates to:
  /// **'Place of Birth'**
  String get claimPreview_cardInsuredInfo_pob;

  /// No description provided for @claimPreview_cardInsuredInfo_address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get claimPreview_cardInsuredInfo_address;

  /// No description provided for @claimPreview_cardInsuredInfo_job.
  ///
  /// In en, this message translates to:
  /// **'Occupation'**
  String get claimPreview_cardInsuredInfo_job;

  /// No description provided for @claimPreview_cardInsuredInfo_dateRelease.
  ///
  /// In en, this message translates to:
  /// **'Issue Date'**
  String get claimPreview_cardInsuredInfo_dateRelease;

  /// No description provided for @claimPreview_cardInsuredInfo_dateExpiration.
  ///
  /// In en, this message translates to:
  /// **'Expiration Date'**
  String get claimPreview_cardInsuredInfo_dateExpiration;

  /// No description provided for @claimPreview_cardClaimRequested_title.
  ///
  /// In en, this message translates to:
  /// **'Claim Requested'**
  String get claimPreview_cardClaimRequested_title;

  /// No description provided for @claimPreview_cardClaimRequested_checkTnc1.
  ///
  /// In en, this message translates to:
  /// **'I have read, understood, and agree to the'**
  String get claimPreview_cardClaimRequested_checkTnc1;

  /// No description provided for @claimPreview_cardClaimRequested_checkTnc2.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get claimPreview_cardClaimRequested_checkTnc2;

  /// No description provided for @claimPreview_cardClaimRequested_checkTnc3.
  ///
  /// In en, this message translates to:
  /// **'applicable at Teman'**
  String get claimPreview_cardClaimRequested_checkTnc3;

  /// No description provided for @claimSuccess_title.
  ///
  /// In en, this message translates to:
  /// **'Success!'**
  String get claimSuccess_title;

  /// No description provided for @claimSuccess_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your trust in submitting an insurance claim through Teman.'**
  String get claimSuccess_subtitle;

  /// No description provided for @claimSuccess_desc.
  ///
  /// In en, this message translates to:
  /// **'Please check your email to see your claim report'**
  String get claimSuccess_desc;

  /// No description provided for @claimSuccess_backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get claimSuccess_backToHome;

  /// No description provided for @listClaim_title.
  ///
  /// In en, this message translates to:
  /// **'List Claims'**
  String get listClaim_title;

  /// No description provided for @listClaim_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Monitor your claim status'**
  String get listClaim_subtitle;

  /// No description provided for @listClaim_search_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Search name, insurance, or policy number'**
  String get listClaim_search_placeholder;

  /// No description provided for @listClaim_history_title.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get listClaim_history_title;

  /// No description provided for @listClaim_history_empty.
  ///
  /// In en, this message translates to:
  /// **'Currently you have not Claim history yet'**
  String get listClaim_history_empty;

  /// No description provided for @listClaim_history_navigation.
  ///
  /// In en, this message translates to:
  /// **'Claim History'**
  String get listClaim_history_navigation;

  /// No description provided for @listClaim_filterDate_title.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get listClaim_filterDate_title;

  /// No description provided for @listClaim_filterDate_placeholder.
  ///
  /// In en, this message translates to:
  /// **'All Dates'**
  String get listClaim_filterDate_placeholder;

  /// No description provided for @listClaim_filterDate_opt1.
  ///
  /// In en, this message translates to:
  /// **'All Claim Dates'**
  String get listClaim_filterDate_opt1;

  /// No description provided for @listClaim_filterDate_opt2.
  ///
  /// In en, this message translates to:
  /// **'Select Your Own Date'**
  String get listClaim_filterDate_opt2;

  /// No description provided for @listClaim_filterDate_startDate.
  ///
  /// In en, this message translates to:
  /// **'Select Start Date'**
  String get listClaim_filterDate_startDate;

  /// No description provided for @listClaim_filterDate_endDate.
  ///
  /// In en, this message translates to:
  /// **'Select End Date'**
  String get listClaim_filterDate_endDate;

  /// No description provided for @listClaim_filterStatus_title.
  ///
  /// In en, this message translates to:
  /// **'Select Status'**
  String get listClaim_filterStatus_title;

  /// No description provided for @listClaim_filterStatus_placeholder.
  ///
  /// In en, this message translates to:
  /// **'All Status'**
  String get listClaim_filterStatus_placeholder;

  /// No description provided for @listClaim_status_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get listClaim_status_all;

  /// No description provided for @listClaim_status_draft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get listClaim_status_draft;

  /// No description provided for @listClaim_status_allProcessing.
  ///
  /// In en, this message translates to:
  /// **'All ongoing claim processes'**
  String get listClaim_status_allProcessing;

  /// No description provided for @listClaim_status_submitted.
  ///
  /// In en, this message translates to:
  /// **'Submission sent'**
  String get listClaim_status_submitted;

  /// No description provided for @listClaim_status_acknowledged.
  ///
  /// In en, this message translates to:
  /// **'Submission received'**
  String get listClaim_status_acknowledged;

  /// No description provided for @listClaim_status_documentReview.
  ///
  /// In en, this message translates to:
  /// **'Document review'**
  String get listClaim_status_documentReview;

  /// No description provided for @listClaim_status_claimAssessment.
  ///
  /// In en, this message translates to:
  /// **'Claim in process'**
  String get listClaim_status_claimAssessment;

  /// No description provided for @listClaim_status_approved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get listClaim_status_approved;

  /// No description provided for @listClaim_status_paid.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get listClaim_status_paid;

  /// No description provided for @listClaim_status_closed.
  ///
  /// In en, this message translates to:
  /// **'Claim Closed'**
  String get listClaim_status_closed;

  /// No description provided for @listClaim_status_allRejected.
  ///
  /// In en, this message translates to:
  /// **'All rejected claim statuses'**
  String get listClaim_status_allRejected;

  /// No description provided for @listClaim_status_lackOfDocuments.
  ///
  /// In en, this message translates to:
  /// **'Missing Documents'**
  String get listClaim_status_lackOfDocuments;

  /// No description provided for @listClaim_status_rejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get listClaim_status_rejected;

  /// No description provided for @listClaim_idClaim.
  ///
  /// In en, this message translates to:
  /// **'Claim ID'**
  String get listClaim_idClaim;

  /// No description provided for @listClaim_noClaim.
  ///
  /// In en, this message translates to:
  /// **'There are no claims yet.\nCreate a claim from the Create New menu'**
  String get listClaim_noClaim;

  /// No description provided for @claimDetail_see.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get claimDetail_see;

  /// No description provided for @claimDetail_navTitle.
  ///
  /// In en, this message translates to:
  /// **'Claim Detail'**
  String get claimDetail_navTitle;

  /// No description provided for @claimDetail_airpaz.
  ///
  /// In en, this message translates to:
  /// **'Claim Airpaz'**
  String get claimDetail_airpaz;

  /// No description provided for @claimDetail_travel.
  ///
  /// In en, this message translates to:
  /// **'Claim Travel Insurance'**
  String get claimDetail_travel;

  /// No description provided for @claimDetail_pa.
  ///
  /// In en, this message translates to:
  /// **'Claim Personal Accident Insurance'**
  String get claimDetail_pa;

  /// No description provided for @claimDetail_cardJourney_view.
  ///
  /// In en, this message translates to:
  /// **'View Detail'**
  String get claimDetail_cardJourney_view;

  /// No description provided for @claimDetail_cardJourney_claimId.
  ///
  /// In en, this message translates to:
  /// **'Claim ID'**
  String get claimDetail_cardJourney_claimId;

  /// No description provided for @claimDetail_cardJourney_viewDetail.
  ///
  /// In en, this message translates to:
  /// **'Claim Journey'**
  String get claimDetail_cardJourney_viewDetail;

  /// No description provided for @claimDetail_cardJourney_approvedAmount.
  ///
  /// In en, this message translates to:
  /// **'Approved amount'**
  String get claimDetail_cardJourney_approvedAmount;

  /// No description provided for @claimDetail_cardPolicyHolder_title.
  ///
  /// In en, this message translates to:
  /// **'Policyholder Information'**
  String get claimDetail_cardPolicyHolder_title;

  /// No description provided for @claimDetail_cardPolicyHolder_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get claimDetail_cardPolicyHolder_name;

  /// No description provided for @claimDetail_cardPolicyHolder_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get claimDetail_cardPolicyHolder_phone;

  /// No description provided for @claimDetail_cardPolicyHolder_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get claimDetail_cardPolicyHolder_email;

  /// No description provided for @claimDetail_cardPolicyHolder_policyNumber.
  ///
  /// In en, this message translates to:
  /// **'Policy No.'**
  String get claimDetail_cardPolicyHolder_policyNumber;

  /// No description provided for @claimDetail_cardInsuredInfo_title.
  ///
  /// In en, this message translates to:
  /// **'Insured Name'**
  String get claimDetail_cardInsuredInfo_title;

  /// No description provided for @claimDetail_cardInsuredInfo_noPolicy.
  ///
  /// In en, this message translates to:
  /// **'Policy No.'**
  String get claimDetail_cardInsuredInfo_noPolicy;

  /// No description provided for @claimDetail_cardInsuredInfo_noParticipant.
  ///
  /// In en, this message translates to:
  /// **'Participant No.'**
  String get claimDetail_cardInsuredInfo_noParticipant;

  /// No description provided for @claimDetail_cardInsuredInfo_fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get claimDetail_cardInsuredInfo_fullName;

  /// No description provided for @claimDetail_cardInsuredInfo_gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get claimDetail_cardInsuredInfo_gender;

  /// No description provided for @claimDetail_cardInsuredInfo_countryCode.
  ///
  /// In en, this message translates to:
  /// **'Country Code'**
  String get claimDetail_cardInsuredInfo_countryCode;

  /// No description provided for @claimDetail_cardInsuredInfo_noPassport.
  ///
  /// In en, this message translates to:
  /// **'Passport Number'**
  String get claimDetail_cardInsuredInfo_noPassport;

  /// No description provided for @claimDetail_cardInsuredInfo_noID.
  ///
  /// In en, this message translates to:
  /// **'ID Card No.'**
  String get claimDetail_cardInsuredInfo_noID;

  /// No description provided for @claimDetail_cardInsuredInfo_nationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get claimDetail_cardInsuredInfo_nationality;

  /// No description provided for @claimDetail_cardInsuredInfo_dob.
  ///
  /// In en, this message translates to:
  /// **'Place/Date of Birth'**
  String get claimDetail_cardInsuredInfo_dob;

  /// No description provided for @claimDetail_cardInsuredInfo_pob.
  ///
  /// In en, this message translates to:
  /// **'Place of Birth'**
  String get claimDetail_cardInsuredInfo_pob;

  /// No description provided for @claimDetail_cardInsuredInfo_address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get claimDetail_cardInsuredInfo_address;

  /// No description provided for @claimDetail_cardInsuredInfo_job.
  ///
  /// In en, this message translates to:
  /// **'Occupation'**
  String get claimDetail_cardInsuredInfo_job;

  /// No description provided for @claimDetail_cardInsuredInfo_dateRelease.
  ///
  /// In en, this message translates to:
  /// **'Issue Date'**
  String get claimDetail_cardInsuredInfo_dateRelease;

  /// No description provided for @claimDetail_cardInsuredInfo_dateExpiration.
  ///
  /// In en, this message translates to:
  /// **'Expiration Date'**
  String get claimDetail_cardInsuredInfo_dateExpiration;

  /// No description provided for @claimDetail_cardPersonalInfo_title.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get claimDetail_cardPersonalInfo_title;

  /// No description provided for @claimDetail_cardPersonalInfo_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get claimDetail_cardPersonalInfo_phone;

  /// No description provided for @claimDetail_cardAccountInfo_title.
  ///
  /// In en, this message translates to:
  /// **'Account Information'**
  String get claimDetail_cardAccountInfo_title;

  /// No description provided for @claimDetail_cardAccountInfo_accountName.
  ///
  /// In en, this message translates to:
  /// **'Account Holder Name'**
  String get claimDetail_cardAccountInfo_accountName;

  /// No description provided for @claimDetail_cardAccountInfo_bankName.
  ///
  /// In en, this message translates to:
  /// **'Bank Name'**
  String get claimDetail_cardAccountInfo_bankName;

  /// No description provided for @claimDetail_cardAccountInfo_bankBranch.
  ///
  /// In en, this message translates to:
  /// **'Bank Branch'**
  String get claimDetail_cardAccountInfo_bankBranch;

  /// No description provided for @claimDetail_cardAccountInfo_accountNumber.
  ///
  /// In en, this message translates to:
  /// **'Account Number'**
  String get claimDetail_cardAccountInfo_accountNumber;

  /// No description provided for @claimDetail_cardGeneralDocuments_title.
  ///
  /// In en, this message translates to:
  /// **'General Documents'**
  String get claimDetail_cardGeneralDocuments_title;

  /// No description provided for @claimDetail_cardSupportingDocuments_title.
  ///
  /// In en, this message translates to:
  /// **'Supporting Documents'**
  String get claimDetail_cardSupportingDocuments_title;

  /// No description provided for @claimDetail_cardAllDocuments_title.
  ///
  /// In en, this message translates to:
  /// **'Detail Claim'**
  String get claimDetail_cardAllDocuments_title;

  /// No description provided for @claimDetail_cardOtherFiles_title.
  ///
  /// In en, this message translates to:
  /// **'Other Files'**
  String get claimDetail_cardOtherFiles_title;

  /// No description provided for @claimDetail_cardOtherFiles_item.
  ///
  /// In en, this message translates to:
  /// **'Document'**
  String get claimDetail_cardOtherFiles_item;

  /// No description provided for @claimJourney_navTitle.
  ///
  /// In en, this message translates to:
  /// **'Detail Status'**
  String get claimJourney_navTitle;

  /// No description provided for @claimJourney_title.
  ///
  /// In en, this message translates to:
  /// **'Claim Status'**
  String get claimJourney_title;

  /// No description provided for @claimDocumentDetail_navTitle.
  ///
  /// In en, this message translates to:
  /// **'Detail Benefit'**
  String get claimDocumentDetail_navTitle;

  /// No description provided for @claimUploadMissingDocuments_navTitle.
  ///
  /// In en, this message translates to:
  /// **'Upload Documents'**
  String get claimUploadMissingDocuments_navTitle;

  /// No description provided for @claimUploadMissingDocuments_accordionNotes_title.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get claimUploadMissingDocuments_accordionNotes_title;

  /// No description provided for @claimUploadMissingDocuments_accordionUploadDoc_title.
  ///
  /// In en, this message translates to:
  /// **'Upload additional documents'**
  String get claimUploadMissingDocuments_accordionUploadDoc_title;

  /// No description provided for @claimUploadMissingDocuments_accordionUploadDoc_completed.
  ///
  /// In en, this message translates to:
  /// **'Documents are complete'**
  String get claimUploadMissingDocuments_accordionUploadDoc_completed;

  /// No description provided for @claimUploadMissingDocuments_successAlert_title.
  ///
  /// In en, this message translates to:
  /// **'Success!'**
  String get claimUploadMissingDocuments_successAlert_title;

  /// No description provided for @claimUploadMissingDocuments_successAlert_description.
  ///
  /// In en, this message translates to:
  /// **'Thank you for completing the requested data. Monitor claim updates to see the progress of your claim.'**
  String get claimUploadMissingDocuments_successAlert_description;

  /// No description provided for @notificationBar_claim.
  ///
  /// In en, this message translates to:
  /// **'Claim'**
  String get notificationBar_claim;

  /// No description provided for @notificationBar_null.
  ///
  /// In en, this message translates to:
  /// **'Claim approved'**
  String get notificationBar_null;

  /// No description provided for @notificationBar_status_draft.
  ///
  /// In en, this message translates to:
  /// **'Claim draft'**
  String get notificationBar_status_draft;

  /// No description provided for @notificationBar_status_submitted.
  ///
  /// In en, this message translates to:
  /// **'Claim submission sent'**
  String get notificationBar_status_submitted;

  /// No description provided for @notificationBar_status_acknowledged.
  ///
  /// In en, this message translates to:
  /// **'Claim submission received'**
  String get notificationBar_status_acknowledged;

  /// No description provided for @notificationBar_status_documentReview.
  ///
  /// In en, this message translates to:
  /// **'Claim under document review'**
  String get notificationBar_status_documentReview;

  /// No description provided for @notificationBar_status_claimAssessment.
  ///
  /// In en, this message translates to:
  /// **'Claim evaluated'**
  String get notificationBar_status_claimAssessment;

  /// No description provided for @notificationBar_status_approved.
  ///
  /// In en, this message translates to:
  /// **'Claim approved'**
  String get notificationBar_status_approved;

  /// No description provided for @notificationBar_status_paid.
  ///
  /// In en, this message translates to:
  /// **'Claim paid'**
  String get notificationBar_status_paid;

  /// No description provided for @notificationBar_status_closed.
  ///
  /// In en, this message translates to:
  /// **'Claim closed'**
  String get notificationBar_status_closed;

  /// No description provided for @notificationBar_status_lackOfDocuments.
  ///
  /// In en, this message translates to:
  /// **'Claim lacks documents'**
  String get notificationBar_status_lackOfDocuments;

  /// No description provided for @notificationBar_status_rejected.
  ///
  /// In en, this message translates to:
  /// **'Claim rejected'**
  String get notificationBar_status_rejected;

  /// No description provided for @newClaim_navTitle.
  ///
  /// In en, this message translates to:
  /// **'Create New Claim'**
  String get newClaim_navTitle;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @viewDetail.
  ///
  /// In en, this message translates to:
  /// **'View Detail'**
  String get viewDetail;

  /// No description provided for @dataEmpty.
  ///
  /// In en, this message translates to:
  /// **'Data empty'**
  String get dataEmpty;

  /// No description provided for @selectLang_title.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLang_title;

  /// No description provided for @selectLang_alertTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get selectLang_alertTitle;

  /// No description provided for @selectLang_alertDesc.
  ///
  /// In en, this message translates to:
  /// **'The language in the application will change according to your selection.'**
  String get selectLang_alertDesc;

  /// No description provided for @uploadFile_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Upload File'**
  String get uploadFile_placeholder;

  /// No description provided for @uploadFile_fileSelected.
  ///
  /// In en, this message translates to:
  /// **'File selected'**
  String get uploadFile_fileSelected;

  /// No description provided for @uploadFile_addMore.
  ///
  /// In en, this message translates to:
  /// **'Add Document'**
  String get uploadFile_addMore;

  /// No description provided for @uploadFile_reUpload.
  ///
  /// In en, this message translates to:
  /// **'Re-upload'**
  String get uploadFile_reUpload;

  /// No description provided for @uploadFile_uploadFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Upload from Gallery'**
  String get uploadFile_uploadFromGallery;

  /// No description provided for @uploadFile_tutorial.
  ///
  /// In en, this message translates to:
  /// **'Photo tutorial'**
  String get uploadFile_tutorial;

  /// No description provided for @months_january.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get months_january;

  /// No description provided for @months_february.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get months_february;

  /// No description provided for @months_march.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get months_march;

  /// No description provided for @months_april.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get months_april;

  /// No description provided for @months_may.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get months_may;

  /// No description provided for @months_june.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get months_june;

  /// No description provided for @months_july.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get months_july;

  /// No description provided for @months_august.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get months_august;

  /// No description provided for @months_september.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get months_september;

  /// No description provided for @months_october.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get months_october;

  /// No description provided for @months_november.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get months_november;

  /// No description provided for @months_december.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get months_december;

  /// No description provided for @datetimepicker_date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get datetimepicker_date;

  /// No description provided for @datetimepicker_month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get datetimepicker_month;

  /// No description provided for @datetimepicker_year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get datetimepicker_year;

  /// No description provided for @datetimepicker_time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get datetimepicker_time;

  /// No description provided for @bottomNav_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get bottomNav_home;

  /// No description provided for @bottomNav_status.
  ///
  /// In en, this message translates to:
  /// **'Policy'**
  String get bottomNav_status;

  /// No description provided for @bottomNav_create.
  ///
  /// In en, this message translates to:
  /// **'Submit New'**
  String get bottomNav_create;

  /// No description provided for @bottomNav_claim.
  ///
  /// In en, this message translates to:
  /// **'Claim'**
  String get bottomNav_claim;

  /// No description provided for @bottomNav_history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get bottomNav_history;

  /// No description provided for @bottomNav_logout.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get bottomNav_logout;

  /// No description provided for @bottomNav_newPolicy.
  ///
  /// In en, this message translates to:
  /// **'Buy Policy'**
  String get bottomNav_newPolicy;

  /// No description provided for @bottomNav_newClaim.
  ///
  /// In en, this message translates to:
  /// **'New Claim'**
  String get bottomNav_newClaim;

  /// No description provided for @bottomNav_passenger.
  ///
  /// In en, this message translates to:
  /// **'Passenger'**
  String get bottomNav_passenger;

  /// No description provided for @bottomNav_driver.
  ///
  /// In en, this message translates to:
  /// **'Driver'**
  String get bottomNav_driver;

  /// No description provided for @topNav_login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get topNav_login;

  /// No description provided for @logout_title.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout_title;

  /// No description provided for @logout_message1.
  ///
  /// In en, this message translates to:
  /// **'Thank you for visiting Friendsure!'**
  String get logout_message1;

  /// No description provided for @logout_message2.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logout_message2;

  /// No description provided for @logout_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get logout_cancel;

  /// No description provided for @logout_confirm.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout_confirm;

  /// No description provided for @selectlist_otherBank.
  ///
  /// In en, this message translates to:
  /// **'Other bank'**
  String get selectlist_otherBank;

  /// No description provided for @selectlist_otherHospital.
  ///
  /// In en, this message translates to:
  /// **'Other hospital'**
  String get selectlist_otherHospital;

  /// No description provided for @input_placeholderInsertProduct.
  ///
  /// In en, this message translates to:
  /// **'Insert product name'**
  String get input_placeholderInsertProduct;

  /// No description provided for @inviteMember.
  ///
  /// In en, this message translates to:
  /// **'Invite Member!'**
  String get inviteMember;

  /// No description provided for @potentialCommission.
  ///
  /// In en, this message translates to:
  /// **'Potential Commission'**
  String get potentialCommission;

  /// No description provided for @performance.
  ///
  /// In en, this message translates to:
  /// **'Performance'**
  String get performance;

  /// No description provided for @productName.
  ///
  /// In en, this message translates to:
  /// **'Product Name'**
  String get productName;

  /// No description provided for @planList.
  ///
  /// In en, this message translates to:
  /// **'Plan List'**
  String get planList;

  /// No description provided for @addScheme.
  ///
  /// In en, this message translates to:
  /// **'Add Scheme'**
  String get addScheme;

  /// No description provided for @customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer;

  /// No description provided for @transaction.
  ///
  /// In en, this message translates to:
  /// **'Transaction'**
  String get transaction;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @expectedCommisionFee.
  ///
  /// In en, this message translates to:
  /// **'Expected Commision Fee'**
  String get expectedCommisionFee;

  /// No description provided for @dialogConfirm_titleReview.
  ///
  /// In en, this message translates to:
  /// **'Create and publish product'**
  String get dialogConfirm_titleReview;

  /// No description provided for @dialogConfirm_review.
  ///
  /// In en, this message translates to:
  /// **'Please review the chosen scheme and plan carefully, as they cannot be edited once published.'**
  String get dialogConfirm_review;

  /// No description provided for @product.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get product;

  /// No description provided for @maxSelectProduct.
  ///
  /// In en, this message translates to:
  /// **'Select up to 3 products to sell. Any products not selected will be deactivated.'**
  String get maxSelectProduct;

  /// No description provided for @loadMore.
  ///
  /// In en, this message translates to:
  /// **'Load more'**
  String get loadMore;

  /// No description provided for @required_general.
  ///
  /// In en, this message translates to:
  /// **'Field is required'**
  String get required_general;

  /// No description provided for @required_date.
  ///
  /// In en, this message translates to:
  /// **'Date is required'**
  String get required_date;

  /// No description provided for @required_month.
  ///
  /// In en, this message translates to:
  /// **'Month is required'**
  String get required_month;

  /// No description provided for @required_year.
  ///
  /// In en, this message translates to:
  /// **'Year is required'**
  String get required_year;

  /// No description provided for @required_time.
  ///
  /// In en, this message translates to:
  /// **'Time is required'**
  String get required_time;

  /// No description provided for @required_minLength.
  ///
  /// In en, this message translates to:
  /// **'Minimum {min} characters required.'**
  String required_minLength(Object min);

  /// No description provided for @invalidFormat_phone.
  ///
  /// In en, this message translates to:
  /// **'Invalid format phone number'**
  String get invalidFormat_phone;

  /// No description provided for @invalidFormat_email.
  ///
  /// In en, this message translates to:
  /// **'Invalid format email'**
  String get invalidFormat_email;

  /// No description provided for @invalidFormat_fileFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid file format (supported: .pdf, .png, .jpg)'**
  String get invalidFormat_fileFormat;

  /// No description provided for @maximumLength_fileSize.
  ///
  /// In en, this message translates to:
  /// **'Maximum file size is '**
  String get maximumLength_fileSize;

  /// No description provided for @listHistory_titlePolicy.
  ///
  /// In en, this message translates to:
  /// **'History Policies'**
  String get listHistory_titlePolicy;

  /// No description provided for @listHistory_titleClaim.
  ///
  /// In en, this message translates to:
  /// **'History Claims'**
  String get listHistory_titleClaim;

  /// No description provided for @listHistory_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Select the policy you want to claim'**
  String get listHistory_subtitle;

  /// No description provided for @listHistory_search_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Search participant name, insurance, or policy number'**
  String get listHistory_search_placeholder;

  /// No description provided for @listHistory_filterDate_title.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get listHistory_filterDate_title;

  /// No description provided for @listHistory_filterDate_placeholder.
  ///
  /// In en, this message translates to:
  /// **'All Dates'**
  String get listHistory_filterDate_placeholder;

  /// No description provided for @listHistory_filterDate_opt1.
  ///
  /// In en, this message translates to:
  /// **'All Dates'**
  String get listHistory_filterDate_opt1;

  /// No description provided for @listHistory_filterDate_opt2.
  ///
  /// In en, this message translates to:
  /// **'Select Custom Dates'**
  String get listHistory_filterDate_opt2;

  /// No description provided for @listHistory_filterDate_startDate.
  ///
  /// In en, this message translates to:
  /// **'Select Start Date'**
  String get listHistory_filterDate_startDate;

  /// No description provided for @listHistory_filterDate_endDate.
  ///
  /// In en, this message translates to:
  /// **'Select End Date'**
  String get listHistory_filterDate_endDate;

  /// No description provided for @listHistory_status_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get listHistory_status_all;

  /// No description provided for @listHistory_status_active.
  ///
  /// In en, this message translates to:
  /// **'In Force'**
  String get listHistory_status_active;

  /// No description provided for @listHistory_status_draft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get listHistory_status_draft;

  /// No description provided for @listHistory_status_expired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get listHistory_status_expired;

  /// No description provided for @listHistory_empty_claim.
  ///
  /// In en, this message translates to:
  /// **'Currently You Have not Claims Archive'**
  String get listHistory_empty_claim;

  /// No description provided for @listHistory_empty_policy.
  ///
  /// In en, this message translates to:
  /// **'Currently You Have no Policies Archive'**
  String get listHistory_empty_policy;

  /// No description provided for @homePreview_claimTitle.
  ///
  /// In en, this message translates to:
  /// **'Updated Claim'**
  String get homePreview_claimTitle;

  /// No description provided for @homePreview_policyTitle.
  ///
  /// In en, this message translates to:
  /// **'Updated Policy'**
  String get homePreview_policyTitle;

  /// No description provided for @homePreview_seeMore.
  ///
  /// In en, this message translates to:
  /// **'See More'**
  String get homePreview_seeMore;

  /// No description provided for @homePreview_status_draft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get homePreview_status_draft;

  /// No description provided for @homePreview_status_process.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get homePreview_status_process;

  /// No description provided for @homePreview_status_success.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get homePreview_status_success;

  /// No description provided for @homePreview_status_close.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get homePreview_status_close;

  /// No description provided for @homePreview_status_withdraw.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get homePreview_status_withdraw;

  /// No description provided for @homePreview_status_reject.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get homePreview_status_reject;

  /// No description provided for @homePreview_status_needAction.
  ///
  /// In en, this message translates to:
  /// **'Lack of Documents'**
  String get homePreview_status_needAction;

  /// No description provided for @homePreview_status_sent.
  ///
  /// In en, this message translates to:
  /// **'Application Sent'**
  String get homePreview_status_sent;

  /// No description provided for @homePreview_newestPolicy_empty.
  ///
  /// In en, this message translates to:
  /// **'Currently You have Not Active Policy yet'**
  String get homePreview_newestPolicy_empty;

  /// No description provided for @homePreview_newestClaim_empty.
  ///
  /// In en, this message translates to:
  /// **'Currently You have Not Active Claim yet'**
  String get homePreview_newestClaim_empty;

  /// No description provided for @home_welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get home_welcome;

  /// No description provided for @home_message.
  ///
  /// In en, this message translates to:
  /// **'You Have'**
  String get home_message;

  /// No description provided for @home_type.
  ///
  /// In en, this message translates to:
  /// **'Type Insurances'**
  String get home_type;

  /// No description provided for @home_policy.
  ///
  /// In en, this message translates to:
  /// **'Active Policies'**
  String get home_policy;

  /// No description provided for @home_claim.
  ///
  /// In en, this message translates to:
  /// **'Active Claims'**
  String get home_claim;

  /// No description provided for @home_idClaim.
  ///
  /// In en, this message translates to:
  /// **'ID Claim'**
  String get home_idClaim;

  /// No description provided for @listClaim_status_process.
  ///
  /// In en, this message translates to:
  /// **'Process'**
  String get listClaim_status_process;

  /// No description provided for @listClaim_status_applicationSent.
  ///
  /// In en, this message translates to:
  /// **'Application Sent'**
  String get listClaim_status_applicationSent;

  /// No description provided for @listClaim_status_applicationProcess.
  ///
  /// In en, this message translates to:
  /// **'Application in Process'**
  String get listClaim_status_applicationProcess;

  /// No description provided for @listClaim_status_paymentProcessing.
  ///
  /// In en, this message translates to:
  /// **'Payment Process'**
  String get listClaim_status_paymentProcessing;

  /// No description provided for @listClaim_status_success.
  ///
  /// In en, this message translates to:
  /// **'Successful Disbursement'**
  String get listClaim_status_success;

  /// No description provided for @listClaim_status_claimRejected.
  ///
  /// In en, this message translates to:
  /// **'Claim Rejected'**
  String get listClaim_status_claimRejected;

  /// No description provided for @listPolicy_status_title.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get listPolicy_status_title;

  /// No description provided for @listPolicy_status_placeholder.
  ///
  /// In en, this message translates to:
  /// **'All Statuses'**
  String get listPolicy_status_placeholder;

  /// No description provided for @listPolicy_status_all.
  ///
  /// In en, this message translates to:
  /// **'All Statuses'**
  String get listPolicy_status_all;

  /// No description provided for @listPolicy_status_active.
  ///
  /// In en, this message translates to:
  /// **'In Force'**
  String get listPolicy_status_active;

  /// No description provided for @listPolicy_status_draft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get listPolicy_status_draft;

  /// No description provided for @listPolicy_status_expired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get listPolicy_status_expired;

  /// No description provided for @listPolicy_status_gracePeriod.
  ///
  /// In en, this message translates to:
  /// **'Grace Period'**
  String get listPolicy_status_gracePeriod;

  /// No description provided for @listPolicy_status_lapse.
  ///
  /// In en, this message translates to:
  /// **'Lapse'**
  String get listPolicy_status_lapse;

  /// No description provided for @choosePolicy_title.
  ///
  /// In en, this message translates to:
  /// **'Insurance List'**
  String get choosePolicy_title;

  /// No description provided for @choosePolicy_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Select the insurance you want to claim'**
  String get choosePolicy_subtitle;

  /// No description provided for @choosePolicy_airpaz.
  ///
  /// In en, this message translates to:
  /// **'Airpaz'**
  String get choosePolicy_airpaz;

  /// No description provided for @choosePolicy_travel.
  ///
  /// In en, this message translates to:
  /// **'Travel Insurance'**
  String get choosePolicy_travel;

  /// No description provided for @choosePolicy_pa.
  ///
  /// In en, this message translates to:
  /// **'Personal Accident Insurance'**
  String get choosePolicy_pa;

  /// No description provided for @choosePolicy_policy.
  ///
  /// In en, this message translates to:
  /// **'Active Policy'**
  String get choosePolicy_policy;

  /// No description provided for @choosePolicy_history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get choosePolicy_history;

  /// No description provided for @choosePolicy_archive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get choosePolicy_archive;

  /// No description provided for @choosePolicy_activeClaim.
  ///
  /// In en, this message translates to:
  /// **'Active Claim'**
  String get choosePolicy_activeClaim;

  /// No description provided for @choosePolicy_title2.
  ///
  /// In en, this message translates to:
  /// **'Claim List'**
  String get choosePolicy_title2;

  /// No description provided for @choosePolicy_subtitle2.
  ///
  /// In en, this message translates to:
  /// **'Track your claim status'**
  String get choosePolicy_subtitle2;

  /// No description provided for @listPolicy_title.
  ///
  /// In en, this message translates to:
  /// **'Policy List'**
  String get listPolicy_title;

  /// No description provided for @listPolicy_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Select the policy you want to claim'**
  String get listPolicy_subtitle;

  /// No description provided for @listPolicy_search_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Search participant name, insurance, or policy number'**
  String get listPolicy_search_placeholder;

  /// No description provided for @listPolicy_endorsementPending.
  ///
  /// In en, this message translates to:
  /// **'Data verification'**
  String get listPolicy_endorsementPending;

  /// No description provided for @listPolicy_endorsementRejected.
  ///
  /// In en, this message translates to:
  /// **'Data change rejected'**
  String get listPolicy_endorsementRejected;

  /// No description provided for @listPolicy_filterDate_title.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get listPolicy_filterDate_title;

  /// No description provided for @listPolicy_filterDate_placeholder.
  ///
  /// In en, this message translates to:
  /// **'All Dates'**
  String get listPolicy_filterDate_placeholder;

  /// No description provided for @listPolicy_filterDate_opt1.
  ///
  /// In en, this message translates to:
  /// **'All Policy Dates'**
  String get listPolicy_filterDate_opt1;

  /// No description provided for @listPolicy_filterDate_opt2.
  ///
  /// In en, this message translates to:
  /// **'Select Custom Dates'**
  String get listPolicy_filterDate_opt2;

  /// No description provided for @listPolicy_filterDate_startDate.
  ///
  /// In en, this message translates to:
  /// **'Select Start Date'**
  String get listPolicy_filterDate_startDate;

  /// No description provided for @listPolicy_filterDate_endDate.
  ///
  /// In en, this message translates to:
  /// **'Select End Date'**
  String get listPolicy_filterDate_endDate;

  /// No description provided for @listPolicy_status_pendingPolicy.
  ///
  /// In en, this message translates to:
  /// **'Pending Policy'**
  String get listPolicy_status_pendingPolicy;

  /// No description provided for @listPolicy_history_title.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get listPolicy_history_title;

  /// No description provided for @listPolicy_history_empty.
  ///
  /// In en, this message translates to:
  /// **'You currently have no Policy history'**
  String get listPolicy_history_empty;

  /// No description provided for @listPolicy_history_navigation.
  ///
  /// In en, this message translates to:
  /// **'Policy History'**
  String get listPolicy_history_navigation;

  /// No description provided for @listPolicy_empty.
  ///
  /// In en, this message translates to:
  /// **'You currently have no Policies'**
  String get listPolicy_empty;

  /// No description provided for @listPolicy_outOfClaim_title.
  ///
  /// In en, this message translates to:
  /// **'All benefits have been claimed'**
  String get listPolicy_outOfClaim_title;

  /// No description provided for @listPolicy_outOfClaim_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Please contact the Teman team if you believe this is an error'**
  String get listPolicy_outOfClaim_subtitle;

  /// No description provided for @listPolicy_outOfClaim_button.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get listPolicy_outOfClaim_button;

  /// No description provided for @policySubmission_navTitle.
  ///
  /// In en, this message translates to:
  /// **'Insurance Claim'**
  String get policySubmission_navTitle;

  /// No description provided for @policySubmission_airpaz.
  ///
  /// In en, this message translates to:
  /// **'Airpaz Claim'**
  String get policySubmission_airpaz;

  /// No description provided for @policySubmission_travel.
  ///
  /// In en, this message translates to:
  /// **'Travel Insurance'**
  String get policySubmission_travel;

  /// No description provided for @policySubmission_pa.
  ///
  /// In en, this message translates to:
  /// **'Personal Accident Insurance'**
  String get policySubmission_pa;

  /// No description provided for @policySubmission_cardPolicyHolder_title.
  ///
  /// In en, this message translates to:
  /// **'Policy Holder Information'**
  String get policySubmission_cardPolicyHolder_title;

  /// No description provided for @policySubmission_cardPolicyHolder_info1.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get policySubmission_cardPolicyHolder_info1;

  /// No description provided for @policySubmission_cardPolicyHolder_info2.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get policySubmission_cardPolicyHolder_info2;

  /// No description provided for @policySubmission_cardPolicyHolder_info3.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get policySubmission_cardPolicyHolder_info3;

  /// No description provided for @policySubmission_accordionInsuredInfo_title.
  ///
  /// In en, this message translates to:
  /// **'Insured Name'**
  String get policySubmission_accordionInsuredInfo_title;

  /// No description provided for @policySubmission_accordionInsuredInfo_select.
  ///
  /// In en, this message translates to:
  /// **'Select Insured'**
  String get policySubmission_accordionInsuredInfo_select;

  /// No description provided for @policySubmission_accordionInsuredInfo_noPolicy.
  ///
  /// In en, this message translates to:
  /// **'Policy Number'**
  String get policySubmission_accordionInsuredInfo_noPolicy;

  /// No description provided for @policySubmission_accordionInsuredInfo_noParticipant.
  ///
  /// In en, this message translates to:
  /// **'Participant Number'**
  String get policySubmission_accordionInsuredInfo_noParticipant;

  /// No description provided for @policySubmission_accordionInsuredInfo_fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get policySubmission_accordionInsuredInfo_fullName;

  /// No description provided for @policySubmission_accordionInsuredInfo_gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get policySubmission_accordionInsuredInfo_gender;

  /// No description provided for @policySubmission_accordionInsuredInfo_countryCode.
  ///
  /// In en, this message translates to:
  /// **'Country Code'**
  String get policySubmission_accordionInsuredInfo_countryCode;

  /// No description provided for @policySubmission_accordionInsuredInfo_noPassport.
  ///
  /// In en, this message translates to:
  /// **'Passport Number'**
  String get policySubmission_accordionInsuredInfo_noPassport;

  /// No description provided for @policySubmission_accordionInsuredInfo_noID.
  ///
  /// In en, this message translates to:
  /// **'National ID'**
  String get policySubmission_accordionInsuredInfo_noID;

  /// No description provided for @policySubmission_accordionInsuredInfo_nationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get policySubmission_accordionInsuredInfo_nationality;

  /// No description provided for @policySubmission_accordionInsuredInfo_dob.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get policySubmission_accordionInsuredInfo_dob;

  /// No description provided for @policySubmission_accordionInsuredInfo_pob.
  ///
  /// In en, this message translates to:
  /// **'Place of Birth'**
  String get policySubmission_accordionInsuredInfo_pob;

  /// No description provided for @policySubmission_accordionInsuredInfo_address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get policySubmission_accordionInsuredInfo_address;

  /// No description provided for @policySubmission_accordionInsuredInfo_job.
  ///
  /// In en, this message translates to:
  /// **'Occupation'**
  String get policySubmission_accordionInsuredInfo_job;

  /// No description provided for @policySubmission_accordionInsuredInfo_dateRelease.
  ///
  /// In en, this message translates to:
  /// **'Date of Issue'**
  String get policySubmission_accordionInsuredInfo_dateRelease;

  /// No description provided for @policySubmission_accordionInsuredInfo_dateExpiration.
  ///
  /// In en, this message translates to:
  /// **'Expiration Date'**
  String get policySubmission_accordionInsuredInfo_dateExpiration;

  /// No description provided for @policySubmission_accordionPersonalInfo_title.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get policySubmission_accordionPersonalInfo_title;

  /// No description provided for @policySubmission_accordionPersonalInfo_phoneInput_label.
  ///
  /// In en, this message translates to:
  /// **'Phone Number (WhatsApp)'**
  String get policySubmission_accordionPersonalInfo_phoneInput_label;

  /// No description provided for @policySubmission_accordionPersonalInfo_phoneInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter Phone Number'**
  String get policySubmission_accordionPersonalInfo_phoneInput_placeholder;

  /// No description provided for @policySubmission_accordionPersonalInfo_addressInput_label.
  ///
  /// In en, this message translates to:
  /// **'Claim Shipping Address'**
  String get policySubmission_accordionPersonalInfo_addressInput_label;

  /// No description provided for @policySubmission_accordionPersonalInfo_addressInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get policySubmission_accordionPersonalInfo_addressInput_placeholder;

  /// No description provided for @policySubmission_accordionPersonalInfo_countryInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get policySubmission_accordionPersonalInfo_countryInput_placeholder;

  /// No description provided for @policySubmission_accordionPersonalInfo_stateInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Province'**
  String get policySubmission_accordionPersonalInfo_stateInput_placeholder;

  /// No description provided for @policySubmission_accordionPersonalInfo_cityInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'City/District'**
  String get policySubmission_accordionPersonalInfo_cityInput_placeholder;

  /// No description provided for @policySubmission_accordionPersonalInfo_districtInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Subdistrict'**
  String get policySubmission_accordionPersonalInfo_districtInput_placeholder;

  /// No description provided for @policySubmission_accordionPersonalInfo_subdistrictInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Village'**
  String
      get policySubmission_accordionPersonalInfo_subdistrictInput_placeholder;

  /// No description provided for @policySubmission_accordionPersonalInfo_postalCodeInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Postal Code'**
  String get policySubmission_accordionPersonalInfo_postalCodeInput_placeholder;

  /// No description provided for @policySubmission_accordionPersonalInfo_street1Input_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Street 1'**
  String get policySubmission_accordionPersonalInfo_street1Input_placeholder;

  /// No description provided for @policySubmission_accordionPersonalInfo_street2Input_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Street 2'**
  String get policySubmission_accordionPersonalInfo_street2Input_placeholder;

  /// No description provided for @policySubmission_accordionAccountInfo_title.
  ///
  /// In en, this message translates to:
  /// **'Account Information'**
  String get policySubmission_accordionAccountInfo_title;

  /// No description provided for @policySubmission_accordionAccountInfo_accountName_input.
  ///
  /// In en, this message translates to:
  /// **'Account Holder Name'**
  String get policySubmission_accordionAccountInfo_accountName_input;

  /// No description provided for @policySubmission_accordionAccountInfo_accountName_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter name as per bank book'**
  String get policySubmission_accordionAccountInfo_accountName_placeholder;

  /// No description provided for @policySubmission_accordionAccountInfo_accountNameInput_label.
  ///
  /// In en, this message translates to:
  /// **'Account Holder Name'**
  String get policySubmission_accordionAccountInfo_accountNameInput_label;

  /// No description provided for @policySubmission_accordionAccountInfo_accountNameInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter name as per bank book'**
  String get policySubmission_accordionAccountInfo_accountNameInput_placeholder;

  /// No description provided for @policySubmission_accordionAccountInfo_bankInput_label.
  ///
  /// In en, this message translates to:
  /// **'Select Bank'**
  String get policySubmission_accordionAccountInfo_bankInput_label;

  /// No description provided for @policySubmission_accordionAccountInfo_bankInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Select Bank'**
  String get policySubmission_accordionAccountInfo_bankInput_placeholder;

  /// No description provided for @policySubmission_accordionAccountInfo_bankBranchInput_label.
  ///
  /// In en, this message translates to:
  /// **'Bank Branch'**
  String get policySubmission_accordionAccountInfo_bankBranchInput_label;

  /// No description provided for @policySubmission_accordionAccountInfo_bankBranchInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter bank branch'**
  String get policySubmission_accordionAccountInfo_bankBranchInput_placeholder;

  /// No description provided for @policySubmission_accordionAccountInfo_accountNumberInput_label.
  ///
  /// In en, this message translates to:
  /// **'Account Number'**
  String get policySubmission_accordionAccountInfo_accountNumberInput_label;

  /// No description provided for @policySubmission_accordionAccountInfo_accountNumberInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter account number'**
  String
      get policySubmission_accordionAccountInfo_accountNumberInput_placeholder;

  /// No description provided for @policySubmission_accordionClaimBenefit_title.
  ///
  /// In en, this message translates to:
  /// **'Claim Type'**
  String get policySubmission_accordionClaimBenefit_title;

  /// No description provided for @policySubmission_accordionClaimBenefit_benefitInfo.
  ///
  /// In en, this message translates to:
  /// **'Benefit info'**
  String get policySubmission_accordionClaimBenefit_benefitInfo;

  /// No description provided for @policyPreview_navTitle.
  ///
  /// In en, this message translates to:
  /// **'Insurance Claim'**
  String get policyPreview_navTitle;

  /// No description provided for @policyPreview_airpaz.
  ///
  /// In en, this message translates to:
  /// **'Airpaz Insurance'**
  String get policyPreview_airpaz;

  /// No description provided for @policyPreview_travel.
  ///
  /// In en, this message translates to:
  /// **'Travel Insurance'**
  String get policyPreview_travel;

  /// No description provided for @policyPreview_pa.
  ///
  /// In en, this message translates to:
  /// **'Personal Accident Insurance'**
  String get policyPreview_pa;

  /// No description provided for @policyPreview_cardPolicyHolder_title.
  ///
  /// In en, this message translates to:
  /// **'Policy Holder'**
  String get policyPreview_cardPolicyHolder_title;

  /// No description provided for @policyPreview_cardPolicyHolder_info1.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get policyPreview_cardPolicyHolder_info1;

  /// No description provided for @policyPreview_cardPolicyHolder_info2.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get policyPreview_cardPolicyHolder_info2;

  /// No description provided for @policyPreview_cardPolicyHolder_info3.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get policyPreview_cardPolicyHolder_info3;

  /// No description provided for @policyPreview_cardInsuredInfo_title.
  ///
  /// In en, this message translates to:
  /// **'Insured Name'**
  String get policyPreview_cardInsuredInfo_title;

  /// No description provided for @policyPreview_cardInsuredInfo_noPolicy.
  ///
  /// In en, this message translates to:
  /// **'Policy Number'**
  String get policyPreview_cardInsuredInfo_noPolicy;

  /// No description provided for @policyPreview_cardInsuredInfo_noParticipant.
  ///
  /// In en, this message translates to:
  /// **'Participant Number'**
  String get policyPreview_cardInsuredInfo_noParticipant;

  /// No description provided for @policyPreview_cardInsuredInfo_fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get policyPreview_cardInsuredInfo_fullName;

  /// No description provided for @policyPreview_cardInsuredInfo_gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get policyPreview_cardInsuredInfo_gender;

  /// No description provided for @policyPreview_cardInsuredInfo_countryCode.
  ///
  /// In en, this message translates to:
  /// **'Country Code'**
  String get policyPreview_cardInsuredInfo_countryCode;

  /// No description provided for @policyPreview_cardInsuredInfo_noPassport.
  ///
  /// In en, this message translates to:
  /// **'Passport Number'**
  String get policyPreview_cardInsuredInfo_noPassport;

  /// No description provided for @policyPreview_cardInsuredInfo_nationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get policyPreview_cardInsuredInfo_nationality;

  /// No description provided for @policyPreview_cardInsuredInfo_dob.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get policyPreview_cardInsuredInfo_dob;

  /// No description provided for @policyPreview_cardInsuredInfo_pob.
  ///
  /// In en, this message translates to:
  /// **'Place of Birth'**
  String get policyPreview_cardInsuredInfo_pob;

  /// No description provided for @policyPreview_cardInsuredInfo_address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get policyPreview_cardInsuredInfo_address;

  /// No description provided for @policyPreview_cardInsuredInfo_job.
  ///
  /// In en, this message translates to:
  /// **'Occupation'**
  String get policyPreview_cardInsuredInfo_job;

  /// No description provided for @policyPreview_cardInsuredInfo_dateRelease.
  ///
  /// In en, this message translates to:
  /// **'Date of Issue'**
  String get policyPreview_cardInsuredInfo_dateRelease;

  /// No description provided for @policyPreview_cardInsuredInfo_dateExpiration.
  ///
  /// In en, this message translates to:
  /// **'Expiration Date'**
  String get policyPreview_cardInsuredInfo_dateExpiration;

  /// No description provided for @policyPreview_cardClaimRequested_title.
  ///
  /// In en, this message translates to:
  /// **'Claim Requested'**
  String get policyPreview_cardClaimRequested_title;

  /// No description provided for @policyPreview_cardClaimRequested_checkTnc1.
  ///
  /// In en, this message translates to:
  /// **'I have read, understood, and agree to'**
  String get policyPreview_cardClaimRequested_checkTnc1;

  /// No description provided for @policyPreview_cardClaimRequested_checkTnc2.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get policyPreview_cardClaimRequested_checkTnc2;

  /// No description provided for @policyPreview_cardClaimRequested_checkTnc3.
  ///
  /// In en, this message translates to:
  /// **'applicable to Teman'**
  String get policyPreview_cardClaimRequested_checkTnc3;

  /// No description provided for @listHistory_title.
  ///
  /// In en, this message translates to:
  /// **'Policy History'**
  String get listHistory_title;

  /// No description provided for @detailPolicy_navTitle.
  ///
  /// In en, this message translates to:
  /// **'Policy Details'**
  String get detailPolicy_navTitle;

  /// No description provided for @detailPolicy_noData.
  ///
  /// In en, this message translates to:
  /// **'Policy unavailable'**
  String get detailPolicy_noData;

  /// No description provided for @detailPolicy_accordionInsured_title.
  ///
  /// In en, this message translates to:
  /// **'Insured Name'**
  String get detailPolicy_accordionInsured_title;

  /// No description provided for @detailPolicy_accordionInsured_noPolicy.
  ///
  /// In en, this message translates to:
  /// **'Policy Number'**
  String get detailPolicy_accordionInsured_noPolicy;

  /// No description provided for @detailPolicy_accordionInsured_noParticipant.
  ///
  /// In en, this message translates to:
  /// **'Participant Number'**
  String get detailPolicy_accordionInsured_noParticipant;

  /// No description provided for @detailPolicy_accordionInsured_fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get detailPolicy_accordionInsured_fullName;

  /// No description provided for @detailPolicy_accordionInsured_gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get detailPolicy_accordionInsured_gender;

  /// No description provided for @detailPolicy_accordionInsured_countryCode.
  ///
  /// In en, this message translates to:
  /// **'Country Code'**
  String get detailPolicy_accordionInsured_countryCode;

  /// No description provided for @detailPolicy_accordionInsured_noPassport.
  ///
  /// In en, this message translates to:
  /// **'Passport Number'**
  String get detailPolicy_accordionInsured_noPassport;

  /// No description provided for @detailPolicy_accordionInsured_noID.
  ///
  /// In en, this message translates to:
  /// **'National ID'**
  String get detailPolicy_accordionInsured_noID;

  /// No description provided for @detailPolicy_accordionInsured_nationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get detailPolicy_accordionInsured_nationality;

  /// No description provided for @detailPolicy_accordionInsured_dob.
  ///
  /// In en, this message translates to:
  /// **'Place/Date of Birth'**
  String get detailPolicy_accordionInsured_dob;

  /// No description provided for @detailPolicy_accordionInsured_pob.
  ///
  /// In en, this message translates to:
  /// **'Place of Birth'**
  String get detailPolicy_accordionInsured_pob;

  /// No description provided for @detailPolicy_accordionInsured_address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get detailPolicy_accordionInsured_address;

  /// No description provided for @detailPolicy_accordionInsured_job.
  ///
  /// In en, this message translates to:
  /// **'Occupation'**
  String get detailPolicy_accordionInsured_job;

  /// No description provided for @detailPolicy_accordionInsured_dateRelease.
  ///
  /// In en, this message translates to:
  /// **'Date of Issue'**
  String get detailPolicy_accordionInsured_dateRelease;

  /// No description provided for @detailPolicy_accordionInsured_dateExpiration.
  ///
  /// In en, this message translates to:
  /// **'Expiration Date'**
  String get detailPolicy_accordionInsured_dateExpiration;

  /// No description provided for @detailPolicy_accordionInsured_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit Data'**
  String get detailPolicy_accordionInsured_edit;

  /// No description provided for @endorsement_navTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Data'**
  String get endorsement_navTitle;

  /// No description provided for @endorsement_confirmation_title.
  ///
  /// In en, this message translates to:
  /// **'Submit Data Change'**
  String get endorsement_confirmation_title;

  /// No description provided for @endorsement_confirmation_description.
  ///
  /// In en, this message translates to:
  /// **'Before sending, ensure all data is correct. Requests submitted before 5:00 PM WIB will be processed the same day. You can still file claims during the verification process.'**
  String get endorsement_confirmation_description;

  /// No description provided for @endorsement_info_success.
  ///
  /// In en, this message translates to:
  /// **'Policy document is undergoing data changes, but Teman Protection remains active, so you can still file claims'**
  String get endorsement_info_success;

  /// No description provided for @endorsement_info_error.
  ///
  /// In en, this message translates to:
  /// **'Your data change request could not be processed because '**
  String get endorsement_info_error;

  /// No description provided for @endorsement_nameInput_label.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get endorsement_nameInput_label;

  /// No description provided for @endorsement_nameInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter Full Name'**
  String get endorsement_nameInput_placeholder;

  /// No description provided for @endorsement_nikInput_label.
  ///
  /// In en, this message translates to:
  /// **'National ID'**
  String get endorsement_nikInput_label;

  /// No description provided for @endorsement_nikInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter National ID'**
  String get endorsement_nikInput_placeholder;

  /// No description provided for @endorsement_dobInput_label.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get endorsement_dobInput_label;

  /// No description provided for @endorsement_dobInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get endorsement_dobInput_placeholder;

  /// No description provided for @endorsement_pobInput_label.
  ///
  /// In en, this message translates to:
  /// **'Place of Birth'**
  String get endorsement_pobInput_label;

  /// No description provided for @endorsement_pobInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter as per ID'**
  String get endorsement_pobInput_placeholder;

  /// No description provided for @endorsement_passportNoInput_label.
  ///
  /// In en, this message translates to:
  /// **'Passport Number'**
  String get endorsement_passportNoInput_label;

  /// No description provided for @endorsement_passportNoInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter Passport Number'**
  String get endorsement_passportNoInput_placeholder;

  /// No description provided for @endorsement_passportTypeInput_label.
  ///
  /// In en, this message translates to:
  /// **'Passport Type'**
  String get endorsement_passportTypeInput_label;

  /// No description provided for @endorsement_passportTypeInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter Passport Type'**
  String get endorsement_passportTypeInput_placeholder;

  /// No description provided for @endorsement_nationalityInput_label.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get endorsement_nationalityInput_label;

  /// No description provided for @endorsement_nationalityInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Select Nationality'**
  String get endorsement_nationalityInput_placeholder;

  /// No description provided for @endorsement_countryCodeInput_label.
  ///
  /// In en, this message translates to:
  /// **'Country Code'**
  String get endorsement_countryCodeInput_label;

  /// No description provided for @endorsement_countryCodeInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter Country Code'**
  String get endorsement_countryCodeInput_placeholder;

  /// No description provided for @endorsement_genderInput_label.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get endorsement_genderInput_label;

  /// No description provided for @endorsement_genderInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Select Gender'**
  String get endorsement_genderInput_placeholder;

  /// No description provided for @endorsement_stateInput_label.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get endorsement_stateInput_label;

  /// No description provided for @endorsement_stateInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Province'**
  String get endorsement_stateInput_placeholder;

  /// No description provided for @endorsement_cityInput_label.
  ///
  /// In en, this message translates to:
  /// **'City/District'**
  String get endorsement_cityInput_label;

  /// No description provided for @endorsement_cityInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'City/District'**
  String get endorsement_cityInput_placeholder;

  /// No description provided for @endorsement_districtInput_label.
  ///
  /// In en, this message translates to:
  /// **'Subdistrict'**
  String get endorsement_districtInput_label;

  /// No description provided for @endorsement_districtInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Subdistrict'**
  String get endorsement_districtInput_placeholder;

  /// No description provided for @endorsement_subdistrictInput_label.
  ///
  /// In en, this message translates to:
  /// **'Village/Subdivision'**
  String get endorsement_subdistrictInput_label;

  /// No description provided for @endorsement_subdistrictInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Village/Subdivision'**
  String get endorsement_subdistrictInput_placeholder;

  /// No description provided for @endorsement_street1Input_label.
  ///
  /// In en, this message translates to:
  /// **'Enter as per ID'**
  String get endorsement_street1Input_label;

  /// No description provided for @endorsement_street1Input_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter as per ID'**
  String get endorsement_street1Input_placeholder;

  /// No description provided for @endorsement_street2Input_label.
  ///
  /// In en, this message translates to:
  /// **'RT/RW'**
  String get endorsement_street2Input_label;

  /// No description provided for @endorsement_street2Input_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter as per ID'**
  String get endorsement_street2Input_placeholder;

  /// No description provided for @endorsement_jobInput_label.
  ///
  /// In en, this message translates to:
  /// **'Occupation'**
  String get endorsement_jobInput_label;

  /// No description provided for @endorsement_jobInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter as per ID'**
  String get endorsement_jobInput_placeholder;

  /// No description provided for @endorsement_dateReleaseInput_label.
  ///
  /// In en, this message translates to:
  /// **'Date of Issue'**
  String get endorsement_dateReleaseInput_label;

  /// No description provided for @endorsement_dateReleaseInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get endorsement_dateReleaseInput_placeholder;

  /// No description provided for @endorsement_dateExpirationInput_label.
  ///
  /// In en, this message translates to:
  /// **'Expiration Date'**
  String get endorsement_dateExpirationInput_label;

  /// No description provided for @endorsement_dateExpirationInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get endorsement_dateExpirationInput_placeholder;

  /// No description provided for @endorsement_issuingOfficeInput_label.
  ///
  /// In en, this message translates to:
  /// **'Issuing Office'**
  String get endorsement_issuingOfficeInput_label;

  /// No description provided for @endorsement_issuingOfficeInput_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter Office Name'**
  String get endorsement_issuingOfficeInput_placeholder;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'en',
        'fil',
        'id',
        'ms',
        'sg',
        'th'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fil':
      return AppLocalizationsFil();
    case 'id':
      return AppLocalizationsId();
    case 'ms':
      return AppLocalizationsMs();
    case 'sg':
      return AppLocalizationsSg();
    case 'th':
      return AppLocalizationsTh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
