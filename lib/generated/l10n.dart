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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `My Team`
  String get home_myteam {
    return Intl.message('My Team', name: 'home_myteam', desc: '', args: []);
  }

  /// `Check your email or WhatsApp for the OTP`
  String get otpVerification_title {
    return Intl.message(
      'Check your email or WhatsApp for the OTP',
      name: 'otpVerification_title',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get otpVerification_resend {
    return Intl.message(
      'Resend Code',
      name: 'otpVerification_resend',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get otpVerification_opsModal_nameInput_label {
    return Intl.message(
      'Full Name',
      name: 'otpVerification_opsModal_nameInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter Full Name`
  String get otpVerification_opsModal_nameInput_placeholder {
    return Intl.message(
      'Enter Full Name',
      name: 'otpVerification_opsModal_nameInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get otpVerification_opsModal_phoneInput_label {
    return Intl.message(
      'Phone Number',
      name: 'otpVerification_opsModal_phoneInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter Phone Number`
  String get otpVerification_opsModal_phoneInput_placeholder {
    return Intl.message(
      'Enter Phone Number',
      name: 'otpVerification_opsModal_phoneInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get otpVerification_opsModal_emailInput_label {
    return Intl.message(
      'Email',
      name: 'otpVerification_opsModal_emailInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Example: Example@gmail.com`
  String get otpVerification_opsModal_emailInput_placeholder {
    return Intl.message(
      'Example: Example@gmail.com',
      name: 'otpVerification_opsModal_emailInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Complete this information for optimal protection, and the Teman team will contact you during operational hours, Monday - Friday (08:00 - 17:00)`
  String get otpVerification_opsModal_footer {
    return Intl.message(
      'Complete this information for optimal protection, and the Teman team will contact you during operational hours, Monday - Friday (08:00 - 17:00)',
      name: 'otpVerification_opsModal_footer',
      desc: '',
      args: [],
    );
  }

  /// `Enter the policyholder's information to receive the OTP.`
  String get login_title {
    return Intl.message(
      'Enter the policyholder\'s information to receive the OTP.',
      name: 'login_title',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number (WhatsApp)`
  String get login_phoneInput_label {
    return Intl.message(
      'Phone Number (WhatsApp)',
      name: 'login_phoneInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter Phone Number`
  String get login_phoneInput_placeholder {
    return Intl.message(
      'Enter Phone Number',
      name: 'login_phoneInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get login_emailInput_label {
    return Intl.message(
      'Email',
      name: 'login_emailInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Example: example@gmail.com`
  String get login_emailInput_placeholder {
    return Intl.message(
      'Example: example@gmail.com',
      name: 'login_emailInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Send OTP`
  String get login_submit {
    return Intl.message('Send OTP', name: 'login_submit', desc: '', args: []);
  }

  /// `Your Insurance`
  String get chooseClaim_title {
    return Intl.message(
      'Your Insurance',
      name: 'chooseClaim_title',
      desc: '',
      args: [],
    );
  }

  /// `Select the insurance you want to claim.`
  String get chooseClaim_subtitle {
    return Intl.message(
      'Select the insurance you want to claim.',
      name: 'chooseClaim_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Airpaz Insurance`
  String get chooseClaim_airpaz {
    return Intl.message(
      'Airpaz Insurance',
      name: 'chooseClaim_airpaz',
      desc: '',
      args: [],
    );
  }

  /// `Travel Insurance`
  String get chooseClaim_travel {
    return Intl.message(
      'Travel Insurance',
      name: 'chooseClaim_travel',
      desc: '',
      args: [],
    );
  }

  /// `Personal Accident Insurance`
  String get chooseClaim_pa {
    return Intl.message(
      'Personal Accident Insurance',
      name: 'chooseClaim_pa',
      desc: '',
      args: [],
    );
  }

  /// `Policy Active`
  String get chooseClaim_policy {
    return Intl.message(
      'Policy Active',
      name: 'chooseClaim_policy',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get chooseClaim_history {
    return Intl.message(
      'History',
      name: 'chooseClaim_history',
      desc: '',
      args: [],
    );
  }

  /// `Archive`
  String get chooseClaim_archive {
    return Intl.message(
      'Archive',
      name: 'chooseClaim_archive',
      desc: '',
      args: [],
    );
  }

  /// `Active Claims`
  String get chooseClaim_activeClaim {
    return Intl.message(
      'Active Claims',
      name: 'chooseClaim_activeClaim',
      desc: '',
      args: [],
    );
  }

  /// `List Claim`
  String get chooseClaim_title2 {
    return Intl.message(
      'List Claim',
      name: 'chooseClaim_title2',
      desc: '',
      args: [],
    );
  }

  /// `Watch your Claim Status`
  String get chooseClaim_subtitle2 {
    return Intl.message(
      'Watch your Claim Status',
      name: 'chooseClaim_subtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Claim`
  String get claimSubmission_navTitle {
    return Intl.message(
      'Insurance Claim',
      name: 'claimSubmission_navTitle',
      desc: '',
      args: [],
    );
  }

  /// `Airpaz Insurance`
  String get claimSubmission_airpaz {
    return Intl.message(
      'Airpaz Insurance',
      name: 'claimSubmission_airpaz',
      desc: '',
      args: [],
    );
  }

  /// `Travel Insurance`
  String get claimSubmission_travel {
    return Intl.message(
      'Travel Insurance',
      name: 'claimSubmission_travel',
      desc: '',
      args: [],
    );
  }

  /// `Personal Accident Insurance`
  String get claimSubmission_pa {
    return Intl.message(
      'Personal Accident Insurance',
      name: 'claimSubmission_pa',
      desc: '',
      args: [],
    );
  }

  /// `Driver`
  String get claimSubmission_driver {
    return Intl.message(
      'Driver',
      name: 'claimSubmission_driver',
      desc: '',
      args: [],
    );
  }

  /// `Passenger`
  String get claimSubmission_passenger {
    return Intl.message(
      'Passenger',
      name: 'claimSubmission_passenger',
      desc: '',
      args: [],
    );
  }

  /// `Policy Holder Information`
  String get claimSubmission_cardPolicyHolder_title {
    return Intl.message(
      'Policy Holder Information',
      name: 'claimSubmission_cardPolicyHolder_title',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get claimSubmission_cardPolicyHolder_name {
    return Intl.message(
      'Full Name',
      name: 'claimSubmission_cardPolicyHolder_name',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get claimSubmission_cardPolicyHolder_phone {
    return Intl.message(
      'Phone Number',
      name: 'claimSubmission_cardPolicyHolder_phone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get claimSubmission_cardPolicyHolder_email {
    return Intl.message(
      'Email',
      name: 'claimSubmission_cardPolicyHolder_email',
      desc: '',
      args: [],
    );
  }

  /// `Policy No.`
  String get claimSubmission_cardPolicyHolder_policyNumber {
    return Intl.message(
      'Policy No.',
      name: 'claimSubmission_cardPolicyHolder_policyNumber',
      desc: '',
      args: [],
    );
  }

  /// `Reporter Information`
  String get claimSubmission_accordionReporterInfo_title {
    return Intl.message(
      'Reporter Information',
      name: 'claimSubmission_accordionReporterInfo_title',
      desc: '',
      args: [],
    );
  }

  /// `Is the reporter the same as the insured?`
  String get claimSubmission_accordionReporterInfo_isInsuredInput_label {
    return Intl.message(
      'Is the reporter the same as the insured?',
      name: 'claimSubmission_accordionReporterInfo_isInsuredInput_label',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get claimSubmission_accordionReporterInfo_isInsuredInput_placeholder {
    return Intl.message(
      '',
      name: 'claimSubmission_accordionReporterInfo_isInsuredInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Reporter Name`
  String get claimSubmission_accordionReporterInfo_nameInput_label {
    return Intl.message(
      'Reporter Name',
      name: 'claimSubmission_accordionReporterInfo_nameInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Reporter Name`
  String get claimSubmission_accordionReporterInfo_nameInput_placeholder {
    return Intl.message(
      'Reporter Name',
      name: 'claimSubmission_accordionReporterInfo_nameInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Relationship with the insured`
  String get claimSubmission_accordionReporterInfo_relationshipInput_label {
    return Intl.message(
      'Relationship with the insured',
      name: 'claimSubmission_accordionReporterInfo_relationshipInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Select relationship`
  String
  get claimSubmission_accordionReporterInfo_relationshipInput_placeholder {
    return Intl.message(
      'Select relationship',
      name:
          'claimSubmission_accordionReporterInfo_relationshipInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get claimSubmission_accordionReporterInfo_phoneInput_label {
    return Intl.message(
      'Phone Number',
      name: 'claimSubmission_accordionReporterInfo_phoneInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get claimSubmission_accordionReporterInfo_phoneInput_placeholder {
    return Intl.message(
      'Phone Number',
      name: 'claimSubmission_accordionReporterInfo_phoneInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Insured Data`
  String get claimSubmission_accordionInsuredInfo_title {
    return Intl.message(
      'Insured Data',
      name: 'claimSubmission_accordionInsuredInfo_title',
      desc: '',
      args: [],
    );
  }

  /// `Select Insured`
  String get claimSubmission_accordionInsuredInfo_select {
    return Intl.message(
      'Select Insured',
      name: 'claimSubmission_accordionInsuredInfo_select',
      desc: '',
      args: [],
    );
  }

  /// `Policy Number`
  String get claimSubmission_accordionInsuredInfo_noPolicy {
    return Intl.message(
      'Policy Number',
      name: 'claimSubmission_accordionInsuredInfo_noPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Participant Number`
  String get claimSubmission_accordionInsuredInfo_noParticipant {
    return Intl.message(
      'Participant Number',
      name: 'claimSubmission_accordionInsuredInfo_noParticipant',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get claimSubmission_accordionInsuredInfo_fullName {
    return Intl.message(
      'Full Name',
      name: 'claimSubmission_accordionInsuredInfo_fullName',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get claimSubmission_accordionInsuredInfo_gender {
    return Intl.message(
      'Gender',
      name: 'claimSubmission_accordionInsuredInfo_gender',
      desc: '',
      args: [],
    );
  }

  /// `Country Code`
  String get claimSubmission_accordionInsuredInfo_countryCode {
    return Intl.message(
      'Country Code',
      name: 'claimSubmission_accordionInsuredInfo_countryCode',
      desc: '',
      args: [],
    );
  }

  /// `Passport Number`
  String get claimSubmission_accordionInsuredInfo_noPassport {
    return Intl.message(
      'Passport Number',
      name: 'claimSubmission_accordionInsuredInfo_noPassport',
      desc: '',
      args: [],
    );
  }

  /// `National ID Number`
  String get claimSubmission_accordionInsuredInfo_noID {
    return Intl.message(
      'National ID Number',
      name: 'claimSubmission_accordionInsuredInfo_noID',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get claimSubmission_accordionInsuredInfo_nationality {
    return Intl.message(
      'Nationality',
      name: 'claimSubmission_accordionInsuredInfo_nationality',
      desc: '',
      args: [],
    );
  }

  /// `Place/Date of Birth`
  String get claimSubmission_accordionInsuredInfo_dob {
    return Intl.message(
      'Place/Date of Birth',
      name: 'claimSubmission_accordionInsuredInfo_dob',
      desc: '',
      args: [],
    );
  }

  /// `Place of Birth`
  String get claimSubmission_accordionInsuredInfo_pob {
    return Intl.message(
      'Place of Birth',
      name: 'claimSubmission_accordionInsuredInfo_pob',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get claimSubmission_accordionInsuredInfo_address {
    return Intl.message(
      'Address',
      name: 'claimSubmission_accordionInsuredInfo_address',
      desc: '',
      args: [],
    );
  }

  /// `Occupation`
  String get claimSubmission_accordionInsuredInfo_job {
    return Intl.message(
      'Occupation',
      name: 'claimSubmission_accordionInsuredInfo_job',
      desc: '',
      args: [],
    );
  }

  /// `Date of Issue`
  String get claimSubmission_accordionInsuredInfo_dateRelease {
    return Intl.message(
      'Date of Issue',
      name: 'claimSubmission_accordionInsuredInfo_dateRelease',
      desc: '',
      args: [],
    );
  }

  /// `Expiration Date`
  String get claimSubmission_accordionInsuredInfo_dateExpiration {
    return Intl.message(
      'Expiration Date',
      name: 'claimSubmission_accordionInsuredInfo_dateExpiration',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get claimSubmission_accordionPersonalInfo_title {
    return Intl.message(
      'Personal Information',
      name: 'claimSubmission_accordionPersonalInfo_title',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number (WhatsApp)`
  String get claimSubmission_accordionPersonalInfo_phoneInput_label {
    return Intl.message(
      'Phone Number (WhatsApp)',
      name: 'claimSubmission_accordionPersonalInfo_phoneInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter Phone Number`
  String get claimSubmission_accordionPersonalInfo_phoneInput_placeholder {
    return Intl.message(
      'Enter Phone Number',
      name: 'claimSubmission_accordionPersonalInfo_phoneInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Claim Mailing Address`
  String get claimSubmission_accordionPersonalInfo_addressInput_label {
    return Intl.message(
      'Claim Mailing Address',
      name: 'claimSubmission_accordionPersonalInfo_addressInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get claimSubmission_accordionPersonalInfo_addressInput_placeholder {
    return Intl.message(
      'Address',
      name: 'claimSubmission_accordionPersonalInfo_addressInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get claimSubmission_accordionPersonalInfo_countryInput_placeholder {
    return Intl.message(
      'Country',
      name: 'claimSubmission_accordionPersonalInfo_countryInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `State/Province`
  String get claimSubmission_accordionPersonalInfo_stateInput_placeholder {
    return Intl.message(
      'State/Province',
      name: 'claimSubmission_accordionPersonalInfo_stateInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `City/District`
  String get claimSubmission_accordionPersonalInfo_cityInput_placeholder {
    return Intl.message(
      'City/District',
      name: 'claimSubmission_accordionPersonalInfo_cityInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Subdistrict`
  String get claimSubmission_accordionPersonalInfo_districtInput_placeholder {
    return Intl.message(
      'Subdistrict',
      name: 'claimSubmission_accordionPersonalInfo_districtInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Village/Subdivision`
  String
  get claimSubmission_accordionPersonalInfo_subdistrictInput_placeholder {
    return Intl.message(
      'Village/Subdivision',
      name:
          'claimSubmission_accordionPersonalInfo_subdistrictInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Postal Code`
  String get claimSubmission_accordionPersonalInfo_postalCodeInput_placeholder {
    return Intl.message(
      'Postal Code',
      name: 'claimSubmission_accordionPersonalInfo_postalCodeInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Street 1`
  String get claimSubmission_accordionPersonalInfo_street1Input_placeholder {
    return Intl.message(
      'Street 1',
      name: 'claimSubmission_accordionPersonalInfo_street1Input_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Street 2`
  String get claimSubmission_accordionPersonalInfo_street2Input_placeholder {
    return Intl.message(
      'Street 2',
      name: 'claimSubmission_accordionPersonalInfo_street2Input_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Policy Information of the Insured`
  String get claimSubmission_accordionPolicy_title {
    return Intl.message(
      'Policy Information of the Insured',
      name: 'claimSubmission_accordionPolicy_title',
      desc: '',
      args: [],
    );
  }

  /// `Policy Number (optional)`
  String get claimSubmission_accordionPolicy_policyNoInput_label {
    return Intl.message(
      'Policy Number (optional)',
      name: 'claimSubmission_accordionPolicy_policyNoInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter Policy Number`
  String get claimSubmission_accordionPolicy_policyNoInput_placeholder {
    return Intl.message(
      'Enter Policy Number',
      name: 'claimSubmission_accordionPolicy_policyNoInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Upload Policy Document (optional)`
  String get claimSubmission_accordionPolicy_policyFileInput_label {
    return Intl.message(
      'Upload Policy Document (optional)',
      name: 'claimSubmission_accordionPolicy_policyFileInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Upload File`
  String get claimSubmission_accordionPolicy_policyFileInput_placeholder {
    return Intl.message(
      'Upload File',
      name: 'claimSubmission_accordionPolicy_policyFileInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Bank Account Information`
  String get claimSubmission_accordionAccountInfo_title {
    return Intl.message(
      'Bank Account Information',
      name: 'claimSubmission_accordionAccountInfo_title',
      desc: '',
      args: [],
    );
  }

  /// `Account Holder Name`
  String get claimSubmission_accordionAccountInfo_accountName_input {
    return Intl.message(
      'Account Holder Name',
      name: 'claimSubmission_accordionAccountInfo_accountName_input',
      desc: '',
      args: [],
    );
  }

  /// `Enter name as per the passbook`
  String get claimSubmission_accordionAccountInfo_accountName_placeholder {
    return Intl.message(
      'Enter name as per the passbook',
      name: 'claimSubmission_accordionAccountInfo_accountName_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Account Holder Name`
  String get claimSubmission_accordionAccountInfo_accountNameInput_label {
    return Intl.message(
      'Account Holder Name',
      name: 'claimSubmission_accordionAccountInfo_accountNameInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter name as per the passbook`
  String get claimSubmission_accordionAccountInfo_accountNameInput_placeholder {
    return Intl.message(
      'Enter name as per the passbook',
      name: 'claimSubmission_accordionAccountInfo_accountNameInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Select Bank`
  String get claimSubmission_accordionAccountInfo_bankInput_label {
    return Intl.message(
      'Select Bank',
      name: 'claimSubmission_accordionAccountInfo_bankInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Select Bank`
  String get claimSubmission_accordionAccountInfo_bankInput_placeholder {
    return Intl.message(
      'Select Bank',
      name: 'claimSubmission_accordionAccountInfo_bankInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Bank Name`
  String get claimSubmission_accordionAccountInfo_bankNameInput_label {
    return Intl.message(
      'Bank Name',
      name: 'claimSubmission_accordionAccountInfo_bankNameInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter Bank Name`
  String get claimSubmission_accordionAccountInfo_bankNameInput_placeholder {
    return Intl.message(
      'Enter Bank Name',
      name: 'claimSubmission_accordionAccountInfo_bankNameInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Bank Branch`
  String get claimSubmission_accordionAccountInfo_bankBranchInput_label {
    return Intl.message(
      'Bank Branch',
      name: 'claimSubmission_accordionAccountInfo_bankBranchInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter Bank Branch`
  String get claimSubmission_accordionAccountInfo_bankBranchInput_placeholder {
    return Intl.message(
      'Enter Bank Branch',
      name: 'claimSubmission_accordionAccountInfo_bankBranchInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Account Number`
  String get claimSubmission_accordionAccountInfo_accountNumberInput_label {
    return Intl.message(
      'Account Number',
      name: 'claimSubmission_accordionAccountInfo_accountNumberInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter Account Number`
  String
  get claimSubmission_accordionAccountInfo_accountNumberInput_placeholder {
    return Intl.message(
      'Enter Account Number',
      name:
          'claimSubmission_accordionAccountInfo_accountNumberInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Claim Type`
  String get claimSubmission_accordionClaimBenefit_title {
    return Intl.message(
      'Claim Type',
      name: 'claimSubmission_accordionClaimBenefit_title',
      desc: '',
      args: [],
    );
  }

  /// `Benefit Information`
  String get claimSubmission_accordionClaimBenefit_benefitInfo {
    return Intl.message(
      'Benefit Information',
      name: 'claimSubmission_accordionClaimBenefit_benefitInfo',
      desc: '',
      args: [],
    );
  }

  /// `Service Type`
  String get claimSubmission_accordionClaimBenefit_serviceTypeInput_label {
    return Intl.message(
      'Service Type',
      name: 'claimSubmission_accordionClaimBenefit_serviceTypeInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Select service type`
  String
  get claimSubmission_accordionClaimBenefit_serviceTypeInput_placeholder {
    return Intl.message(
      'Select service type',
      name:
          'claimSubmission_accordionClaimBenefit_serviceTypeInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Claim Type`
  String get claimSubmission_accordionClaimBenefit_benefitInput_label {
    return Intl.message(
      'Claim Type',
      name: 'claimSubmission_accordionClaimBenefit_benefitInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Select claim type`
  String get claimSubmission_accordionClaimBenefit_benefitInput_placeholder {
    return Intl.message(
      'Select claim type',
      name: 'claimSubmission_accordionClaimBenefit_benefitInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `General Documents`
  String get claimSubmission_accordionGeneralDoc_title {
    return Intl.message(
      'General Documents',
      name: 'claimSubmission_accordionGeneralDoc_title',
      desc: '',
      args: [],
    );
  }

  /// `Supporting Documents`
  String get claimSubmission_accordionSupportingDoc_title {
    return Intl.message(
      'Supporting Documents',
      name: 'claimSubmission_accordionSupportingDoc_title',
      desc: '',
      args: [],
    );
  }

  /// `Claim Detail`
  String get claimSubmission_accordionClaimDetails_title {
    return Intl.message(
      'Claim Detail',
      name: 'claimSubmission_accordionClaimDetails_title',
      desc: '',
      args: [],
    );
  }

  /// `Claim Insurance`
  String get claimBenefitUploads_navTitle {
    return Intl.message(
      'Claim Insurance',
      name: 'claimBenefitUploads_navTitle',
      desc: '',
      args: [],
    );
  }

  /// `Airpaz Claim`
  String get claimBenefitUploads_airpaz {
    return Intl.message(
      'Airpaz Claim',
      name: 'claimBenefitUploads_airpaz',
      desc: '',
      args: [],
    );
  }

  /// `Travel Insurance`
  String get claimBenefitUploads_travel {
    return Intl.message(
      'Travel Insurance',
      name: 'claimBenefitUploads_travel',
      desc: '',
      args: [],
    );
  }

  /// `Personal Accident Insurance`
  String get claimBenefitUploads_pa {
    return Intl.message(
      'Personal Accident Insurance',
      name: 'claimBenefitUploads_pa',
      desc: '',
      args: [],
    );
  }

  /// `General Documents`
  String get claimBenefitUploads_generalDoc {
    return Intl.message(
      'General Documents',
      name: 'claimBenefitUploads_generalDoc',
      desc: '',
      args: [],
    );
  }

  /// `Describe the chronology of events`
  String get claimBenefitUploads_chronologyInput_placeholder {
    return Intl.message(
      'Describe the chronology of events',
      name: 'claimBenefitUploads_chronologyInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Save draft success`
  String get claimBenefitUploads_alerts_successSaveDraft {
    return Intl.message(
      'Save draft success',
      name: 'claimBenefitUploads_alerts_successSaveDraft',
      desc: '',
      args: [],
    );
  }

  /// `Save draft failed`
  String get claimBenefitUploads_alerts_failedSaveDraft {
    return Intl.message(
      'Save draft failed',
      name: 'claimBenefitUploads_alerts_failedSaveDraft',
      desc: '',
      args: [],
    );
  }

  /// `You have not completed the file upload process`
  String get claimBenefitUploads_changesUnsavedAlert_title {
    return Intl.message(
      'You have not completed the file upload process',
      name: 'claimBenefitUploads_changesUnsavedAlert_title',
      desc: '',
      args: [],
    );
  }

  /// `Save the claim submission as a draft?`
  String get claimBenefitUploads_changesUnsavedAlert_description {
    return Intl.message(
      'Save the claim submission as a draft?',
      name: 'claimBenefitUploads_changesUnsavedAlert_description',
      desc: '',
      args: [],
    );
  }

  /// `No, go back to home`
  String get claimBenefitUploads_changesUnsavedAlert_confirmBack {
    return Intl.message(
      'No, go back to home',
      name: 'claimBenefitUploads_changesUnsavedAlert_confirmBack',
      desc: '',
      args: [],
    );
  }

  /// `Yes, save as draft`
  String get claimBenefitUploads_changesUnsavedAlert_confirmSave {
    return Intl.message(
      'Yes, save as draft',
      name: 'claimBenefitUploads_changesUnsavedAlert_confirmSave',
      desc: '',
      args: [],
    );
  }

  /// `Claim Insurance`
  String get claimPreview_navTitle {
    return Intl.message(
      'Claim Insurance',
      name: 'claimPreview_navTitle',
      desc: '',
      args: [],
    );
  }

  /// `Airpaz Insurance`
  String get claimPreview_airpaz {
    return Intl.message(
      'Airpaz Insurance',
      name: 'claimPreview_airpaz',
      desc: '',
      args: [],
    );
  }

  /// `Travel Insurance`
  String get claimPreview_travel {
    return Intl.message(
      'Travel Insurance',
      name: 'claimPreview_travel',
      desc: '',
      args: [],
    );
  }

  /// `Personal Accident Insurance`
  String get claimPreview_pa {
    return Intl.message(
      'Personal Accident Insurance',
      name: 'claimPreview_pa',
      desc: '',
      args: [],
    );
  }

  /// `Policyholder`
  String get claimPreview_cardPolicyHolder_title {
    return Intl.message(
      'Policyholder',
      name: 'claimPreview_cardPolicyHolder_title',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get claimPreview_cardPolicyHolder_name {
    return Intl.message(
      'Full Name',
      name: 'claimPreview_cardPolicyHolder_name',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get claimPreview_cardPolicyHolder_phone {
    return Intl.message(
      'Phone Number',
      name: 'claimPreview_cardPolicyHolder_phone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get claimPreview_cardPolicyHolder_email {
    return Intl.message(
      'Email',
      name: 'claimPreview_cardPolicyHolder_email',
      desc: '',
      args: [],
    );
  }

  /// `Policy No.`
  String get claimPreview_cardPolicyHolder_policyNumber {
    return Intl.message(
      'Policy No.',
      name: 'claimPreview_cardPolicyHolder_policyNumber',
      desc: '',
      args: [],
    );
  }

  /// `Insured Name`
  String get claimPreview_cardInsuredInfo_title {
    return Intl.message(
      'Insured Name',
      name: 'claimPreview_cardInsuredInfo_title',
      desc: '',
      args: [],
    );
  }

  /// `Policy No.`
  String get claimPreview_cardInsuredInfo_noPolicy {
    return Intl.message(
      'Policy No.',
      name: 'claimPreview_cardInsuredInfo_noPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Participant No.`
  String get claimPreview_cardInsuredInfo_noParticipant {
    return Intl.message(
      'Participant No.',
      name: 'claimPreview_cardInsuredInfo_noParticipant',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get claimPreview_cardInsuredInfo_fullName {
    return Intl.message(
      'Full Name',
      name: 'claimPreview_cardInsuredInfo_fullName',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get claimPreview_cardInsuredInfo_gender {
    return Intl.message(
      'Gender',
      name: 'claimPreview_cardInsuredInfo_gender',
      desc: '',
      args: [],
    );
  }

  /// `Country Code`
  String get claimPreview_cardInsuredInfo_countryCode {
    return Intl.message(
      'Country Code',
      name: 'claimPreview_cardInsuredInfo_countryCode',
      desc: '',
      args: [],
    );
  }

  /// `Passport Number`
  String get claimPreview_cardInsuredInfo_noPassport {
    return Intl.message(
      'Passport Number',
      name: 'claimPreview_cardInsuredInfo_noPassport',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get claimPreview_cardInsuredInfo_nationality {
    return Intl.message(
      'Nationality',
      name: 'claimPreview_cardInsuredInfo_nationality',
      desc: '',
      args: [],
    );
  }

  /// `Place/Date of Birth`
  String get claimPreview_cardInsuredInfo_dob {
    return Intl.message(
      'Place/Date of Birth',
      name: 'claimPreview_cardInsuredInfo_dob',
      desc: '',
      args: [],
    );
  }

  /// `Place of Birth`
  String get claimPreview_cardInsuredInfo_pob {
    return Intl.message(
      'Place of Birth',
      name: 'claimPreview_cardInsuredInfo_pob',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get claimPreview_cardInsuredInfo_address {
    return Intl.message(
      'Address',
      name: 'claimPreview_cardInsuredInfo_address',
      desc: '',
      args: [],
    );
  }

  /// `Occupation`
  String get claimPreview_cardInsuredInfo_job {
    return Intl.message(
      'Occupation',
      name: 'claimPreview_cardInsuredInfo_job',
      desc: '',
      args: [],
    );
  }

  /// `Issue Date`
  String get claimPreview_cardInsuredInfo_dateRelease {
    return Intl.message(
      'Issue Date',
      name: 'claimPreview_cardInsuredInfo_dateRelease',
      desc: '',
      args: [],
    );
  }

  /// `Expiration Date`
  String get claimPreview_cardInsuredInfo_dateExpiration {
    return Intl.message(
      'Expiration Date',
      name: 'claimPreview_cardInsuredInfo_dateExpiration',
      desc: '',
      args: [],
    );
  }

  /// `Claim Requested`
  String get claimPreview_cardClaimRequested_title {
    return Intl.message(
      'Claim Requested',
      name: 'claimPreview_cardClaimRequested_title',
      desc: '',
      args: [],
    );
  }

  /// `I have read, understood, and agree to the`
  String get claimPreview_cardClaimRequested_checkTnc1 {
    return Intl.message(
      'I have read, understood, and agree to the',
      name: 'claimPreview_cardClaimRequested_checkTnc1',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get claimPreview_cardClaimRequested_checkTnc2 {
    return Intl.message(
      'Terms and Conditions',
      name: 'claimPreview_cardClaimRequested_checkTnc2',
      desc: '',
      args: [],
    );
  }

  /// `applicable at Teman`
  String get claimPreview_cardClaimRequested_checkTnc3 {
    return Intl.message(
      'applicable at Teman',
      name: 'claimPreview_cardClaimRequested_checkTnc3',
      desc: '',
      args: [],
    );
  }

  /// `Success!`
  String get claimSuccess_title {
    return Intl.message(
      'Success!',
      name: 'claimSuccess_title',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for your trust in submitting an insurance claim through Teman.`
  String get claimSuccess_subtitle {
    return Intl.message(
      'Thank you for your trust in submitting an insurance claim through Teman.',
      name: 'claimSuccess_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email to see your claim report`
  String get claimSuccess_desc {
    return Intl.message(
      'Please check your email to see your claim report',
      name: 'claimSuccess_desc',
      desc: '',
      args: [],
    );
  }

  /// `Back to Home`
  String get claimSuccess_backToHome {
    return Intl.message(
      'Back to Home',
      name: 'claimSuccess_backToHome',
      desc: '',
      args: [],
    );
  }

  /// `List Claims`
  String get listClaim_title {
    return Intl.message(
      'List Claims',
      name: 'listClaim_title',
      desc: '',
      args: [],
    );
  }

  /// `Monitor your claim status`
  String get listClaim_subtitle {
    return Intl.message(
      'Monitor your claim status',
      name: 'listClaim_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Search name, insurance, or policy number`
  String get listClaim_search_placeholder {
    return Intl.message(
      'Search name, insurance, or policy number',
      name: 'listClaim_search_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get listClaim_history_title {
    return Intl.message(
      'History',
      name: 'listClaim_history_title',
      desc: '',
      args: [],
    );
  }

  /// `Currently you have not Claim history yet`
  String get listClaim_history_empty {
    return Intl.message(
      'Currently you have not Claim history yet',
      name: 'listClaim_history_empty',
      desc: '',
      args: [],
    );
  }

  /// `Claim History`
  String get listClaim_history_navigation {
    return Intl.message(
      'Claim History',
      name: 'listClaim_history_navigation',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get listClaim_filterDate_title {
    return Intl.message(
      'Select Date',
      name: 'listClaim_filterDate_title',
      desc: '',
      args: [],
    );
  }

  /// `All Dates`
  String get listClaim_filterDate_placeholder {
    return Intl.message(
      'All Dates',
      name: 'listClaim_filterDate_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `All Claim Dates`
  String get listClaim_filterDate_opt1 {
    return Intl.message(
      'All Claim Dates',
      name: 'listClaim_filterDate_opt1',
      desc: '',
      args: [],
    );
  }

  /// `Select Your Own Date`
  String get listClaim_filterDate_opt2 {
    return Intl.message(
      'Select Your Own Date',
      name: 'listClaim_filterDate_opt2',
      desc: '',
      args: [],
    );
  }

  /// `Select Start Date`
  String get listClaim_filterDate_startDate {
    return Intl.message(
      'Select Start Date',
      name: 'listClaim_filterDate_startDate',
      desc: '',
      args: [],
    );
  }

  /// `Select End Date`
  String get listClaim_filterDate_endDate {
    return Intl.message(
      'Select End Date',
      name: 'listClaim_filterDate_endDate',
      desc: '',
      args: [],
    );
  }

  /// `Select Status`
  String get listClaim_filterStatus_title {
    return Intl.message(
      'Select Status',
      name: 'listClaim_filterStatus_title',
      desc: '',
      args: [],
    );
  }

  /// `All Status`
  String get listClaim_filterStatus_placeholder {
    return Intl.message(
      'All Status',
      name: 'listClaim_filterStatus_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get listClaim_status_all {
    return Intl.message(
      'All',
      name: 'listClaim_status_all',
      desc: '',
      args: [],
    );
  }

  /// `Draft`
  String get listClaim_status_draft {
    return Intl.message(
      'Draft',
      name: 'listClaim_status_draft',
      desc: '',
      args: [],
    );
  }

  /// `All ongoing claim processes`
  String get listClaim_status_allProcessing {
    return Intl.message(
      'All ongoing claim processes',
      name: 'listClaim_status_allProcessing',
      desc: '',
      args: [],
    );
  }

  /// `Submission sent`
  String get listClaim_status_submitted {
    return Intl.message(
      'Submission sent',
      name: 'listClaim_status_submitted',
      desc: '',
      args: [],
    );
  }

  /// `Submission received`
  String get listClaim_status_acknowledged {
    return Intl.message(
      'Submission received',
      name: 'listClaim_status_acknowledged',
      desc: '',
      args: [],
    );
  }

  /// `Document review`
  String get listClaim_status_documentReview {
    return Intl.message(
      'Document review',
      name: 'listClaim_status_documentReview',
      desc: '',
      args: [],
    );
  }

  /// `Claim in process`
  String get listClaim_status_claimAssessment {
    return Intl.message(
      'Claim in process',
      name: 'listClaim_status_claimAssessment',
      desc: '',
      args: [],
    );
  }

  /// `Approved`
  String get listClaim_status_approved {
    return Intl.message(
      'Approved',
      name: 'listClaim_status_approved',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get listClaim_status_paid {
    return Intl.message(
      'Payment',
      name: 'listClaim_status_paid',
      desc: '',
      args: [],
    );
  }

  /// `Claim Closed`
  String get listClaim_status_closed {
    return Intl.message(
      'Claim Closed',
      name: 'listClaim_status_closed',
      desc: '',
      args: [],
    );
  }

  /// `All rejected claim statuses`
  String get listClaim_status_allRejected {
    return Intl.message(
      'All rejected claim statuses',
      name: 'listClaim_status_allRejected',
      desc: '',
      args: [],
    );
  }

  /// `Missing Documents`
  String get listClaim_status_lackOfDocuments {
    return Intl.message(
      'Missing Documents',
      name: 'listClaim_status_lackOfDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Rejected`
  String get listClaim_status_rejected {
    return Intl.message(
      'Rejected',
      name: 'listClaim_status_rejected',
      desc: '',
      args: [],
    );
  }

  /// `Claim ID`
  String get listClaim_idClaim {
    return Intl.message(
      'Claim ID',
      name: 'listClaim_idClaim',
      desc: '',
      args: [],
    );
  }

  /// `There are no claims yet.\nCreate a claim from the Create New menu`
  String get listClaim_noClaim {
    return Intl.message(
      'There are no claims yet.\nCreate a claim from the Create New menu',
      name: 'listClaim_noClaim',
      desc: '',
      args: [],
    );
  }

  /// `View`
  String get claimDetail_see {
    return Intl.message('View', name: 'claimDetail_see', desc: '', args: []);
  }

  /// `Claim Detail`
  String get claimDetail_navTitle {
    return Intl.message(
      'Claim Detail',
      name: 'claimDetail_navTitle',
      desc: '',
      args: [],
    );
  }

  /// `Claim Airpaz`
  String get claimDetail_airpaz {
    return Intl.message(
      'Claim Airpaz',
      name: 'claimDetail_airpaz',
      desc: '',
      args: [],
    );
  }

  /// `Claim Travel Insurance`
  String get claimDetail_travel {
    return Intl.message(
      'Claim Travel Insurance',
      name: 'claimDetail_travel',
      desc: '',
      args: [],
    );
  }

  /// `Claim Personal Accident Insurance`
  String get claimDetail_pa {
    return Intl.message(
      'Claim Personal Accident Insurance',
      name: 'claimDetail_pa',
      desc: '',
      args: [],
    );
  }

  /// `View Detail`
  String get claimDetail_cardJourney_view {
    return Intl.message(
      'View Detail',
      name: 'claimDetail_cardJourney_view',
      desc: '',
      args: [],
    );
  }

  /// `Claim ID`
  String get claimDetail_cardJourney_claimId {
    return Intl.message(
      'Claim ID',
      name: 'claimDetail_cardJourney_claimId',
      desc: '',
      args: [],
    );
  }

  /// `Claim Journey`
  String get claimDetail_cardJourney_viewDetail {
    return Intl.message(
      'Claim Journey',
      name: 'claimDetail_cardJourney_viewDetail',
      desc: '',
      args: [],
    );
  }

  /// `Approved amount`
  String get claimDetail_cardJourney_approvedAmount {
    return Intl.message(
      'Approved amount',
      name: 'claimDetail_cardJourney_approvedAmount',
      desc: '',
      args: [],
    );
  }

  /// `Policyholder Information`
  String get claimDetail_cardPolicyHolder_title {
    return Intl.message(
      'Policyholder Information',
      name: 'claimDetail_cardPolicyHolder_title',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get claimDetail_cardPolicyHolder_name {
    return Intl.message(
      'Full Name',
      name: 'claimDetail_cardPolicyHolder_name',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get claimDetail_cardPolicyHolder_phone {
    return Intl.message(
      'Phone Number',
      name: 'claimDetail_cardPolicyHolder_phone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get claimDetail_cardPolicyHolder_email {
    return Intl.message(
      'Email',
      name: 'claimDetail_cardPolicyHolder_email',
      desc: '',
      args: [],
    );
  }

  /// `Policy No.`
  String get claimDetail_cardPolicyHolder_policyNumber {
    return Intl.message(
      'Policy No.',
      name: 'claimDetail_cardPolicyHolder_policyNumber',
      desc: '',
      args: [],
    );
  }

  /// `Insured Name`
  String get claimDetail_cardInsuredInfo_title {
    return Intl.message(
      'Insured Name',
      name: 'claimDetail_cardInsuredInfo_title',
      desc: '',
      args: [],
    );
  }

  /// `Policy No.`
  String get claimDetail_cardInsuredInfo_noPolicy {
    return Intl.message(
      'Policy No.',
      name: 'claimDetail_cardInsuredInfo_noPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Participant No.`
  String get claimDetail_cardInsuredInfo_noParticipant {
    return Intl.message(
      'Participant No.',
      name: 'claimDetail_cardInsuredInfo_noParticipant',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get claimDetail_cardInsuredInfo_fullName {
    return Intl.message(
      'Full Name',
      name: 'claimDetail_cardInsuredInfo_fullName',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get claimDetail_cardInsuredInfo_gender {
    return Intl.message(
      'Gender',
      name: 'claimDetail_cardInsuredInfo_gender',
      desc: '',
      args: [],
    );
  }

  /// `Country Code`
  String get claimDetail_cardInsuredInfo_countryCode {
    return Intl.message(
      'Country Code',
      name: 'claimDetail_cardInsuredInfo_countryCode',
      desc: '',
      args: [],
    );
  }

  /// `Passport Number`
  String get claimDetail_cardInsuredInfo_noPassport {
    return Intl.message(
      'Passport Number',
      name: 'claimDetail_cardInsuredInfo_noPassport',
      desc: '',
      args: [],
    );
  }

  /// `ID Card No.`
  String get claimDetail_cardInsuredInfo_noID {
    return Intl.message(
      'ID Card No.',
      name: 'claimDetail_cardInsuredInfo_noID',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get claimDetail_cardInsuredInfo_nationality {
    return Intl.message(
      'Nationality',
      name: 'claimDetail_cardInsuredInfo_nationality',
      desc: '',
      args: [],
    );
  }

  /// `Place/Date of Birth`
  String get claimDetail_cardInsuredInfo_dob {
    return Intl.message(
      'Place/Date of Birth',
      name: 'claimDetail_cardInsuredInfo_dob',
      desc: '',
      args: [],
    );
  }

  /// `Place of Birth`
  String get claimDetail_cardInsuredInfo_pob {
    return Intl.message(
      'Place of Birth',
      name: 'claimDetail_cardInsuredInfo_pob',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get claimDetail_cardInsuredInfo_address {
    return Intl.message(
      'Address',
      name: 'claimDetail_cardInsuredInfo_address',
      desc: '',
      args: [],
    );
  }

  /// `Occupation`
  String get claimDetail_cardInsuredInfo_job {
    return Intl.message(
      'Occupation',
      name: 'claimDetail_cardInsuredInfo_job',
      desc: '',
      args: [],
    );
  }

  /// `Issue Date`
  String get claimDetail_cardInsuredInfo_dateRelease {
    return Intl.message(
      'Issue Date',
      name: 'claimDetail_cardInsuredInfo_dateRelease',
      desc: '',
      args: [],
    );
  }

  /// `Expiration Date`
  String get claimDetail_cardInsuredInfo_dateExpiration {
    return Intl.message(
      'Expiration Date',
      name: 'claimDetail_cardInsuredInfo_dateExpiration',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get claimDetail_cardPersonalInfo_title {
    return Intl.message(
      'Personal Information',
      name: 'claimDetail_cardPersonalInfo_title',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get claimDetail_cardPersonalInfo_phone {
    return Intl.message(
      'Phone Number',
      name: 'claimDetail_cardPersonalInfo_phone',
      desc: '',
      args: [],
    );
  }

  /// `Account Information`
  String get claimDetail_cardAccountInfo_title {
    return Intl.message(
      'Account Information',
      name: 'claimDetail_cardAccountInfo_title',
      desc: '',
      args: [],
    );
  }

  /// `Account Holder Name`
  String get claimDetail_cardAccountInfo_accountName {
    return Intl.message(
      'Account Holder Name',
      name: 'claimDetail_cardAccountInfo_accountName',
      desc: '',
      args: [],
    );
  }

  /// `Bank Name`
  String get claimDetail_cardAccountInfo_bankName {
    return Intl.message(
      'Bank Name',
      name: 'claimDetail_cardAccountInfo_bankName',
      desc: '',
      args: [],
    );
  }

  /// `Bank Branch`
  String get claimDetail_cardAccountInfo_bankBranch {
    return Intl.message(
      'Bank Branch',
      name: 'claimDetail_cardAccountInfo_bankBranch',
      desc: '',
      args: [],
    );
  }

  /// `Account Number`
  String get claimDetail_cardAccountInfo_accountNumber {
    return Intl.message(
      'Account Number',
      name: 'claimDetail_cardAccountInfo_accountNumber',
      desc: '',
      args: [],
    );
  }

  /// `General Documents`
  String get claimDetail_cardGeneralDocuments_title {
    return Intl.message(
      'General Documents',
      name: 'claimDetail_cardGeneralDocuments_title',
      desc: '',
      args: [],
    );
  }

  /// `Supporting Documents`
  String get claimDetail_cardSupportingDocuments_title {
    return Intl.message(
      'Supporting Documents',
      name: 'claimDetail_cardSupportingDocuments_title',
      desc: '',
      args: [],
    );
  }

  /// `Detail Claim`
  String get claimDetail_cardAllDocuments_title {
    return Intl.message(
      'Detail Claim',
      name: 'claimDetail_cardAllDocuments_title',
      desc: '',
      args: [],
    );
  }

  /// `Other Files`
  String get claimDetail_cardOtherFiles_title {
    return Intl.message(
      'Other Files',
      name: 'claimDetail_cardOtherFiles_title',
      desc: '',
      args: [],
    );
  }

  /// `Document`
  String get claimDetail_cardOtherFiles_item {
    return Intl.message(
      'Document',
      name: 'claimDetail_cardOtherFiles_item',
      desc: '',
      args: [],
    );
  }

  /// `Detail Status`
  String get claimJourney_navTitle {
    return Intl.message(
      'Detail Status',
      name: 'claimJourney_navTitle',
      desc: '',
      args: [],
    );
  }

  /// `Claim Status`
  String get claimJourney_title {
    return Intl.message(
      'Claim Status',
      name: 'claimJourney_title',
      desc: '',
      args: [],
    );
  }

  /// `Detail Benefit`
  String get claimDocumentDetail_navTitle {
    return Intl.message(
      'Detail Benefit',
      name: 'claimDocumentDetail_navTitle',
      desc: '',
      args: [],
    );
  }

  /// `Upload Documents`
  String get claimUploadMissingDocuments_navTitle {
    return Intl.message(
      'Upload Documents',
      name: 'claimUploadMissingDocuments_navTitle',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get claimUploadMissingDocuments_accordionNotes_title {
    return Intl.message(
      'Notes',
      name: 'claimUploadMissingDocuments_accordionNotes_title',
      desc: '',
      args: [],
    );
  }

  /// `Upload additional documents`
  String get claimUploadMissingDocuments_accordionUploadDoc_title {
    return Intl.message(
      'Upload additional documents',
      name: 'claimUploadMissingDocuments_accordionUploadDoc_title',
      desc: '',
      args: [],
    );
  }

  /// `Documents are complete`
  String get claimUploadMissingDocuments_accordionUploadDoc_completed {
    return Intl.message(
      'Documents are complete',
      name: 'claimUploadMissingDocuments_accordionUploadDoc_completed',
      desc: '',
      args: [],
    );
  }

  /// `Success!`
  String get claimUploadMissingDocuments_successAlert_title {
    return Intl.message(
      'Success!',
      name: 'claimUploadMissingDocuments_successAlert_title',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for completing the requested data. Monitor claim updates to see the progress of your claim.`
  String get claimUploadMissingDocuments_successAlert_description {
    return Intl.message(
      'Thank you for completing the requested data. Monitor claim updates to see the progress of your claim.',
      name: 'claimUploadMissingDocuments_successAlert_description',
      desc: '',
      args: [],
    );
  }

  /// `Claim`
  String get notificationBar_claim {
    return Intl.message(
      'Claim',
      name: 'notificationBar_claim',
      desc: '',
      args: [],
    );
  }

  /// `Claim approved`
  String get notificationBar_null {
    return Intl.message(
      'Claim approved',
      name: 'notificationBar_null',
      desc: '',
      args: [],
    );
  }

  /// `Claim draft`
  String get notificationBar_status_draft {
    return Intl.message(
      'Claim draft',
      name: 'notificationBar_status_draft',
      desc: '',
      args: [],
    );
  }

  /// `Claim submission sent`
  String get notificationBar_status_submitted {
    return Intl.message(
      'Claim submission sent',
      name: 'notificationBar_status_submitted',
      desc: '',
      args: [],
    );
  }

  /// `Claim submission received`
  String get notificationBar_status_acknowledged {
    return Intl.message(
      'Claim submission received',
      name: 'notificationBar_status_acknowledged',
      desc: '',
      args: [],
    );
  }

  /// `Claim under document review`
  String get notificationBar_status_documentReview {
    return Intl.message(
      'Claim under document review',
      name: 'notificationBar_status_documentReview',
      desc: '',
      args: [],
    );
  }

  /// `Claim evaluated`
  String get notificationBar_status_claimAssessment {
    return Intl.message(
      'Claim evaluated',
      name: 'notificationBar_status_claimAssessment',
      desc: '',
      args: [],
    );
  }

  /// `Claim approved`
  String get notificationBar_status_approved {
    return Intl.message(
      'Claim approved',
      name: 'notificationBar_status_approved',
      desc: '',
      args: [],
    );
  }

  /// `Claim paid`
  String get notificationBar_status_paid {
    return Intl.message(
      'Claim paid',
      name: 'notificationBar_status_paid',
      desc: '',
      args: [],
    );
  }

  /// `Claim closed`
  String get notificationBar_status_closed {
    return Intl.message(
      'Claim closed',
      name: 'notificationBar_status_closed',
      desc: '',
      args: [],
    );
  }

  /// `Claim lacks documents`
  String get notificationBar_status_lackOfDocuments {
    return Intl.message(
      'Claim lacks documents',
      name: 'notificationBar_status_lackOfDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Claim rejected`
  String get notificationBar_status_rejected {
    return Intl.message(
      'Claim rejected',
      name: 'notificationBar_status_rejected',
      desc: '',
      args: [],
    );
  }

  /// `Create New Claim`
  String get newClaim_navTitle {
    return Intl.message(
      'Create New Claim',
      name: 'newClaim_navTitle',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Failed`
  String get failed {
    return Intl.message('Failed', name: 'failed', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Create`
  String get create {
    return Intl.message('Create', name: 'create', desc: '', args: []);
  }

  /// `View Detail`
  String get viewDetail {
    return Intl.message('View Detail', name: 'viewDetail', desc: '', args: []);
  }

  /// `Data empty`
  String get dataEmpty {
    return Intl.message('Data empty', name: 'dataEmpty', desc: '', args: []);
  }

  /// `Select Language`
  String get selectLang_title {
    return Intl.message(
      'Select Language',
      name: 'selectLang_title',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get selectLang_alertTitle {
    return Intl.message(
      'Change Language',
      name: 'selectLang_alertTitle',
      desc: '',
      args: [],
    );
  }

  /// `The language in the application will change according to your selection.`
  String get selectLang_alertDesc {
    return Intl.message(
      'The language in the application will change according to your selection.',
      name: 'selectLang_alertDesc',
      desc: '',
      args: [],
    );
  }

  /// `Upload File`
  String get uploadFile_placeholder {
    return Intl.message(
      'Upload File',
      name: 'uploadFile_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `File selected`
  String get uploadFile_fileSelected {
    return Intl.message(
      'File selected',
      name: 'uploadFile_fileSelected',
      desc: '',
      args: [],
    );
  }

  /// `Add Document`
  String get uploadFile_addMore {
    return Intl.message(
      'Add Document',
      name: 'uploadFile_addMore',
      desc: '',
      args: [],
    );
  }

  /// `Re-upload`
  String get uploadFile_reUpload {
    return Intl.message(
      'Re-upload',
      name: 'uploadFile_reUpload',
      desc: '',
      args: [],
    );
  }

  /// `Upload from Gallery`
  String get uploadFile_uploadFromGallery {
    return Intl.message(
      'Upload from Gallery',
      name: 'uploadFile_uploadFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Photo tutorial`
  String get uploadFile_tutorial {
    return Intl.message(
      'Photo tutorial',
      name: 'uploadFile_tutorial',
      desc: '',
      args: [],
    );
  }

  /// `January`
  String get months_january {
    return Intl.message('January', name: 'months_january', desc: '', args: []);
  }

  /// `February`
  String get months_february {
    return Intl.message(
      'February',
      name: 'months_february',
      desc: '',
      args: [],
    );
  }

  /// `March`
  String get months_march {
    return Intl.message('March', name: 'months_march', desc: '', args: []);
  }

  /// `April`
  String get months_april {
    return Intl.message('April', name: 'months_april', desc: '', args: []);
  }

  /// `May`
  String get months_may {
    return Intl.message('May', name: 'months_may', desc: '', args: []);
  }

  /// `June`
  String get months_june {
    return Intl.message('June', name: 'months_june', desc: '', args: []);
  }

  /// `July`
  String get months_july {
    return Intl.message('July', name: 'months_july', desc: '', args: []);
  }

  /// `August`
  String get months_august {
    return Intl.message('August', name: 'months_august', desc: '', args: []);
  }

  /// `September`
  String get months_september {
    return Intl.message(
      'September',
      name: 'months_september',
      desc: '',
      args: [],
    );
  }

  /// `October`
  String get months_october {
    return Intl.message('October', name: 'months_october', desc: '', args: []);
  }

  /// `November`
  String get months_november {
    return Intl.message(
      'November',
      name: 'months_november',
      desc: '',
      args: [],
    );
  }

  /// `December`
  String get months_december {
    return Intl.message(
      'December',
      name: 'months_december',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get datetimepicker_date {
    return Intl.message(
      'Date',
      name: 'datetimepicker_date',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get datetimepicker_month {
    return Intl.message(
      'Month',
      name: 'datetimepicker_month',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get datetimepicker_year {
    return Intl.message(
      'Year',
      name: 'datetimepicker_year',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get datetimepicker_time {
    return Intl.message(
      'Time',
      name: 'datetimepicker_time',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get bottomNav_home {
    return Intl.message('Home', name: 'bottomNav_home', desc: '', args: []);
  }

  /// `Policy`
  String get bottomNav_status {
    return Intl.message('Policy', name: 'bottomNav_status', desc: '', args: []);
  }

  /// `Submit New`
  String get bottomNav_create {
    return Intl.message(
      'Submit New',
      name: 'bottomNav_create',
      desc: '',
      args: [],
    );
  }

  /// `Claim`
  String get bottomNav_claim {
    return Intl.message('Claim', name: 'bottomNav_claim', desc: '', args: []);
  }

  /// `History`
  String get bottomNav_history {
    return Intl.message(
      'History',
      name: 'bottomNav_history',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get bottomNav_logout {
    return Intl.message(
      'Log Out',
      name: 'bottomNav_logout',
      desc: '',
      args: [],
    );
  }

  /// `Buy Policy`
  String get bottomNav_newPolicy {
    return Intl.message(
      'Buy Policy',
      name: 'bottomNav_newPolicy',
      desc: '',
      args: [],
    );
  }

  /// `New Claim`
  String get bottomNav_newClaim {
    return Intl.message(
      'New Claim',
      name: 'bottomNav_newClaim',
      desc: '',
      args: [],
    );
  }

  /// `Passenger`
  String get bottomNav_passenger {
    return Intl.message(
      'Passenger',
      name: 'bottomNav_passenger',
      desc: '',
      args: [],
    );
  }

  /// `Driver`
  String get bottomNav_driver {
    return Intl.message('Driver', name: 'bottomNav_driver', desc: '', args: []);
  }

  /// `Login`
  String get topNav_login {
    return Intl.message('Login', name: 'topNav_login', desc: '', args: []);
  }

  /// `Log Out`
  String get logout_title {
    return Intl.message('Log Out', name: 'logout_title', desc: '', args: []);
  }

  /// `Thank you for visiting Friendsure!`
  String get logout_message1 {
    return Intl.message(
      'Thank you for visiting Friendsure!',
      name: 'logout_message1',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get logout_message2 {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logout_message2',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get logout_cancel {
    return Intl.message('Cancel', name: 'logout_cancel', desc: '', args: []);
  }

  /// `Log Out`
  String get logout_confirm {
    return Intl.message('Log Out', name: 'logout_confirm', desc: '', args: []);
  }

  /// `Other bank`
  String get selectlist_otherBank {
    return Intl.message(
      'Other bank',
      name: 'selectlist_otherBank',
      desc: '',
      args: [],
    );
  }

  /// `Other hospital`
  String get selectlist_otherHospital {
    return Intl.message(
      'Other hospital',
      name: 'selectlist_otherHospital',
      desc: '',
      args: [],
    );
  }

  /// `Insert product name`
  String get input_placeholderInsertProduct {
    return Intl.message(
      'Insert product name',
      name: 'input_placeholderInsertProduct',
      desc: '',
      args: [],
    );
  }

  /// `Invite Member!`
  String get inviteMember {
    return Intl.message(
      'Invite Member!',
      name: 'inviteMember',
      desc: '',
      args: [],
    );
  }

  /// `Potential Commission`
  String get potentialCommission {
    return Intl.message(
      'Potential Commission',
      name: 'potentialCommission',
      desc: '',
      args: [],
    );
  }

  /// `Performance`
  String get performance {
    return Intl.message('Performance', name: 'performance', desc: '', args: []);
  }

  /// `Product Name`
  String get productName {
    return Intl.message(
      'Product Name',
      name: 'productName',
      desc: '',
      args: [],
    );
  }

  /// `Plan List`
  String get planList {
    return Intl.message('Plan List', name: 'planList', desc: '', args: []);
  }

  /// `Add Scheme`
  String get addScheme {
    return Intl.message('Add Scheme', name: 'addScheme', desc: '', args: []);
  }

  /// `Customer`
  String get customer {
    return Intl.message('Customer', name: 'customer', desc: '', args: []);
  }

  /// `Transaction`
  String get transaction {
    return Intl.message('Transaction', name: 'transaction', desc: '', args: []);
  }

  /// `Report`
  String get report {
    return Intl.message('Report', name: 'report', desc: '', args: []);
  }

  /// `Support`
  String get support {
    return Intl.message('Support', name: 'support', desc: '', args: []);
  }

  /// `Expected Commision Fee`
  String get expectedCommisionFee {
    return Intl.message(
      'Expected Commision Fee',
      name: 'expectedCommisionFee',
      desc: '',
      args: [],
    );
  }

  /// `Create and publish product`
  String get dialogConfirm_titleReview {
    return Intl.message(
      'Create and publish product',
      name: 'dialogConfirm_titleReview',
      desc: '',
      args: [],
    );
  }

  /// `Please review the chosen scheme and plan carefully, as they cannot be edited once published.`
  String get dialogConfirm_review {
    return Intl.message(
      'Please review the chosen scheme and plan carefully, as they cannot be edited once published.',
      name: 'dialogConfirm_review',
      desc: '',
      args: [],
    );
  }

  /// `Product`
  String get product {
    return Intl.message('Product', name: 'product', desc: '', args: []);
  }

  /// `Select up to 3 products to sell. Any products not selected will be deactivated.`
  String get maxSelectProduct {
    return Intl.message(
      'Select up to 3 products to sell. Any products not selected will be deactivated.',
      name: 'maxSelectProduct',
      desc: '',
      args: [],
    );
  }

  /// `Load more`
  String get loadMore {
    return Intl.message('Load more', name: 'loadMore', desc: '', args: []);
  }

  /// `Field is required`
  String get required_general {
    return Intl.message(
      'Field is required',
      name: 'required_general',
      desc: '',
      args: [],
    );
  }

  /// `Date is required`
  String get required_date {
    return Intl.message(
      'Date is required',
      name: 'required_date',
      desc: '',
      args: [],
    );
  }

  /// `Month is required`
  String get required_month {
    return Intl.message(
      'Month is required',
      name: 'required_month',
      desc: '',
      args: [],
    );
  }

  /// `Year is required`
  String get required_year {
    return Intl.message(
      'Year is required',
      name: 'required_year',
      desc: '',
      args: [],
    );
  }

  /// `Time is required`
  String get required_time {
    return Intl.message(
      'Time is required',
      name: 'required_time',
      desc: '',
      args: [],
    );
  }

  /// `Minimum {min} characters required.`
  String required_minLength(Object min) {
    return Intl.message(
      'Minimum $min characters required.',
      name: 'required_minLength',
      desc: '',
      args: [min],
    );
  }

  /// `Invalid format phone number`
  String get invalidFormat_phone {
    return Intl.message(
      'Invalid format phone number',
      name: 'invalidFormat_phone',
      desc: '',
      args: [],
    );
  }

  /// `Invalid format email`
  String get invalidFormat_email {
    return Intl.message(
      'Invalid format email',
      name: 'invalidFormat_email',
      desc: '',
      args: [],
    );
  }

  /// `Invalid file format (supported: .pdf, .png, .jpg)`
  String get invalidFormat_fileFormat {
    return Intl.message(
      'Invalid file format (supported: .pdf, .png, .jpg)',
      name: 'invalidFormat_fileFormat',
      desc: '',
      args: [],
    );
  }

  /// `Maximum file size is `
  String get maximumLength_fileSize {
    return Intl.message(
      'Maximum file size is ',
      name: 'maximumLength_fileSize',
      desc: '',
      args: [],
    );
  }

  /// `History Policies`
  String get listHistory_titlePolicy {
    return Intl.message(
      'History Policies',
      name: 'listHistory_titlePolicy',
      desc: '',
      args: [],
    );
  }

  /// `History Claims`
  String get listHistory_titleClaim {
    return Intl.message(
      'History Claims',
      name: 'listHistory_titleClaim',
      desc: '',
      args: [],
    );
  }

  /// `Select the policy you want to claim`
  String get listHistory_subtitle {
    return Intl.message(
      'Select the policy you want to claim',
      name: 'listHistory_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Search participant name, insurance, or policy number`
  String get listHistory_search_placeholder {
    return Intl.message(
      'Search participant name, insurance, or policy number',
      name: 'listHistory_search_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get listHistory_filterDate_title {
    return Intl.message(
      'Select Date',
      name: 'listHistory_filterDate_title',
      desc: '',
      args: [],
    );
  }

  /// `All Dates`
  String get listHistory_filterDate_placeholder {
    return Intl.message(
      'All Dates',
      name: 'listHistory_filterDate_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `All Dates`
  String get listHistory_filterDate_opt1 {
    return Intl.message(
      'All Dates',
      name: 'listHistory_filterDate_opt1',
      desc: '',
      args: [],
    );
  }

  /// `Select Custom Dates`
  String get listHistory_filterDate_opt2 {
    return Intl.message(
      'Select Custom Dates',
      name: 'listHistory_filterDate_opt2',
      desc: '',
      args: [],
    );
  }

  /// `Select Start Date`
  String get listHistory_filterDate_startDate {
    return Intl.message(
      'Select Start Date',
      name: 'listHistory_filterDate_startDate',
      desc: '',
      args: [],
    );
  }

  /// `Select End Date`
  String get listHistory_filterDate_endDate {
    return Intl.message(
      'Select End Date',
      name: 'listHistory_filterDate_endDate',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get listHistory_status_all {
    return Intl.message(
      'All',
      name: 'listHistory_status_all',
      desc: '',
      args: [],
    );
  }

  /// `In Force`
  String get listHistory_status_active {
    return Intl.message(
      'In Force',
      name: 'listHistory_status_active',
      desc: '',
      args: [],
    );
  }

  /// `Draft`
  String get listHistory_status_draft {
    return Intl.message(
      'Draft',
      name: 'listHistory_status_draft',
      desc: '',
      args: [],
    );
  }

  /// `Expired`
  String get listHistory_status_expired {
    return Intl.message(
      'Expired',
      name: 'listHistory_status_expired',
      desc: '',
      args: [],
    );
  }

  /// `Currently You Have not Claims Archive`
  String get listHistory_empty_claim {
    return Intl.message(
      'Currently You Have not Claims Archive',
      name: 'listHistory_empty_claim',
      desc: '',
      args: [],
    );
  }

  /// `Currently You Have no Policies Archive`
  String get listHistory_empty_policy {
    return Intl.message(
      'Currently You Have no Policies Archive',
      name: 'listHistory_empty_policy',
      desc: '',
      args: [],
    );
  }

  /// `Updated Claim`
  String get homePreview_claimTitle {
    return Intl.message(
      'Updated Claim',
      name: 'homePreview_claimTitle',
      desc: '',
      args: [],
    );
  }

  /// `Updated Policy`
  String get homePreview_policyTitle {
    return Intl.message(
      'Updated Policy',
      name: 'homePreview_policyTitle',
      desc: '',
      args: [],
    );
  }

  /// `See More`
  String get homePreview_seeMore {
    return Intl.message(
      'See More',
      name: 'homePreview_seeMore',
      desc: '',
      args: [],
    );
  }

  /// `Draft`
  String get homePreview_status_draft {
    return Intl.message(
      'Draft',
      name: 'homePreview_status_draft',
      desc: '',
      args: [],
    );
  }

  /// `Processing`
  String get homePreview_status_process {
    return Intl.message(
      'Processing',
      name: 'homePreview_status_process',
      desc: '',
      args: [],
    );
  }

  /// `Approved`
  String get homePreview_status_success {
    return Intl.message(
      'Approved',
      name: 'homePreview_status_success',
      desc: '',
      args: [],
    );
  }

  /// `Closed`
  String get homePreview_status_close {
    return Intl.message(
      'Closed',
      name: 'homePreview_status_close',
      desc: '',
      args: [],
    );
  }

  /// `Paid`
  String get homePreview_status_withdraw {
    return Intl.message(
      'Paid',
      name: 'homePreview_status_withdraw',
      desc: '',
      args: [],
    );
  }

  /// `Rejected`
  String get homePreview_status_reject {
    return Intl.message(
      'Rejected',
      name: 'homePreview_status_reject',
      desc: '',
      args: [],
    );
  }

  /// `Lack of Documents`
  String get homePreview_status_needAction {
    return Intl.message(
      'Lack of Documents',
      name: 'homePreview_status_needAction',
      desc: '',
      args: [],
    );
  }

  /// `Application Sent`
  String get homePreview_status_sent {
    return Intl.message(
      'Application Sent',
      name: 'homePreview_status_sent',
      desc: '',
      args: [],
    );
  }

  /// `Currently You have Not Active Policy yet`
  String get homePreview_newestPolicy_empty {
    return Intl.message(
      'Currently You have Not Active Policy yet',
      name: 'homePreview_newestPolicy_empty',
      desc: '',
      args: [],
    );
  }

  /// `Currently You have Not Active Claim yet`
  String get homePreview_newestClaim_empty {
    return Intl.message(
      'Currently You have Not Active Claim yet',
      name: 'homePreview_newestClaim_empty',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get home_welcome {
    return Intl.message('Welcome', name: 'home_welcome', desc: '', args: []);
  }

  /// `You Have`
  String get home_message {
    return Intl.message('You Have', name: 'home_message', desc: '', args: []);
  }

  /// `Type Insurances`
  String get home_type {
    return Intl.message(
      'Type Insurances',
      name: 'home_type',
      desc: '',
      args: [],
    );
  }

  /// `Active Policies`
  String get home_policy {
    return Intl.message(
      'Active Policies',
      name: 'home_policy',
      desc: '',
      args: [],
    );
  }

  /// `Active Claims`
  String get home_claim {
    return Intl.message(
      'Active Claims',
      name: 'home_claim',
      desc: '',
      args: [],
    );
  }

  /// `ID Claim`
  String get home_idClaim {
    return Intl.message('ID Claim', name: 'home_idClaim', desc: '', args: []);
  }

  /// `Process`
  String get listClaim_status_process {
    return Intl.message(
      'Process',
      name: 'listClaim_status_process',
      desc: '',
      args: [],
    );
  }

  /// `Application Sent`
  String get listClaim_status_applicationSent {
    return Intl.message(
      'Application Sent',
      name: 'listClaim_status_applicationSent',
      desc: '',
      args: [],
    );
  }

  /// `Application in Process`
  String get listClaim_status_applicationProcess {
    return Intl.message(
      'Application in Process',
      name: 'listClaim_status_applicationProcess',
      desc: '',
      args: [],
    );
  }

  /// `Payment Process`
  String get listClaim_status_paymentProcessing {
    return Intl.message(
      'Payment Process',
      name: 'listClaim_status_paymentProcessing',
      desc: '',
      args: [],
    );
  }

  /// `Successful Disbursement`
  String get listClaim_status_success {
    return Intl.message(
      'Successful Disbursement',
      name: 'listClaim_status_success',
      desc: '',
      args: [],
    );
  }

  /// `Claim Rejected`
  String get listClaim_status_claimRejected {
    return Intl.message(
      'Claim Rejected',
      name: 'listClaim_status_claimRejected',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get listPolicy_status_title {
    return Intl.message(
      'Status',
      name: 'listPolicy_status_title',
      desc: '',
      args: [],
    );
  }

  /// `All Statuses`
  String get listPolicy_status_placeholder {
    return Intl.message(
      'All Statuses',
      name: 'listPolicy_status_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `All Statuses`
  String get listPolicy_status_all {
    return Intl.message(
      'All Statuses',
      name: 'listPolicy_status_all',
      desc: '',
      args: [],
    );
  }

  /// `In Force`
  String get listPolicy_status_active {
    return Intl.message(
      'In Force',
      name: 'listPolicy_status_active',
      desc: '',
      args: [],
    );
  }

  /// `Draft`
  String get listPolicy_status_draft {
    return Intl.message(
      'Draft',
      name: 'listPolicy_status_draft',
      desc: '',
      args: [],
    );
  }

  /// `Expired`
  String get listPolicy_status_expired {
    return Intl.message(
      'Expired',
      name: 'listPolicy_status_expired',
      desc: '',
      args: [],
    );
  }

  /// `Grace Period`
  String get listPolicy_status_gracePeriod {
    return Intl.message(
      'Grace Period',
      name: 'listPolicy_status_gracePeriod',
      desc: '',
      args: [],
    );
  }

  /// `Lapse`
  String get listPolicy_status_lapse {
    return Intl.message(
      'Lapse',
      name: 'listPolicy_status_lapse',
      desc: '',
      args: [],
    );
  }

  /// `Insurance List`
  String get choosePolicy_title {
    return Intl.message(
      'Insurance List',
      name: 'choosePolicy_title',
      desc: '',
      args: [],
    );
  }

  /// `Select the insurance you want to claim`
  String get choosePolicy_subtitle {
    return Intl.message(
      'Select the insurance you want to claim',
      name: 'choosePolicy_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Airpaz`
  String get choosePolicy_airpaz {
    return Intl.message(
      'Airpaz',
      name: 'choosePolicy_airpaz',
      desc: '',
      args: [],
    );
  }

  /// `Travel Insurance`
  String get choosePolicy_travel {
    return Intl.message(
      'Travel Insurance',
      name: 'choosePolicy_travel',
      desc: '',
      args: [],
    );
  }

  /// `Personal Accident Insurance`
  String get choosePolicy_pa {
    return Intl.message(
      'Personal Accident Insurance',
      name: 'choosePolicy_pa',
      desc: '',
      args: [],
    );
  }

  /// `Active Policy`
  String get choosePolicy_policy {
    return Intl.message(
      'Active Policy',
      name: 'choosePolicy_policy',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get choosePolicy_history {
    return Intl.message(
      'History',
      name: 'choosePolicy_history',
      desc: '',
      args: [],
    );
  }

  /// `Archive`
  String get choosePolicy_archive {
    return Intl.message(
      'Archive',
      name: 'choosePolicy_archive',
      desc: '',
      args: [],
    );
  }

  /// `Active Claim`
  String get choosePolicy_activeClaim {
    return Intl.message(
      'Active Claim',
      name: 'choosePolicy_activeClaim',
      desc: '',
      args: [],
    );
  }

  /// `Claim List`
  String get choosePolicy_title2 {
    return Intl.message(
      'Claim List',
      name: 'choosePolicy_title2',
      desc: '',
      args: [],
    );
  }

  /// `Track your claim status`
  String get choosePolicy_subtitle2 {
    return Intl.message(
      'Track your claim status',
      name: 'choosePolicy_subtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Policy List`
  String get listPolicy_title {
    return Intl.message(
      'Policy List',
      name: 'listPolicy_title',
      desc: '',
      args: [],
    );
  }

  /// `Select the policy you want to claim`
  String get listPolicy_subtitle {
    return Intl.message(
      'Select the policy you want to claim',
      name: 'listPolicy_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Search participant name, insurance, or policy number`
  String get listPolicy_search_placeholder {
    return Intl.message(
      'Search participant name, insurance, or policy number',
      name: 'listPolicy_search_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Data verification`
  String get listPolicy_endorsementPending {
    return Intl.message(
      'Data verification',
      name: 'listPolicy_endorsementPending',
      desc: '',
      args: [],
    );
  }

  /// `Data change rejected`
  String get listPolicy_endorsementRejected {
    return Intl.message(
      'Data change rejected',
      name: 'listPolicy_endorsementRejected',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get listPolicy_filterDate_title {
    return Intl.message(
      'Select Date',
      name: 'listPolicy_filterDate_title',
      desc: '',
      args: [],
    );
  }

  /// `All Dates`
  String get listPolicy_filterDate_placeholder {
    return Intl.message(
      'All Dates',
      name: 'listPolicy_filterDate_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `All Policy Dates`
  String get listPolicy_filterDate_opt1 {
    return Intl.message(
      'All Policy Dates',
      name: 'listPolicy_filterDate_opt1',
      desc: '',
      args: [],
    );
  }

  /// `Select Custom Dates`
  String get listPolicy_filterDate_opt2 {
    return Intl.message(
      'Select Custom Dates',
      name: 'listPolicy_filterDate_opt2',
      desc: '',
      args: [],
    );
  }

  /// `Select Start Date`
  String get listPolicy_filterDate_startDate {
    return Intl.message(
      'Select Start Date',
      name: 'listPolicy_filterDate_startDate',
      desc: '',
      args: [],
    );
  }

  /// `Select End Date`
  String get listPolicy_filterDate_endDate {
    return Intl.message(
      'Select End Date',
      name: 'listPolicy_filterDate_endDate',
      desc: '',
      args: [],
    );
  }

  /// `Pending Policy`
  String get listPolicy_status_pendingPolicy {
    return Intl.message(
      'Pending Policy',
      name: 'listPolicy_status_pendingPolicy',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get listPolicy_history_title {
    return Intl.message(
      'History',
      name: 'listPolicy_history_title',
      desc: '',
      args: [],
    );
  }

  /// `You currently have no Policy history`
  String get listPolicy_history_empty {
    return Intl.message(
      'You currently have no Policy history',
      name: 'listPolicy_history_empty',
      desc: '',
      args: [],
    );
  }

  /// `Policy History`
  String get listPolicy_history_navigation {
    return Intl.message(
      'Policy History',
      name: 'listPolicy_history_navigation',
      desc: '',
      args: [],
    );
  }

  /// `You currently have no Policies`
  String get listPolicy_empty {
    return Intl.message(
      'You currently have no Policies',
      name: 'listPolicy_empty',
      desc: '',
      args: [],
    );
  }

  /// `All benefits have been claimed`
  String get listPolicy_outOfClaim_title {
    return Intl.message(
      'All benefits have been claimed',
      name: 'listPolicy_outOfClaim_title',
      desc: '',
      args: [],
    );
  }

  /// `Please contact the Teman team if you believe this is an error`
  String get listPolicy_outOfClaim_subtitle {
    return Intl.message(
      'Please contact the Teman team if you believe this is an error',
      name: 'listPolicy_outOfClaim_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get listPolicy_outOfClaim_button {
    return Intl.message(
      'OK',
      name: 'listPolicy_outOfClaim_button',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Claim`
  String get policySubmission_navTitle {
    return Intl.message(
      'Insurance Claim',
      name: 'policySubmission_navTitle',
      desc: '',
      args: [],
    );
  }

  /// `Airpaz Claim`
  String get policySubmission_airpaz {
    return Intl.message(
      'Airpaz Claim',
      name: 'policySubmission_airpaz',
      desc: '',
      args: [],
    );
  }

  /// `Travel Insurance`
  String get policySubmission_travel {
    return Intl.message(
      'Travel Insurance',
      name: 'policySubmission_travel',
      desc: '',
      args: [],
    );
  }

  /// `Personal Accident Insurance`
  String get policySubmission_pa {
    return Intl.message(
      'Personal Accident Insurance',
      name: 'policySubmission_pa',
      desc: '',
      args: [],
    );
  }

  /// `Policy Holder Information`
  String get policySubmission_cardPolicyHolder_title {
    return Intl.message(
      'Policy Holder Information',
      name: 'policySubmission_cardPolicyHolder_title',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get policySubmission_cardPolicyHolder_info1 {
    return Intl.message(
      'Full Name',
      name: 'policySubmission_cardPolicyHolder_info1',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get policySubmission_cardPolicyHolder_info2 {
    return Intl.message(
      'Phone Number',
      name: 'policySubmission_cardPolicyHolder_info2',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get policySubmission_cardPolicyHolder_info3 {
    return Intl.message(
      'Email',
      name: 'policySubmission_cardPolicyHolder_info3',
      desc: '',
      args: [],
    );
  }

  /// `Insured Name`
  String get policySubmission_accordionInsuredInfo_title {
    return Intl.message(
      'Insured Name',
      name: 'policySubmission_accordionInsuredInfo_title',
      desc: '',
      args: [],
    );
  }

  /// `Select Insured`
  String get policySubmission_accordionInsuredInfo_select {
    return Intl.message(
      'Select Insured',
      name: 'policySubmission_accordionInsuredInfo_select',
      desc: '',
      args: [],
    );
  }

  /// `Policy Number`
  String get policySubmission_accordionInsuredInfo_noPolicy {
    return Intl.message(
      'Policy Number',
      name: 'policySubmission_accordionInsuredInfo_noPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Participant Number`
  String get policySubmission_accordionInsuredInfo_noParticipant {
    return Intl.message(
      'Participant Number',
      name: 'policySubmission_accordionInsuredInfo_noParticipant',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get policySubmission_accordionInsuredInfo_fullName {
    return Intl.message(
      'Full Name',
      name: 'policySubmission_accordionInsuredInfo_fullName',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get policySubmission_accordionInsuredInfo_gender {
    return Intl.message(
      'Gender',
      name: 'policySubmission_accordionInsuredInfo_gender',
      desc: '',
      args: [],
    );
  }

  /// `Country Code`
  String get policySubmission_accordionInsuredInfo_countryCode {
    return Intl.message(
      'Country Code',
      name: 'policySubmission_accordionInsuredInfo_countryCode',
      desc: '',
      args: [],
    );
  }

  /// `Passport Number`
  String get policySubmission_accordionInsuredInfo_noPassport {
    return Intl.message(
      'Passport Number',
      name: 'policySubmission_accordionInsuredInfo_noPassport',
      desc: '',
      args: [],
    );
  }

  /// `National ID`
  String get policySubmission_accordionInsuredInfo_noID {
    return Intl.message(
      'National ID',
      name: 'policySubmission_accordionInsuredInfo_noID',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get policySubmission_accordionInsuredInfo_nationality {
    return Intl.message(
      'Nationality',
      name: 'policySubmission_accordionInsuredInfo_nationality',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get policySubmission_accordionInsuredInfo_dob {
    return Intl.message(
      'Date of Birth',
      name: 'policySubmission_accordionInsuredInfo_dob',
      desc: '',
      args: [],
    );
  }

  /// `Place of Birth`
  String get policySubmission_accordionInsuredInfo_pob {
    return Intl.message(
      'Place of Birth',
      name: 'policySubmission_accordionInsuredInfo_pob',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get policySubmission_accordionInsuredInfo_address {
    return Intl.message(
      'Address',
      name: 'policySubmission_accordionInsuredInfo_address',
      desc: '',
      args: [],
    );
  }

  /// `Occupation`
  String get policySubmission_accordionInsuredInfo_job {
    return Intl.message(
      'Occupation',
      name: 'policySubmission_accordionInsuredInfo_job',
      desc: '',
      args: [],
    );
  }

  /// `Date of Issue`
  String get policySubmission_accordionInsuredInfo_dateRelease {
    return Intl.message(
      'Date of Issue',
      name: 'policySubmission_accordionInsuredInfo_dateRelease',
      desc: '',
      args: [],
    );
  }

  /// `Expiration Date`
  String get policySubmission_accordionInsuredInfo_dateExpiration {
    return Intl.message(
      'Expiration Date',
      name: 'policySubmission_accordionInsuredInfo_dateExpiration',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get policySubmission_accordionPersonalInfo_title {
    return Intl.message(
      'Personal Information',
      name: 'policySubmission_accordionPersonalInfo_title',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number (WhatsApp)`
  String get policySubmission_accordionPersonalInfo_phoneInput_label {
    return Intl.message(
      'Phone Number (WhatsApp)',
      name: 'policySubmission_accordionPersonalInfo_phoneInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter Phone Number`
  String get policySubmission_accordionPersonalInfo_phoneInput_placeholder {
    return Intl.message(
      'Enter Phone Number',
      name: 'policySubmission_accordionPersonalInfo_phoneInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Claim Shipping Address`
  String get policySubmission_accordionPersonalInfo_addressInput_label {
    return Intl.message(
      'Claim Shipping Address',
      name: 'policySubmission_accordionPersonalInfo_addressInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get policySubmission_accordionPersonalInfo_addressInput_placeholder {
    return Intl.message(
      'Address',
      name: 'policySubmission_accordionPersonalInfo_addressInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get policySubmission_accordionPersonalInfo_countryInput_placeholder {
    return Intl.message(
      'Country',
      name: 'policySubmission_accordionPersonalInfo_countryInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Province`
  String get policySubmission_accordionPersonalInfo_stateInput_placeholder {
    return Intl.message(
      'Province',
      name: 'policySubmission_accordionPersonalInfo_stateInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `City/District`
  String get policySubmission_accordionPersonalInfo_cityInput_placeholder {
    return Intl.message(
      'City/District',
      name: 'policySubmission_accordionPersonalInfo_cityInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Subdistrict`
  String get policySubmission_accordionPersonalInfo_districtInput_placeholder {
    return Intl.message(
      'Subdistrict',
      name: 'policySubmission_accordionPersonalInfo_districtInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Village`
  String
  get policySubmission_accordionPersonalInfo_subdistrictInput_placeholder {
    return Intl.message(
      'Village',
      name:
          'policySubmission_accordionPersonalInfo_subdistrictInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Postal Code`
  String
  get policySubmission_accordionPersonalInfo_postalCodeInput_placeholder {
    return Intl.message(
      'Postal Code',
      name:
          'policySubmission_accordionPersonalInfo_postalCodeInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Street 1`
  String get policySubmission_accordionPersonalInfo_street1Input_placeholder {
    return Intl.message(
      'Street 1',
      name: 'policySubmission_accordionPersonalInfo_street1Input_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Street 2`
  String get policySubmission_accordionPersonalInfo_street2Input_placeholder {
    return Intl.message(
      'Street 2',
      name: 'policySubmission_accordionPersonalInfo_street2Input_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Account Information`
  String get policySubmission_accordionAccountInfo_title {
    return Intl.message(
      'Account Information',
      name: 'policySubmission_accordionAccountInfo_title',
      desc: '',
      args: [],
    );
  }

  /// `Account Holder Name`
  String get policySubmission_accordionAccountInfo_accountName_input {
    return Intl.message(
      'Account Holder Name',
      name: 'policySubmission_accordionAccountInfo_accountName_input',
      desc: '',
      args: [],
    );
  }

  /// `Enter name as per bank book`
  String get policySubmission_accordionAccountInfo_accountName_placeholder {
    return Intl.message(
      'Enter name as per bank book',
      name: 'policySubmission_accordionAccountInfo_accountName_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Account Holder Name`
  String get policySubmission_accordionAccountInfo_accountNameInput_label {
    return Intl.message(
      'Account Holder Name',
      name: 'policySubmission_accordionAccountInfo_accountNameInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter name as per bank book`
  String
  get policySubmission_accordionAccountInfo_accountNameInput_placeholder {
    return Intl.message(
      'Enter name as per bank book',
      name:
          'policySubmission_accordionAccountInfo_accountNameInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Select Bank`
  String get policySubmission_accordionAccountInfo_bankInput_label {
    return Intl.message(
      'Select Bank',
      name: 'policySubmission_accordionAccountInfo_bankInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Select Bank`
  String get policySubmission_accordionAccountInfo_bankInput_placeholder {
    return Intl.message(
      'Select Bank',
      name: 'policySubmission_accordionAccountInfo_bankInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Bank Branch`
  String get policySubmission_accordionAccountInfo_bankBranchInput_label {
    return Intl.message(
      'Bank Branch',
      name: 'policySubmission_accordionAccountInfo_bankBranchInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter bank branch`
  String get policySubmission_accordionAccountInfo_bankBranchInput_placeholder {
    return Intl.message(
      'Enter bank branch',
      name: 'policySubmission_accordionAccountInfo_bankBranchInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Account Number`
  String get policySubmission_accordionAccountInfo_accountNumberInput_label {
    return Intl.message(
      'Account Number',
      name: 'policySubmission_accordionAccountInfo_accountNumberInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter account number`
  String
  get policySubmission_accordionAccountInfo_accountNumberInput_placeholder {
    return Intl.message(
      'Enter account number',
      name:
          'policySubmission_accordionAccountInfo_accountNumberInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Claim Type`
  String get policySubmission_accordionClaimBenefit_title {
    return Intl.message(
      'Claim Type',
      name: 'policySubmission_accordionClaimBenefit_title',
      desc: '',
      args: [],
    );
  }

  /// `Benefit info`
  String get policySubmission_accordionClaimBenefit_benefitInfo {
    return Intl.message(
      'Benefit info',
      name: 'policySubmission_accordionClaimBenefit_benefitInfo',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Claim`
  String get policyPreview_navTitle {
    return Intl.message(
      'Insurance Claim',
      name: 'policyPreview_navTitle',
      desc: '',
      args: [],
    );
  }

  /// `Airpaz Insurance`
  String get policyPreview_airpaz {
    return Intl.message(
      'Airpaz Insurance',
      name: 'policyPreview_airpaz',
      desc: '',
      args: [],
    );
  }

  /// `Travel Insurance`
  String get policyPreview_travel {
    return Intl.message(
      'Travel Insurance',
      name: 'policyPreview_travel',
      desc: '',
      args: [],
    );
  }

  /// `Personal Accident Insurance`
  String get policyPreview_pa {
    return Intl.message(
      'Personal Accident Insurance',
      name: 'policyPreview_pa',
      desc: '',
      args: [],
    );
  }

  /// `Policy Holder`
  String get policyPreview_cardPolicyHolder_title {
    return Intl.message(
      'Policy Holder',
      name: 'policyPreview_cardPolicyHolder_title',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get policyPreview_cardPolicyHolder_info1 {
    return Intl.message(
      'Full Name',
      name: 'policyPreview_cardPolicyHolder_info1',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get policyPreview_cardPolicyHolder_info2 {
    return Intl.message(
      'Phone Number',
      name: 'policyPreview_cardPolicyHolder_info2',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get policyPreview_cardPolicyHolder_info3 {
    return Intl.message(
      'Email',
      name: 'policyPreview_cardPolicyHolder_info3',
      desc: '',
      args: [],
    );
  }

  /// `Insured Name`
  String get policyPreview_cardInsuredInfo_title {
    return Intl.message(
      'Insured Name',
      name: 'policyPreview_cardInsuredInfo_title',
      desc: '',
      args: [],
    );
  }

  /// `Policy Number`
  String get policyPreview_cardInsuredInfo_noPolicy {
    return Intl.message(
      'Policy Number',
      name: 'policyPreview_cardInsuredInfo_noPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Participant Number`
  String get policyPreview_cardInsuredInfo_noParticipant {
    return Intl.message(
      'Participant Number',
      name: 'policyPreview_cardInsuredInfo_noParticipant',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get policyPreview_cardInsuredInfo_fullName {
    return Intl.message(
      'Full Name',
      name: 'policyPreview_cardInsuredInfo_fullName',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get policyPreview_cardInsuredInfo_gender {
    return Intl.message(
      'Gender',
      name: 'policyPreview_cardInsuredInfo_gender',
      desc: '',
      args: [],
    );
  }

  /// `Country Code`
  String get policyPreview_cardInsuredInfo_countryCode {
    return Intl.message(
      'Country Code',
      name: 'policyPreview_cardInsuredInfo_countryCode',
      desc: '',
      args: [],
    );
  }

  /// `Passport Number`
  String get policyPreview_cardInsuredInfo_noPassport {
    return Intl.message(
      'Passport Number',
      name: 'policyPreview_cardInsuredInfo_noPassport',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get policyPreview_cardInsuredInfo_nationality {
    return Intl.message(
      'Nationality',
      name: 'policyPreview_cardInsuredInfo_nationality',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get policyPreview_cardInsuredInfo_dob {
    return Intl.message(
      'Date of Birth',
      name: 'policyPreview_cardInsuredInfo_dob',
      desc: '',
      args: [],
    );
  }

  /// `Place of Birth`
  String get policyPreview_cardInsuredInfo_pob {
    return Intl.message(
      'Place of Birth',
      name: 'policyPreview_cardInsuredInfo_pob',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get policyPreview_cardInsuredInfo_address {
    return Intl.message(
      'Address',
      name: 'policyPreview_cardInsuredInfo_address',
      desc: '',
      args: [],
    );
  }

  /// `Occupation`
  String get policyPreview_cardInsuredInfo_job {
    return Intl.message(
      'Occupation',
      name: 'policyPreview_cardInsuredInfo_job',
      desc: '',
      args: [],
    );
  }

  /// `Date of Issue`
  String get policyPreview_cardInsuredInfo_dateRelease {
    return Intl.message(
      'Date of Issue',
      name: 'policyPreview_cardInsuredInfo_dateRelease',
      desc: '',
      args: [],
    );
  }

  /// `Expiration Date`
  String get policyPreview_cardInsuredInfo_dateExpiration {
    return Intl.message(
      'Expiration Date',
      name: 'policyPreview_cardInsuredInfo_dateExpiration',
      desc: '',
      args: [],
    );
  }

  /// `Claim Requested`
  String get policyPreview_cardClaimRequested_title {
    return Intl.message(
      'Claim Requested',
      name: 'policyPreview_cardClaimRequested_title',
      desc: '',
      args: [],
    );
  }

  /// `I have read, understood, and agree to`
  String get policyPreview_cardClaimRequested_checkTnc1 {
    return Intl.message(
      'I have read, understood, and agree to',
      name: 'policyPreview_cardClaimRequested_checkTnc1',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get policyPreview_cardClaimRequested_checkTnc2 {
    return Intl.message(
      'Terms and Conditions',
      name: 'policyPreview_cardClaimRequested_checkTnc2',
      desc: '',
      args: [],
    );
  }

  /// `applicable to Teman`
  String get policyPreview_cardClaimRequested_checkTnc3 {
    return Intl.message(
      'applicable to Teman',
      name: 'policyPreview_cardClaimRequested_checkTnc3',
      desc: '',
      args: [],
    );
  }

  /// `Policy History`
  String get listHistory_title {
    return Intl.message(
      'Policy History',
      name: 'listHistory_title',
      desc: '',
      args: [],
    );
  }

  /// `Policy Details`
  String get detailPolicy_navTitle {
    return Intl.message(
      'Policy Details',
      name: 'detailPolicy_navTitle',
      desc: '',
      args: [],
    );
  }

  /// `Policy unavailable`
  String get detailPolicy_noData {
    return Intl.message(
      'Policy unavailable',
      name: 'detailPolicy_noData',
      desc: '',
      args: [],
    );
  }

  /// `Insured Name`
  String get detailPolicy_accordionInsured_title {
    return Intl.message(
      'Insured Name',
      name: 'detailPolicy_accordionInsured_title',
      desc: '',
      args: [],
    );
  }

  /// `Policy Number`
  String get detailPolicy_accordionInsured_noPolicy {
    return Intl.message(
      'Policy Number',
      name: 'detailPolicy_accordionInsured_noPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Participant Number`
  String get detailPolicy_accordionInsured_noParticipant {
    return Intl.message(
      'Participant Number',
      name: 'detailPolicy_accordionInsured_noParticipant',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get detailPolicy_accordionInsured_fullName {
    return Intl.message(
      'Full Name',
      name: 'detailPolicy_accordionInsured_fullName',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get detailPolicy_accordionInsured_gender {
    return Intl.message(
      'Gender',
      name: 'detailPolicy_accordionInsured_gender',
      desc: '',
      args: [],
    );
  }

  /// `Country Code`
  String get detailPolicy_accordionInsured_countryCode {
    return Intl.message(
      'Country Code',
      name: 'detailPolicy_accordionInsured_countryCode',
      desc: '',
      args: [],
    );
  }

  /// `Passport Number`
  String get detailPolicy_accordionInsured_noPassport {
    return Intl.message(
      'Passport Number',
      name: 'detailPolicy_accordionInsured_noPassport',
      desc: '',
      args: [],
    );
  }

  /// `National ID`
  String get detailPolicy_accordionInsured_noID {
    return Intl.message(
      'National ID',
      name: 'detailPolicy_accordionInsured_noID',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get detailPolicy_accordionInsured_nationality {
    return Intl.message(
      'Nationality',
      name: 'detailPolicy_accordionInsured_nationality',
      desc: '',
      args: [],
    );
  }

  /// `Place/Date of Birth`
  String get detailPolicy_accordionInsured_dob {
    return Intl.message(
      'Place/Date of Birth',
      name: 'detailPolicy_accordionInsured_dob',
      desc: '',
      args: [],
    );
  }

  /// `Place of Birth`
  String get detailPolicy_accordionInsured_pob {
    return Intl.message(
      'Place of Birth',
      name: 'detailPolicy_accordionInsured_pob',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get detailPolicy_accordionInsured_address {
    return Intl.message(
      'Address',
      name: 'detailPolicy_accordionInsured_address',
      desc: '',
      args: [],
    );
  }

  /// `Occupation`
  String get detailPolicy_accordionInsured_job {
    return Intl.message(
      'Occupation',
      name: 'detailPolicy_accordionInsured_job',
      desc: '',
      args: [],
    );
  }

  /// `Date of Issue`
  String get detailPolicy_accordionInsured_dateRelease {
    return Intl.message(
      'Date of Issue',
      name: 'detailPolicy_accordionInsured_dateRelease',
      desc: '',
      args: [],
    );
  }

  /// `Expiration Date`
  String get detailPolicy_accordionInsured_dateExpiration {
    return Intl.message(
      'Expiration Date',
      name: 'detailPolicy_accordionInsured_dateExpiration',
      desc: '',
      args: [],
    );
  }

  /// `Edit Data`
  String get detailPolicy_accordionInsured_edit {
    return Intl.message(
      'Edit Data',
      name: 'detailPolicy_accordionInsured_edit',
      desc: '',
      args: [],
    );
  }

  /// `Edit Data`
  String get endorsement_navTitle {
    return Intl.message(
      'Edit Data',
      name: 'endorsement_navTitle',
      desc: '',
      args: [],
    );
  }

  /// `Submit Data Change`
  String get endorsement_confirmation_title {
    return Intl.message(
      'Submit Data Change',
      name: 'endorsement_confirmation_title',
      desc: '',
      args: [],
    );
  }

  /// `Before sending, ensure all data is correct. Requests submitted before 5:00 PM WIB will be processed the same day. You can still file claims during the verification process.`
  String get endorsement_confirmation_description {
    return Intl.message(
      'Before sending, ensure all data is correct. Requests submitted before 5:00 PM WIB will be processed the same day. You can still file claims during the verification process.',
      name: 'endorsement_confirmation_description',
      desc: '',
      args: [],
    );
  }

  /// `Policy document is undergoing data changes, but Teman Protection remains active, so you can still file claims`
  String get endorsement_info_success {
    return Intl.message(
      'Policy document is undergoing data changes, but Teman Protection remains active, so you can still file claims',
      name: 'endorsement_info_success',
      desc: '',
      args: [],
    );
  }

  /// `Your data change request could not be processed because `
  String get endorsement_info_error {
    return Intl.message(
      'Your data change request could not be processed because ',
      name: 'endorsement_info_error',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get endorsement_nameInput_label {
    return Intl.message(
      'Name',
      name: 'endorsement_nameInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter Full Name`
  String get endorsement_nameInput_placeholder {
    return Intl.message(
      'Enter Full Name',
      name: 'endorsement_nameInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `National ID`
  String get endorsement_nikInput_label {
    return Intl.message(
      'National ID',
      name: 'endorsement_nikInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter National ID`
  String get endorsement_nikInput_placeholder {
    return Intl.message(
      'Enter National ID',
      name: 'endorsement_nikInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get endorsement_dobInput_label {
    return Intl.message(
      'Date of Birth',
      name: 'endorsement_dobInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get endorsement_dobInput_placeholder {
    return Intl.message(
      'Select Date',
      name: 'endorsement_dobInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Place of Birth`
  String get endorsement_pobInput_label {
    return Intl.message(
      'Place of Birth',
      name: 'endorsement_pobInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter as per ID`
  String get endorsement_pobInput_placeholder {
    return Intl.message(
      'Enter as per ID',
      name: 'endorsement_pobInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Passport Number`
  String get endorsement_passportNoInput_label {
    return Intl.message(
      'Passport Number',
      name: 'endorsement_passportNoInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter Passport Number`
  String get endorsement_passportNoInput_placeholder {
    return Intl.message(
      'Enter Passport Number',
      name: 'endorsement_passportNoInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Passport Type`
  String get endorsement_passportTypeInput_label {
    return Intl.message(
      'Passport Type',
      name: 'endorsement_passportTypeInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter Passport Type`
  String get endorsement_passportTypeInput_placeholder {
    return Intl.message(
      'Enter Passport Type',
      name: 'endorsement_passportTypeInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get endorsement_nationalityInput_label {
    return Intl.message(
      'Nationality',
      name: 'endorsement_nationalityInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Select Nationality`
  String get endorsement_nationalityInput_placeholder {
    return Intl.message(
      'Select Nationality',
      name: 'endorsement_nationalityInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Country Code`
  String get endorsement_countryCodeInput_label {
    return Intl.message(
      'Country Code',
      name: 'endorsement_countryCodeInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter Country Code`
  String get endorsement_countryCodeInput_placeholder {
    return Intl.message(
      'Enter Country Code',
      name: 'endorsement_countryCodeInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get endorsement_genderInput_label {
    return Intl.message(
      'Gender',
      name: 'endorsement_genderInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Select Gender`
  String get endorsement_genderInput_placeholder {
    return Intl.message(
      'Select Gender',
      name: 'endorsement_genderInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get endorsement_stateInput_label {
    return Intl.message(
      'Address',
      name: 'endorsement_stateInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Province`
  String get endorsement_stateInput_placeholder {
    return Intl.message(
      'Province',
      name: 'endorsement_stateInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `City/District`
  String get endorsement_cityInput_label {
    return Intl.message(
      'City/District',
      name: 'endorsement_cityInput_label',
      desc: '',
      args: [],
    );
  }

  /// `City/District`
  String get endorsement_cityInput_placeholder {
    return Intl.message(
      'City/District',
      name: 'endorsement_cityInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Subdistrict`
  String get endorsement_districtInput_label {
    return Intl.message(
      'Subdistrict',
      name: 'endorsement_districtInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Subdistrict`
  String get endorsement_districtInput_placeholder {
    return Intl.message(
      'Subdistrict',
      name: 'endorsement_districtInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Village/Subdivision`
  String get endorsement_subdistrictInput_label {
    return Intl.message(
      'Village/Subdivision',
      name: 'endorsement_subdistrictInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Village/Subdivision`
  String get endorsement_subdistrictInput_placeholder {
    return Intl.message(
      'Village/Subdivision',
      name: 'endorsement_subdistrictInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Enter as per ID`
  String get endorsement_street1Input_label {
    return Intl.message(
      'Enter as per ID',
      name: 'endorsement_street1Input_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter as per ID`
  String get endorsement_street1Input_placeholder {
    return Intl.message(
      'Enter as per ID',
      name: 'endorsement_street1Input_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `RT/RW`
  String get endorsement_street2Input_label {
    return Intl.message(
      'RT/RW',
      name: 'endorsement_street2Input_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter as per ID`
  String get endorsement_street2Input_placeholder {
    return Intl.message(
      'Enter as per ID',
      name: 'endorsement_street2Input_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Occupation`
  String get endorsement_jobInput_label {
    return Intl.message(
      'Occupation',
      name: 'endorsement_jobInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter as per ID`
  String get endorsement_jobInput_placeholder {
    return Intl.message(
      'Enter as per ID',
      name: 'endorsement_jobInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Date of Issue`
  String get endorsement_dateReleaseInput_label {
    return Intl.message(
      'Date of Issue',
      name: 'endorsement_dateReleaseInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get endorsement_dateReleaseInput_placeholder {
    return Intl.message(
      'Select Date',
      name: 'endorsement_dateReleaseInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Expiration Date`
  String get endorsement_dateExpirationInput_label {
    return Intl.message(
      'Expiration Date',
      name: 'endorsement_dateExpirationInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get endorsement_dateExpirationInput_placeholder {
    return Intl.message(
      'Select Date',
      name: 'endorsement_dateExpirationInput_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Issuing Office`
  String get endorsement_issuingOfficeInput_label {
    return Intl.message(
      'Issuing Office',
      name: 'endorsement_issuingOfficeInput_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter Office Name`
  String get endorsement_issuingOfficeInput_placeholder {
    return Intl.message(
      'Enter Office Name',
      name: 'endorsement_issuingOfficeInput_placeholder',
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
      Locale.fromSubtags(languageCode: 'fil'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'ms'),
      Locale.fromSubtags(languageCode: 'sg'),
      Locale.fromSubtags(languageCode: 'th'),
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
