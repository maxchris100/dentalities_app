// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get home_myteam => 'My Team';

  @override
  String get otpVerification_title =>
      'กรุณาตรวจสอบอีเมลหรือ WhatsApp ของคุณเพื่อดู OTP';

  @override
  String get otpVerification_resend => 'ส่งรหัสใหม่';

  @override
  String get otpVerification_opsModal_nameInput_label => 'ชื่อเต็ม';

  @override
  String get otpVerification_opsModal_nameInput_placeholder => 'กรอกชื่อเต็ม';

  @override
  String get otpVerification_opsModal_phoneInput_label =>
      'หมายเลขโทรศัพท์มือถือ';

  @override
  String get otpVerification_opsModal_phoneInput_placeholder =>
      'กรอกหมายเลขโทรศัพท์มือถือ';

  @override
  String get otpVerification_opsModal_emailInput_label => 'อีเมล';

  @override
  String get otpVerification_opsModal_emailInput_placeholder =>
      'ตัวอย่าง: Example@gmail.com';

  @override
  String get otpVerification_opsModal_footer =>
      'กรอกข้อมูลนี้เพื่อรับการปกป้องที่ดีที่สุด ทีมงาน Teman จะติดต่อคุณในช่วงเวลาทำการวันจันทร์ - ศุกร์ (08.00 - 17.00)';

  @override
  String get login_title => 'กรอกข้อมูลผู้ถือกรมธรรม์เพื่อรับ OTP';

  @override
  String get login_phoneInput_label => 'หมายเลขโทรศัพท์ (WhatsApp)';

  @override
  String get login_phoneInput_placeholder => 'กรอกหมายเลขโทรศัพท์';

  @override
  String get login_emailInput_label => 'อีเมล';

  @override
  String get login_emailInput_placeholder => 'ตัวอย่าง: example@gmail.com';

  @override
  String get login_submit => 'ส่ง OTP';

  @override
  String get chooseClaim_title => 'รายการประกัน';

  @override
  String get chooseClaim_subtitle => 'เลือกประกันที่คุณต้องการเคลม';

  @override
  String get chooseClaim_airpaz => 'Airpaz';

  @override
  String get chooseClaim_travel => 'ประกันการเดินทาง';

  @override
  String get chooseClaim_pa => 'ประกันอุบัติเหตุส่วนบุคคล';

  @override
  String get chooseClaim_policy => 'กรมธรรม์ที่ใช้งาน';

  @override
  String get chooseClaim_history => 'ประวัติ';

  @override
  String get chooseClaim_archive => 'เอกสารเก่า';

  @override
  String get chooseClaim_activeClaim => 'เคลมที่ยังดำเนินการ';

  @override
  String get chooseClaim_title2 => 'รายการเคลม';

  @override
  String get chooseClaim_subtitle2 => 'ติดตามสถานะการเคลมของคุณ';

  @override
  String get claimSubmission_navTitle => 'การยื่นเคลมประกัน';

  @override
  String get claimSubmission_airpaz => 'ประกันภัย Airpaz';

  @override
  String get claimSubmission_travel => 'ประกันการเดินทาง';

  @override
  String get claimSubmission_pa => 'ประกันอุบัติเหตุส่วนบุคคล';

  @override
  String get claimSubmission_driver => 'Driver';

  @override
  String get claimSubmission_passenger => 'Passenger';

  @override
  String get claimSubmission_cardPolicyHolder_title => 'ข้อมูลผู้ถือกรมธรรม์';

  @override
  String get claimSubmission_cardPolicyHolder_name => 'ชื่อเต็ม';

  @override
  String get claimSubmission_cardPolicyHolder_phone => 'เบอร์โทรศัพท์';

  @override
  String get claimSubmission_cardPolicyHolder_email => 'อีเมล';

  @override
  String get claimSubmission_cardPolicyHolder_policyNumber => 'เลขที่โปลิส';

  @override
  String get claimSubmission_accordionReporterInfo_title => 'ข้อมูลผู้แจ้ง';

  @override
  String get claimSubmission_accordionReporterInfo_isInsuredInput_label =>
      'ผู้แจ้งเป็นผู้เอาประกันหรือไม่?';

  @override
  String get claimSubmission_accordionReporterInfo_isInsuredInput_placeholder =>
      '';

  @override
  String get claimSubmission_accordionReporterInfo_nameInput_label =>
      'ชื่อผู้แจ้ง';

  @override
  String get claimSubmission_accordionReporterInfo_nameInput_placeholder =>
      'กรอกชื่อผู้แจ้ง';

  @override
  String get claimSubmission_accordionReporterInfo_relationshipInput_label =>
      'ความสัมพันธ์กับผู้เอาประกัน';

  @override
  String
      get claimSubmission_accordionReporterInfo_relationshipInput_placeholder =>
          'เลือกความสัมพันธ์';

  @override
  String get claimSubmission_accordionReporterInfo_phoneInput_label =>
      'เบอร์โทรศัพท์';

  @override
  String get claimSubmission_accordionReporterInfo_phoneInput_placeholder =>
      'กรอกเบอร์โทรศัพท์';

  @override
  String get claimSubmission_accordionInsuredInfo_title => 'ข้อมูลผู้เอาประกัน';

  @override
  String get claimSubmission_accordionInsuredInfo_select => 'เลือกผู้เอาประกัน';

  @override
  String get claimSubmission_accordionInsuredInfo_noPolicy => 'เลขที่กรมธรรม์';

  @override
  String get claimSubmission_accordionInsuredInfo_noParticipant =>
      'เลขที่ผู้เข้าร่วม';

  @override
  String get claimSubmission_accordionInsuredInfo_fullName => 'ชื่อ-นามสกุล';

  @override
  String get claimSubmission_accordionInsuredInfo_gender => 'เพศ';

  @override
  String get claimSubmission_accordionInsuredInfo_countryCode => 'รหัสประเทศ';

  @override
  String get claimSubmission_accordionInsuredInfo_noPassport =>
      'เลขหนังสือเดินทาง';

  @override
  String get claimSubmission_accordionInsuredInfo_noID => 'เลขบัตรประชาชน';

  @override
  String get claimSubmission_accordionInsuredInfo_nationality => 'สัญชาติ';

  @override
  String get claimSubmission_accordionInsuredInfo_dob =>
      'สถานที่/วันเดือนปีเกิด';

  @override
  String get claimSubmission_accordionInsuredInfo_pob => 'สถานที่เกิด';

  @override
  String get claimSubmission_accordionInsuredInfo_address => 'ที่อยู่';

  @override
  String get claimSubmission_accordionInsuredInfo_job => 'อาชีพ';

  @override
  String get claimSubmission_accordionInsuredInfo_dateRelease => 'วันที่ออก';

  @override
  String get claimSubmission_accordionInsuredInfo_dateExpiration =>
      'วันหมดอายุ';

  @override
  String get claimSubmission_accordionPersonalInfo_title => 'ข้อมูลส่วนตัว';

  @override
  String get claimSubmission_accordionPersonalInfo_phoneInput_label =>
      'เบอร์โทรศัพท์ (WhatsApp)';

  @override
  String get claimSubmission_accordionPersonalInfo_phoneInput_placeholder =>
      'กรอกเบอร์โทรศัพท์';

  @override
  String get claimSubmission_accordionPersonalInfo_addressInput_label =>
      'ที่อยู่จัดส่งการเคลม';

  @override
  String get claimSubmission_accordionPersonalInfo_addressInput_placeholder =>
      'กรอกที่อยู่';

  @override
  String get claimSubmission_accordionPersonalInfo_countryInput_placeholder =>
      'ประเทศ';

  @override
  String get claimSubmission_accordionPersonalInfo_stateInput_placeholder =>
      'จังหวัด';

  @override
  String get claimSubmission_accordionPersonalInfo_cityInput_placeholder =>
      'อำเภอ';

  @override
  String get claimSubmission_accordionPersonalInfo_districtInput_placeholder =>
      'ตำบล';

  @override
  String
      get claimSubmission_accordionPersonalInfo_subdistrictInput_placeholder =>
          'หมู่บ้าน';

  @override
  String
      get claimSubmission_accordionPersonalInfo_postalCodeInput_placeholder =>
          'รหัสไปรษณีย์';

  @override
  String get claimSubmission_accordionPersonalInfo_street1Input_placeholder =>
      'ถนน 1';

  @override
  String get claimSubmission_accordionPersonalInfo_street2Input_placeholder =>
      'ถนน 2';

  @override
  String get claimSubmission_accordionPolicy_title =>
      'ข้อมูลกรมธรรม์ผู้เอาประกัน';

  @override
  String get claimSubmission_accordionPolicy_policyNoInput_label =>
      'เลขที่กรมธรรม์ (ไม่บังคับ)';

  @override
  String get claimSubmission_accordionPolicy_policyNoInput_placeholder =>
      'กรอกเลขที่กรมธรรม์';

  @override
  String get claimSubmission_accordionPolicy_policyFileInput_label =>
      'อัปโหลดเอกสารกรมธรรม์ (ไม่บังคับ)';

  @override
  String get claimSubmission_accordionPolicy_policyFileInput_placeholder =>
      'อัปโหลดไฟล์';

  @override
  String get claimSubmission_accordionAccountInfo_title => 'ข้อมูลบัญชีธนาคาร';

  @override
  String get claimSubmission_accordionAccountInfo_accountName_input =>
      'ชื่อเจ้าของบัญชี';

  @override
  String get claimSubmission_accordionAccountInfo_accountName_placeholder =>
      'กรอกชื่อตามสมุดบัญชี';

  @override
  String get claimSubmission_accordionAccountInfo_accountNameInput_label =>
      'ชื่อเจ้าของบัญชี';

  @override
  String
      get claimSubmission_accordionAccountInfo_accountNameInput_placeholder =>
          'กรอกชื่อตามสมุดบัญชี';

  @override
  String get claimSubmission_accordionAccountInfo_bankInput_label =>
      'เลือกธนาคาร';

  @override
  String get claimSubmission_accordionAccountInfo_bankInput_placeholder =>
      'เลือกธนาคาร';

  @override
  String get claimSubmission_accordionAccountInfo_bankNameInput_label =>
      'ชื่อธนาคาร';

  @override
  String get claimSubmission_accordionAccountInfo_bankNameInput_placeholder =>
      'กรอกชื่อธนาคาร';

  @override
  String get claimSubmission_accordionAccountInfo_bankBranchInput_label =>
      'สาขาธนาคาร';

  @override
  String get claimSubmission_accordionAccountInfo_bankBranchInput_placeholder =>
      'กรอกสาขาธนาคาร';

  @override
  String get claimSubmission_accordionAccountInfo_accountNumberInput_label =>
      'เลขที่บัญชี';

  @override
  String
      get claimSubmission_accordionAccountInfo_accountNumberInput_placeholder =>
          'กรอกเลขที่บัญชี';

  @override
  String get claimSubmission_accordionClaimBenefit_title => 'ประเภทการเคลม';

  @override
  String get claimSubmission_accordionClaimBenefit_benefitInfo =>
      'ข้อมูลผลประโยชน์';

  @override
  String get claimSubmission_accordionClaimBenefit_serviceTypeInput_label =>
      'Service Type';

  @override
  String
      get claimSubmission_accordionClaimBenefit_serviceTypeInput_placeholder =>
          'Select service type';

  @override
  String get claimSubmission_accordionClaimBenefit_benefitInput_label =>
      'Claim Type';

  @override
  String get claimSubmission_accordionClaimBenefit_benefitInput_placeholder =>
      'Select claim type';

  @override
  String get claimSubmission_accordionGeneralDoc_title => 'เอกสารทั่วไป';

  @override
  String get claimSubmission_accordionSupportingDoc_title => 'เอกสารสนับสนุน';

  @override
  String get claimSubmission_accordionClaimDetails_title =>
      'รายละเอียดการเรียกร้อง';

  @override
  String get claimBenefitUploads_navTitle => 'เคลมประกัน';

  @override
  String get claimBenefitUploads_airpaz => 'เคลม Airpaz';

  @override
  String get claimBenefitUploads_travel => 'ประกันการเดินทาง';

  @override
  String get claimBenefitUploads_pa => 'ประกันอุบัติเหตุส่วนบุคคล';

  @override
  String get claimBenefitUploads_generalDoc => 'เอกสารทั่วไป';

  @override
  String get claimBenefitUploads_chronologyInput_placeholder => 'เล่าเหตุการณ์';

  @override
  String get claimBenefitUploads_alerts_successSaveDraft => 'บันทึกร่างสำเร็จ';

  @override
  String get claimBenefitUploads_alerts_failedSaveDraft =>
      'บันทึกร่างไม่สำเร็จ';

  @override
  String get claimBenefitUploads_changesUnsavedAlert_title =>
      'คุณยังไม่ได้ทำการอัปโหลดไฟล์ให้เสร็จสิ้น';

  @override
  String get claimBenefitUploads_changesUnsavedAlert_description =>
      'บันทึกการยื่นคำร้องเป็นแบบร่างหรือไม่?';

  @override
  String get claimBenefitUploads_changesUnsavedAlert_confirmBack =>
      'ไม่, กลับไปที่หน้าหลัก';

  @override
  String get claimBenefitUploads_changesUnsavedAlert_confirmSave =>
      'ใช่, บันทึกเป็นแบบร่าง';

  @override
  String get claimPreview_navTitle => 'เคลมประกัน';

  @override
  String get claimPreview_airpaz => 'ประกัน Airpaz';

  @override
  String get claimPreview_travel => 'ประกันการเดินทาง';

  @override
  String get claimPreview_pa => 'ประกันอุบัติเหตุส่วนบุคคล';

  @override
  String get claimPreview_cardPolicyHolder_title => 'ผู้ถือกรมธรรม์';

  @override
  String get claimPreview_cardPolicyHolder_name => 'ชื่อเต็ม';

  @override
  String get claimPreview_cardPolicyHolder_phone => 'เบอร์โทรศัพท์';

  @override
  String get claimPreview_cardPolicyHolder_email => 'อีเมล';

  @override
  String get claimPreview_cardPolicyHolder_policyNumber => 'เลขที่โปลิส';

  @override
  String get claimPreview_cardInsuredInfo_title => 'ชื่อผู้เอาประกัน';

  @override
  String get claimPreview_cardInsuredInfo_noPolicy => 'หมายเลขกรมธรรม์';

  @override
  String get claimPreview_cardInsuredInfo_noParticipant => 'หมายเลขผู้เข้าร่วม';

  @override
  String get claimPreview_cardInsuredInfo_fullName => 'ชื่อเต็ม';

  @override
  String get claimPreview_cardInsuredInfo_gender => 'เพศ';

  @override
  String get claimPreview_cardInsuredInfo_countryCode => 'รหัสประเทศ';

  @override
  String get claimPreview_cardInsuredInfo_noPassport => 'หมายเลขหนังสือเดินทาง';

  @override
  String get claimPreview_cardInsuredInfo_nationality => 'สัญชาติ';

  @override
  String get claimPreview_cardInsuredInfo_dob => 'วันเกิด';

  @override
  String get claimPreview_cardInsuredInfo_pob => 'สถานที่เกิด';

  @override
  String get claimPreview_cardInsuredInfo_address => 'ที่อยู่';

  @override
  String get claimPreview_cardInsuredInfo_job => 'อาชีพ';

  @override
  String get claimPreview_cardInsuredInfo_dateRelease => 'วันที่ออก';

  @override
  String get claimPreview_cardInsuredInfo_dateExpiration => 'วันหมดอายุ';

  @override
  String get claimPreview_cardClaimRequested_title => 'การเคลมที่ยื่น';

  @override
  String get claimPreview_cardClaimRequested_checkTnc1 =>
      'ฉันได้อ่าน เข้าใจ และยอมรับ';

  @override
  String get claimPreview_cardClaimRequested_checkTnc2 => 'ข้อกำหนดและเงื่อนไข';

  @override
  String get claimPreview_cardClaimRequested_checkTnc3 => 'ที่ใช้กับ Teman';

  @override
  String get claimSuccess_title => 'เสร็จสิ้น!';

  @override
  String get claimSuccess_subtitle =>
      'ขอบคุณสำหรับความไว้วางใจในการยื่นเคลมประกันกับ Teman';

  @override
  String get claimSuccess_desc => 'โปรดตรวจสอบอีเมลเพื่อดูรายงานการเคลมของคุณ';

  @override
  String get claimSuccess_backToHome => 'กลับไปที่หน้าหลัก';

  @override
  String get listClaim_title => 'รายการเคลม';

  @override
  String get listClaim_subtitle => 'ติดตามสถานะการเคลมของคุณ';

  @override
  String get listClaim_search_placeholder =>
      'ค้นหาชื่อผู้เข้าร่วม, ประกัน หรือหมายเลขกรมธรรม์';

  @override
  String get listClaim_history_title => 'ประวัติ';

  @override
  String get listClaim_history_empty => 'ขณะนี้คุณยังไม่มีประวัติการเคลม';

  @override
  String get listClaim_history_navigation => 'ประวัติการเคลม';

  @override
  String get listClaim_filterDate_title => 'เลือกวันที่';

  @override
  String get listClaim_filterDate_placeholder => 'ทุกวันที่';

  @override
  String get listClaim_filterDate_opt1 => 'ทุกวันที่เคลม';

  @override
  String get listClaim_filterDate_opt2 => 'เลือกวันที่เอง';

  @override
  String get listClaim_filterDate_startDate => 'เลือกวันเริ่มต้น';

  @override
  String get listClaim_filterDate_endDate => 'เลือกวันสิ้นสุด';

  @override
  String get listClaim_filterStatus_title => 'เลือกสถานะ';

  @override
  String get listClaim_filterStatus_placeholder => 'ทุกสถานะ';

  @override
  String get listClaim_status_all => 'ทั้งหมด';

  @override
  String get listClaim_status_draft => 'ร่าง';

  @override
  String get listClaim_status_allProcessing =>
      'กระบวนการเคลมทั้งหมดที่กำลังดำเนินการ';

  @override
  String get listClaim_status_submitted => 'ส่งคำขอแล้ว';

  @override
  String get listClaim_status_acknowledged => 'รับคำขอแล้ว';

  @override
  String get listClaim_status_documentReview => 'ตรวจสอบเอกสาร';

  @override
  String get listClaim_status_claimAssessment => 'กำลังประเมินคำขอ';

  @override
  String get listClaim_status_approved => 'อนุมัติ';

  @override
  String get listClaim_status_paid => 'จ่ายเงินแล้ว';

  @override
  String get listClaim_status_closed => 'คำเรียกร้องปิดแล้ว';

  @override
  String get listClaim_status_allRejected => 'สถานะคำขอทั้งหมดที่ถูกปฏิเสธ';

  @override
  String get listClaim_status_lackOfDocuments => 'เอกสารไม่ครบถ้วน';

  @override
  String get listClaim_status_rejected => 'ปฏิเสธ';

  @override
  String get listClaim_idClaim => 'ID คำเรียกร้อง';

  @override
  String get listClaim_noClaim =>
      'ยังไม่มีคำเรียกร้อง\nสร้างคำเรียกร้องจากเมนูสร้างใหม่';

  @override
  String get claimDetail_see => 'ดู';

  @override
  String get claimDetail_navTitle => 'เคลมประกัน';

  @override
  String get claimDetail_airpaz => 'เคลม Airpaz';

  @override
  String get claimDetail_travel => 'ประกันการเดินทาง';

  @override
  String get claimDetail_pa => 'ประกันอุบัติเหตุส่วนบุคคล';

  @override
  String get claimDetail_cardJourney_view => 'ดูรายละเอียด';

  @override
  String get claimDetail_cardJourney_claimId => 'ID เคลม';

  @override
  String get claimDetail_cardJourney_viewDetail => 'ประวัติการเคลม';

  @override
  String get claimDetail_cardJourney_approvedAmount => 'จำนวนที่ได้รับอนุมัติ';

  @override
  String get claimDetail_cardPolicyHolder_title => 'ข้อมูลผู้ถือกรมธรรม์';

  @override
  String get claimDetail_cardPolicyHolder_name => 'ชื่อเต็ม';

  @override
  String get claimDetail_cardPolicyHolder_phone => 'เบอร์โทรศัพท์';

  @override
  String get claimDetail_cardPolicyHolder_email => 'อีเมล';

  @override
  String get claimDetail_cardPolicyHolder_policyNumber => 'เลขที่โปลิส';

  @override
  String get claimDetail_cardInsuredInfo_title => 'ชื่อผู้เอาประกัน';

  @override
  String get claimDetail_cardInsuredInfo_noPolicy => 'เลขกรมธรรม์';

  @override
  String get claimDetail_cardInsuredInfo_noParticipant => 'เลขผู้เข้าร่วม';

  @override
  String get claimDetail_cardInsuredInfo_fullName => 'ชื่อเต็ม';

  @override
  String get claimDetail_cardInsuredInfo_gender => 'เพศ';

  @override
  String get claimDetail_cardInsuredInfo_countryCode => 'รหัสประเทศ';

  @override
  String get claimDetail_cardInsuredInfo_noPassport => 'หมายเลขหนังสือเดินทาง';

  @override
  String get claimDetail_cardInsuredInfo_noID => 'เลขประจำตัวประชาชน';

  @override
  String get claimDetail_cardInsuredInfo_nationality => 'สัญชาติ';

  @override
  String get claimDetail_cardInsuredInfo_dob => 'วันเกิด';

  @override
  String get claimDetail_cardInsuredInfo_pob => 'สถานที่เกิด';

  @override
  String get claimDetail_cardInsuredInfo_address => 'ที่อยู่';

  @override
  String get claimDetail_cardInsuredInfo_job => 'อาชีพ';

  @override
  String get claimDetail_cardInsuredInfo_dateRelease => 'วันที่ออก';

  @override
  String get claimDetail_cardInsuredInfo_dateExpiration => 'วันหมดอายุ';

  @override
  String get claimDetail_cardPersonalInfo_title => 'ข้อมูลส่วนตัว';

  @override
  String get claimDetail_cardPersonalInfo_phone => 'เบอร์โทรศัพท์';

  @override
  String get claimDetail_cardAccountInfo_title => 'ข้อมูลบัญชี';

  @override
  String get claimDetail_cardAccountInfo_accountName => 'ชื่อ';

  @override
  String get claimDetail_cardAccountInfo_bankName => 'ชื่อธนาคาร';

  @override
  String get claimDetail_cardAccountInfo_bankBranch => 'สาขาธนาคาร';

  @override
  String get claimDetail_cardAccountInfo_accountNumber => 'หมายเลขบัญชี';

  @override
  String get claimDetail_cardGeneralDocuments_title => 'เอกสารทั่วไป';

  @override
  String get claimDetail_cardSupportingDocuments_title => 'เอกสารประกอบ';

  @override
  String get claimDetail_cardAllDocuments_title => 'รายละเอียดการเคลม';

  @override
  String get claimDetail_cardOtherFiles_title => 'เอกสารเพิ่มเติม';

  @override
  String get claimDetail_cardOtherFiles_item => 'เอกสาร';

  @override
  String get claimJourney_navTitle => 'รายละเอียดสถานะ';

  @override
  String get claimJourney_title => 'สถานะการเคลม';

  @override
  String get claimDocumentDetail_navTitle => 'รายละเอียดผลประโยชน์';

  @override
  String get claimUploadMissingDocuments_navTitle => 'อัปโหลดเอกสาร';

  @override
  String get claimUploadMissingDocuments_accordionNotes_title => 'หมายเหตุ';

  @override
  String get claimUploadMissingDocuments_accordionUploadDoc_title =>
      'อัปโหลดเอกสารเพิ่มเติม';

  @override
  String get claimUploadMissingDocuments_accordionUploadDoc_completed =>
      'เอกสารครบถ้วนแล้ว';

  @override
  String get claimUploadMissingDocuments_successAlert_title => 'สำเร็จ!';

  @override
  String get claimUploadMissingDocuments_successAlert_description =>
      'ขอบคุณที่ได้กรอกข้อมูลที่ร้องขอ กรุณาติดตามการอัปเดตการเคลมเพื่อดูความก้าวหน้าของการเคลมของคุณ';

  @override
  String get notificationBar_claim => 'เคลม';

  @override
  String get notificationBar_null => 'เคลมได้รับการอนุมัติ';

  @override
  String get notificationBar_status_draft => 'ร่างเคลม';

  @override
  String get notificationBar_status_submitted => 'ส่งเคลมแล้ว';

  @override
  String get notificationBar_status_acknowledged => 'รับเคลมแล้ว';

  @override
  String get notificationBar_status_documentReview =>
      'เคลมอยู่ระหว่างการตรวจสอบเอกสาร';

  @override
  String get notificationBar_status_claimAssessment => 'เคลมกำลังประเมิน';

  @override
  String get notificationBar_status_approved => 'เคลมได้รับการอนุมัติ';

  @override
  String get notificationBar_status_paid => 'เคลมได้รับการจ่ายเงิน';

  @override
  String get notificationBar_status_closed => 'ปิดเคลมแล้ว';

  @override
  String get notificationBar_status_lackOfDocuments => 'เคลมขาดเอกสาร';

  @override
  String get notificationBar_status_rejected => 'เคลมถูกปฏิเสธ';

  @override
  String get newClaim_navTitle => 'สร้างการเคลมใหม่';

  @override
  String get yes => 'ใช่';

  @override
  String get no => 'ไม่';

  @override
  String get success => 'สำเร็จ';

  @override
  String get failed => 'ล้มเหลว';

  @override
  String get save => 'บันทึก';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get close => 'ปิด';

  @override
  String get back => 'กลับ';

  @override
  String get submit => 'ส่ง';

  @override
  String get next => 'ถัดไป';

  @override
  String get create => 'Create';

  @override
  String get viewDetail => 'ดูรายละเอียด';

  @override
  String get dataEmpty => 'ยังไม่มีข้อมูล';

  @override
  String get selectLang_title => 'เลือกภาษา';

  @override
  String get selectLang_alertTitle => 'การเปลี่ยนภาษา';

  @override
  String get selectLang_alertDesc =>
      'ภาษาของแอปพลิเคชันจะเปลี่ยนตามที่คุณเลือก';

  @override
  String get uploadFile_placeholder => 'อัปโหลดเอกสาร';

  @override
  String get uploadFile_fileSelected => 'เอกสารที่เลือก';

  @override
  String get uploadFile_addMore => 'เพิ่มไฟล์';

  @override
  String get uploadFile_reUpload => 'อัปโหลดใหม่';

  @override
  String get uploadFile_uploadFromGallery => 'อัปโหลดจากแกลเลอรี';

  @override
  String get uploadFile_tutorial => 'Photo tutorial';

  @override
  String get months_january => 'มกราคม';

  @override
  String get months_february => 'กุมภาพันธ์';

  @override
  String get months_march => 'มีนาคม';

  @override
  String get months_april => 'เมษายน';

  @override
  String get months_may => 'พฤษภาคม';

  @override
  String get months_june => 'มิถุนายน';

  @override
  String get months_july => 'กรกฎาคม';

  @override
  String get months_august => 'สิงหาคม';

  @override
  String get months_september => 'กันยายน';

  @override
  String get months_october => 'ตุลาคม';

  @override
  String get months_november => 'พฤศจิกายน';

  @override
  String get months_december => 'ธันวาคม';

  @override
  String get datetimepicker_date => 'วันที่';

  @override
  String get datetimepicker_month => 'เดือน';

  @override
  String get datetimepicker_year => 'ปี';

  @override
  String get datetimepicker_time => 'เวลา';

  @override
  String get bottomNav_home => 'หน้าหลัก';

  @override
  String get bottomNav_status => 'กรมธรรม์';

  @override
  String get bottomNav_create => 'สร้างใหม่';

  @override
  String get bottomNav_claim => 'เคลม';

  @override
  String get bottomNav_history => 'ประวัติ';

  @override
  String get bottomNav_logout => 'ออกจากระบบ';

  @override
  String get bottomNav_newPolicy => 'กรมธรรม์ใหม่';

  @override
  String get bottomNav_newClaim => 'เคลมใหม่';

  @override
  String get bottomNav_passenger => 'ผู้โดยสาร';

  @override
  String get bottomNav_driver => 'คนขับรถ';

  @override
  String get topNav_login => 'เข้าสู่ระบบ';

  @override
  String get logout_title => 'ออกจากระบบ';

  @override
  String get logout_message1 => 'ขอบคุณที่ใช้บริการ Friendsure!';

  @override
  String get logout_message2 => 'คุณแน่ใจหรือไม่ว่าต้องการออกจากระบบ?';

  @override
  String get logout_cancel => 'ยกเลิก';

  @override
  String get logout_confirm => 'ออก';

  @override
  String get selectlist_otherBank => 'ธนาคารอื่น';

  @override
  String get selectlist_otherHospital => 'Other hospital';

  @override
  String get input_placeholderInsertProduct => 'Insert product name';

  @override
  String get inviteMember => 'Invite Member!';

  @override
  String get potentialCommission => 'Potential Commission';

  @override
  String get performance => 'Performance';

  @override
  String get productName => 'Product Name';

  @override
  String get planList => 'Plan List';

  @override
  String get addScheme => 'Add Scheme';

  @override
  String get customer => 'Customer';

  @override
  String get transaction => 'Transaction';

  @override
  String get report => 'Report';

  @override
  String get support => 'Support';

  @override
  String get expectedCommisionFee => 'Expected Commision Fee';

  @override
  String get dialogConfirm_titleReview => 'Create and publish product';

  @override
  String get dialogConfirm_review =>
      'Please review the chosen scheme and plan carefully, as they cannot be edited once published.';

  @override
  String get product => 'Product';

  @override
  String get maxSelectProduct =>
      'Select up to 3 products to sell. Any products not selected will be deactivated.';

  @override
  String get loadMore => 'Load more';

  @override
  String get required_general => 'จำเป็นต้องกรอก';

  @override
  String get required_date => 'วันที่จำเป็นต้องกรอก';

  @override
  String get required_month => 'เดือนจำเป็นต้องกรอก';

  @override
  String get required_year => 'ปีจำเป็นต้องกรอก';

  @override
  String get required_time => 'เวลาจำเป็นต้องกรอก';

  @override
  String required_minLength(Object min) {
    return 'Minimum $min characters required.';
  }

  @override
  String get invalidFormat_phone => 'รูปแบบหมายเลขโทรศัพท์ไม่ถูกต้อง';

  @override
  String get invalidFormat_email => 'รูปแบบอีเมลไม่ถูกต้อง';

  @override
  String get invalidFormat_fileFormat =>
      'Invalid file format (supported: .pdf, .png, .jpg)';

  @override
  String get maximumLength_fileSize => 'Maximum file size is ';

  @override
  String get listHistory_titlePolicy => 'ประวัตินโยบาย';

  @override
  String get listHistory_titleClaim => 'ประวัติคำเรียกร้อง';

  @override
  String get listHistory_subtitle => 'เลือกนโยบายที่คุณต้องการเรียกร้อง';

  @override
  String get listHistory_search_placeholder =>
      'ค้นหาชื่อผู้เข้าร่วม, ประกันภัย, หรือหมายเลขนโยบาย';

  @override
  String get listHistory_filterDate_title => 'เลือกวันที่';

  @override
  String get listHistory_filterDate_placeholder => 'ทุกวันที่';

  @override
  String get listHistory_filterDate_opt1 => 'ทุกวันที่';

  @override
  String get listHistory_filterDate_opt2 => 'เลือกวันที่เอง';

  @override
  String get listHistory_filterDate_startDate => 'เลือกวันที่เริ่มต้น';

  @override
  String get listHistory_filterDate_endDate => 'เลือกวันที่สิ้นสุด';

  @override
  String get listHistory_status_all => 'ทั้งหมด';

  @override
  String get listHistory_status_active => 'ใช้งานอยู่';

  @override
  String get listHistory_status_draft => 'ร่าง';

  @override
  String get listHistory_status_expired => 'หมดอายุ';

  @override
  String get listHistory_empty_claim => 'ขณะนี้คุณยังไม่มีประวัติคำเรียกร้อง';

  @override
  String get listHistory_empty_policy => 'ขณะนี้คุณยังไม่มีประวัตินโยบาย';

  @override
  String get homePreview_claimTitle => 'คำเรียกร้องล่าสุด';

  @override
  String get homePreview_policyTitle => 'นโยบายล่าสุด';

  @override
  String get homePreview_seeMore => 'ดูทั้งหมด';

  @override
  String get homePreview_status_draft => 'ร่าง';

  @override
  String get homePreview_status_process => 'กำลังดำเนินการ';

  @override
  String get homePreview_status_success => 'อนุมัติ';

  @override
  String get homePreview_status_close => 'ปิด';

  @override
  String get homePreview_status_withdraw => 'กำลังถอนเงิน';

  @override
  String get homePreview_status_reject => 'ปฏิเสธ';

  @override
  String get homePreview_status_needAction => 'เอกสารไม่ครบถ้วน';

  @override
  String get homePreview_status_sent => 'คำขอส่งแล้ว';

  @override
  String get homePreview_newestPolicy_empty =>
      'ขณะนี้คุณยังไม่มีกรมธรรม์ที่ใช้งานอยู่';

  @override
  String get homePreview_newestClaim_empty =>
      'ขณะนี้คุณยังไม่มีการเรียกร้องค่าสินไหมที่ใช้งานอยู่';

  @override
  String get home_welcome => 'ยินดีต้อนรับ';

  @override
  String get home_message => 'คุณมี';

  @override
  String get home_type => 'ประเภทประกัน';

  @override
  String get home_policy => 'นโยบายที่ใช้งาน';

  @override
  String get home_claim => 'คำเรียกร้องที่ใช้งาน';

  @override
  String get home_idClaim => 'รหัสเคลม';

  @override
  String get listClaim_status_process => 'กำลังดำเนินการ';

  @override
  String get listClaim_status_applicationSent => 'คำขอส่งแล้ว';

  @override
  String get listClaim_status_applicationProcess => 'คำขอกำลังดำเนินการ';

  @override
  String get listClaim_status_paymentProcessing => 'กำลังดำเนินการจ่ายเงิน';

  @override
  String get listClaim_status_success => 'จ่ายเงินสำเร็จ';

  @override
  String get listClaim_status_claimRejected => 'คำเรียกร้องถูกปฏิเสธ';

  @override
  String get listPolicy_status_title => 'สถานะ';

  @override
  String get listPolicy_status_placeholder => 'ทั้งหมด';

  @override
  String get listPolicy_status_all => 'ทั้งหมด';

  @override
  String get listPolicy_status_active => 'ใช้งานอยู่';

  @override
  String get listPolicy_status_draft => 'ร่าง';

  @override
  String get listPolicy_status_expired => 'หมดอายุ';

  @override
  String get listPolicy_status_gracePeriod => 'ระยะเวลาผ่อนผัน';

  @override
  String get listPolicy_status_lapse => 'ขาดการชำระเงิน';

  @override
  String get choosePolicy_title => 'รายการประกันภัย';

  @override
  String get choosePolicy_subtitle => 'เลือกประกันภัยที่คุณต้องการเคลม';

  @override
  String get choosePolicy_airpaz => 'แอร์พาซ';

  @override
  String get choosePolicy_travel => 'ประกันการเดินทาง';

  @override
  String get choosePolicy_pa => 'ประกันอุบัติเหตุส่วนบุคคล';

  @override
  String get choosePolicy_policy => 'กรมธรรม์ที่ใช้งานอยู่';

  @override
  String get choosePolicy_history => 'ประวัติ';

  @override
  String get choosePolicy_archive => 'เอกสารเก่า';

  @override
  String get choosePolicy_activeClaim => 'เคลมที่ใช้งานอยู่';

  @override
  String get choosePolicy_title2 => 'รายการเคลม';

  @override
  String get choosePolicy_subtitle2 => 'ติดตามสถานะการเคลมของคุณ';

  @override
  String get listPolicy_title => 'รายการกรมธรรม์';

  @override
  String get listPolicy_subtitle => 'เลือกกรมธรรม์ที่คุณต้องการเคลม';

  @override
  String get listPolicy_search_placeholder =>
      'ค้นหาชื่อผู้เข้าร่วม, ประกันภัย หรือหมายเลขกรมธรรม์';

  @override
  String get listPolicy_endorsementPending => ' การตรวจสอบข้อมูล';

  @override
  String get listPolicy_endorsementRejected => 'การเปลี่ยนแปลงข้อมูลถูกปฏิเสธ';

  @override
  String get listPolicy_filterDate_title => 'เลือกวันที่';

  @override
  String get listPolicy_filterDate_placeholder => 'ทุกวันที่';

  @override
  String get listPolicy_filterDate_opt1 => 'ทุกวันที่ของกรมธรรม์';

  @override
  String get listPolicy_filterDate_opt2 => 'เลือกวันที่ที่กำหนดเอง';

  @override
  String get listPolicy_filterDate_startDate => 'เลือกวันที่เริ่มต้น';

  @override
  String get listPolicy_filterDate_endDate => 'เลือกวันที่สิ้นสุด';

  @override
  String get listPolicy_status_pendingPolicy => 'กรมธรรม์รอดำเนินการ';

  @override
  String get listPolicy_history_title => 'ประวัติ';

  @override
  String get listPolicy_history_empty => 'คุณไม่มีประวัติกรมธรรม์ในปัจจุบัน';

  @override
  String get listPolicy_history_navigation => 'ประวัติกรมธรรม์';

  @override
  String get listPolicy_empty => 'คุณไม่มีกรมธรรม์ในปัจจุบัน';

  @override
  String get listPolicy_outOfClaim_title => 'ผลประโยชน์ทั้งหมดถูกเคลมแล้ว';

  @override
  String get listPolicy_outOfClaim_subtitle =>
      'กรุณาติดต่อทีม Teman หากคุณเชื่อว่านี่เป็นข้อผิดพลาด';

  @override
  String get listPolicy_outOfClaim_button => 'ตกลง';

  @override
  String get policySubmission_navTitle => 'เคลมประกันภัย';

  @override
  String get policySubmission_airpaz => 'เคลมแอร์พาซ';

  @override
  String get policySubmission_travel => 'ประกันการเดินทาง';

  @override
  String get policySubmission_pa => 'ประกันอุบัติเหตุส่วนบุคคล';

  @override
  String get policySubmission_cardPolicyHolder_title => 'ข้อมูลผู้ถือกรมธรรม์';

  @override
  String get policySubmission_cardPolicyHolder_info1 => 'ชื่อเต็ม';

  @override
  String get policySubmission_cardPolicyHolder_info2 => 'หมายเลขโทรศัพท์';

  @override
  String get policySubmission_cardPolicyHolder_info3 => 'อีเมล';

  @override
  String get policySubmission_accordionInsuredInfo_title =>
      'ชื่อผู้เอาประกันภัย';

  @override
  String get policySubmission_accordionInsuredInfo_select =>
      'เลือกผู้เอาประกันภัย';

  @override
  String get policySubmission_accordionInsuredInfo_noPolicy =>
      'หมายเลขกรมธรรม์';

  @override
  String get policySubmission_accordionInsuredInfo_noParticipant =>
      'หมายเลขผู้เข้าร่วม';

  @override
  String get policySubmission_accordionInsuredInfo_fullName => 'ชื่อเต็ม';

  @override
  String get policySubmission_accordionInsuredInfo_gender => 'เพศ';

  @override
  String get policySubmission_accordionInsuredInfo_countryCode => 'รหัสประเทศ';

  @override
  String get policySubmission_accordionInsuredInfo_noPassport =>
      'หมายเลขหนังสือเดินทาง';

  @override
  String get policySubmission_accordionInsuredInfo_noID => 'หมายเลขบัตรประชาชน';

  @override
  String get policySubmission_accordionInsuredInfo_nationality => 'สัญชาติ';

  @override
  String get policySubmission_accordionInsuredInfo_dob => 'วันเกิด';

  @override
  String get policySubmission_accordionInsuredInfo_pob => 'สถานที่เกิด';

  @override
  String get policySubmission_accordionInsuredInfo_address => 'ที่อยู่';

  @override
  String get policySubmission_accordionInsuredInfo_job => 'อาชีพ';

  @override
  String get policySubmission_accordionInsuredInfo_dateRelease =>
      'วันที่ออกเอกสาร';

  @override
  String get policySubmission_accordionInsuredInfo_dateExpiration =>
      'วันหมดอายุ';

  @override
  String get policySubmission_accordionPersonalInfo_title => 'ข้อมูลส่วนตัว';

  @override
  String get policySubmission_accordionPersonalInfo_phoneInput_label =>
      'หมายเลขโทรศัพท์ (WhatsApp)';

  @override
  String get policySubmission_accordionPersonalInfo_phoneInput_placeholder =>
      'ใส่หมายเลขโทรศัพท์';

  @override
  String get policySubmission_accordionPersonalInfo_addressInput_label =>
      'ที่อยู่สำหรับการส่งเคลม';

  @override
  String get policySubmission_accordionPersonalInfo_addressInput_placeholder =>
      'ที่อยู่';

  @override
  String get policySubmission_accordionPersonalInfo_countryInput_placeholder =>
      'ประเทศ';

  @override
  String get policySubmission_accordionPersonalInfo_stateInput_placeholder =>
      'รัฐ';

  @override
  String get policySubmission_accordionPersonalInfo_cityInput_placeholder =>
      'เมือง/เขต';

  @override
  String get policySubmission_accordionPersonalInfo_districtInput_placeholder =>
      'อำเภอ';

  @override
  String
      get policySubmission_accordionPersonalInfo_subdistrictInput_placeholder =>
          'ตำบล';

  @override
  String
      get policySubmission_accordionPersonalInfo_postalCodeInput_placeholder =>
          'รหัสไปรษณีย์';

  @override
  String get policySubmission_accordionPersonalInfo_street1Input_placeholder =>
      'ถนน 1';

  @override
  String get policySubmission_accordionPersonalInfo_street2Input_placeholder =>
      'ถนน 2';

  @override
  String get policySubmission_accordionAccountInfo_title => 'ข้อมูลบัญชี';

  @override
  String get policySubmission_accordionAccountInfo_accountName_input =>
      'ชื่อเจ้าของบัญชี';

  @override
  String get policySubmission_accordionAccountInfo_accountName_placeholder =>
      'ใส่ชื่อเหมือนในสมุดบัญชี';

  @override
  String get policySubmission_accordionAccountInfo_accountNameInput_label =>
      'ชื่อเจ้าของบัญชี';

  @override
  String
      get policySubmission_accordionAccountInfo_accountNameInput_placeholder =>
          'ใส่ชื่อเหมือนในสมุดบัญชี';

  @override
  String get policySubmission_accordionAccountInfo_bankInput_label =>
      'เลือกธนาคาร';

  @override
  String get policySubmission_accordionAccountInfo_bankInput_placeholder =>
      'เลือกธนาคาร';

  @override
  String get policySubmission_accordionAccountInfo_bankBranchInput_label =>
      'สาขาธนาคาร';

  @override
  String
      get policySubmission_accordionAccountInfo_bankBranchInput_placeholder =>
          'ใส่สาขาธนาคาร';

  @override
  String get policySubmission_accordionAccountInfo_accountNumberInput_label =>
      'หมายเลขบัญชี';

  @override
  String
      get policySubmission_accordionAccountInfo_accountNumberInput_placeholder =>
          'ใส่หมายเลขบัญชี';

  @override
  String get policySubmission_accordionClaimBenefit_title => 'ประเภทการเคลม';

  @override
  String get policySubmission_accordionClaimBenefit_benefitInfo =>
      'ข้อมูลผลประโยชน์';

  @override
  String get policyPreview_navTitle => 'เคลมประกันภัย';

  @override
  String get policyPreview_airpaz => 'ประกันแอร์พาซ';

  @override
  String get policyPreview_travel => 'ประกันการเดินทาง';

  @override
  String get policyPreview_pa => 'ประกันอุบัติเหตุส่วนบุคคล';

  @override
  String get policyPreview_cardPolicyHolder_title => 'ผู้ถือกรมธรรม์';

  @override
  String get policyPreview_cardPolicyHolder_info1 => 'ชื่อเต็ม';

  @override
  String get policyPreview_cardPolicyHolder_info2 => 'หมายเลขโทรศัพท์';

  @override
  String get policyPreview_cardPolicyHolder_info3 => 'อีเมล';

  @override
  String get policyPreview_cardInsuredInfo_title => 'ชื่อผู้เอาประกันภัย';

  @override
  String get policyPreview_cardInsuredInfo_noPolicy => 'หมายเลขกรมธรรม์';

  @override
  String get policyPreview_cardInsuredInfo_noParticipant =>
      'หมายเลขผู้เข้าร่วม';

  @override
  String get policyPreview_cardInsuredInfo_fullName => 'ชื่อเต็ม';

  @override
  String get policyPreview_cardInsuredInfo_gender => 'เพศ';

  @override
  String get policyPreview_cardInsuredInfo_countryCode => 'รหัสประเทศ';

  @override
  String get policyPreview_cardInsuredInfo_noPassport =>
      'หมายเลขหนังสือเดินทาง';

  @override
  String get policyPreview_cardInsuredInfo_nationality => 'สัญชาติ';

  @override
  String get policyPreview_cardInsuredInfo_dob => 'วันเกิด';

  @override
  String get policyPreview_cardInsuredInfo_pob => 'สถานที่เกิด';

  @override
  String get policyPreview_cardInsuredInfo_address => 'ที่อยู่';

  @override
  String get policyPreview_cardInsuredInfo_job => 'อาชีพ';

  @override
  String get policyPreview_cardInsuredInfo_dateRelease => 'วันที่ออกเอกสาร';

  @override
  String get policyPreview_cardInsuredInfo_dateExpiration => 'วันหมดอายุ';

  @override
  String get policyPreview_cardClaimRequested_title => 'คำขอเคลม';

  @override
  String get policyPreview_cardClaimRequested_checkTnc1 =>
      'ฉันได้อ่าน, เข้าใจ, และยอมรับ';

  @override
  String get policyPreview_cardClaimRequested_checkTnc2 =>
      'ข้อกำหนดและเงื่อนไข';

  @override
  String get policyPreview_cardClaimRequested_checkTnc3 =>
      'ที่เกี่ยวข้องกับ Teman';

  @override
  String get listHistory_title => 'ประวัติกรมธรรม์';

  @override
  String get detailPolicy_navTitle => 'รายละเอียดกรมธรรม์';

  @override
  String get detailPolicy_noData => 'กรมธรรม์ไม่สามารถใช้งานได้';

  @override
  String get detailPolicy_accordionInsured_title => 'ชื่อผู้เอาประกันภัย';

  @override
  String get detailPolicy_accordionInsured_noPolicy => 'หมายเลขกรมธรรม์';

  @override
  String get detailPolicy_accordionInsured_noParticipant =>
      'หมายเลขผู้เข้าร่วม';

  @override
  String get detailPolicy_accordionInsured_fullName => 'ชื่อเต็ม';

  @override
  String get detailPolicy_accordionInsured_gender => 'เพศ';

  @override
  String get detailPolicy_accordionInsured_countryCode => 'รหัสประเทศ';

  @override
  String get detailPolicy_accordionInsured_noPassport =>
      'หมายเลขหนังสือเดินทาง';

  @override
  String get detailPolicy_accordionInsured_noID => 'หมายเลขบัตรประชาชน';

  @override
  String get detailPolicy_accordionInsured_nationality => 'สัญชาติ';

  @override
  String get detailPolicy_accordionInsured_dob => 'สถานที่/วันเกิด';

  @override
  String get detailPolicy_accordionInsured_pob => 'สถานที่เกิด';

  @override
  String get detailPolicy_accordionInsured_address => 'ที่อยู่';

  @override
  String get detailPolicy_accordionInsured_job => 'อาชีพ';

  @override
  String get detailPolicy_accordionInsured_dateRelease => 'วันที่ออกเอกสาร';

  @override
  String get detailPolicy_accordionInsured_dateExpiration => 'วันหมดอายุ';

  @override
  String get detailPolicy_accordionInsured_edit => 'แก้ไขข้อมูล';

  @override
  String get endorsement_navTitle => 'แก้ไขข้อมูล';

  @override
  String get endorsement_confirmation_title => 'ยืนยันการเปลี่ยนแปลงข้อมูล';

  @override
  String get endorsement_confirmation_description =>
      'ก่อนยืนยัน กรุณาตรวจสอบว่าข้อมูลทั้งหมดถูกต้อง การส่งคำขอก่อนเวลา 17:00 WIB จะได้รับการดำเนินการในวันเดียวกัน คุณยังสามารถส่งเคลมได้ในระหว่างกระบวนการตรวจสอบ';

  @override
  String get endorsement_info_success =>
      'เอกสารกรมธรรม์อยู่ระหว่างการเปลี่ยนแปลงข้อมูล แต่ Teman Protection ยังคงใช้งานได้ ดังนั้นคุณยังสามารถส่งเคลมได้';

  @override
  String get endorsement_info_error =>
      'ไม่สามารถดำเนินการคำขอเปลี่ยนแปลงข้อมูลของคุณได้เนื่องจาก';

  @override
  String get endorsement_nameInput_label => 'ชื่อ';

  @override
  String get endorsement_nameInput_placeholder => 'ใส่ชื่อเต็ม';

  @override
  String get endorsement_nikInput_label => 'บัตรประชาชน';

  @override
  String get endorsement_nikInput_placeholder => 'ใส่หมายเลขบัตรประชาชน';

  @override
  String get endorsement_dobInput_label => 'วันเกิด';

  @override
  String get endorsement_dobInput_placeholder => 'เลือกวันที่';

  @override
  String get endorsement_pobInput_label => 'สถานที่เกิด';

  @override
  String get endorsement_pobInput_placeholder => 'ใส่ตามที่ระบุในบัตรประชาชน';

  @override
  String get endorsement_passportNoInput_label => 'หมายเลขหนังสือเดินทาง';

  @override
  String get endorsement_passportNoInput_placeholder =>
      'ใส่หมายเลขหนังสือเดินทาง';

  @override
  String get endorsement_passportTypeInput_label => 'ประเภทหนังสือเดินทาง';

  @override
  String get endorsement_passportTypeInput_placeholder =>
      'ใส่ประเภทหนังสือเดินทาง';

  @override
  String get endorsement_nationalityInput_label => 'สัญชาติ';

  @override
  String get endorsement_nationalityInput_placeholder => 'เลือกสัญชาติ';

  @override
  String get endorsement_countryCodeInput_label => 'รหัสประเทศ';

  @override
  String get endorsement_countryCodeInput_placeholder => 'ใส่รหัสประเทศ';

  @override
  String get endorsement_genderInput_label => 'เพศ';

  @override
  String get endorsement_genderInput_placeholder => 'เลือกเพศ';

  @override
  String get endorsement_stateInput_label => 'ที่อยู่';

  @override
  String get endorsement_stateInput_placeholder => 'รัฐ';

  @override
  String get endorsement_cityInput_label => 'เมือง/เขต';

  @override
  String get endorsement_cityInput_placeholder => 'เมือง/เขต';

  @override
  String get endorsement_districtInput_label => 'อำเภอ';

  @override
  String get endorsement_districtInput_placeholder => 'อำเภอ';

  @override
  String get endorsement_subdistrictInput_label => 'ตำบล/หมู่บ้าน';

  @override
  String get endorsement_subdistrictInput_placeholder => 'ตำบล/หมู่บ้าน';

  @override
  String get endorsement_street1Input_label => 'ใส่ตามที่ระบุในบัตรประชาชน';

  @override
  String get endorsement_street1Input_placeholder =>
      'ใส่ตามที่ระบุในบัตรประชาชน';

  @override
  String get endorsement_street2Input_label => 'RT/RW';

  @override
  String get endorsement_street2Input_placeholder =>
      'ใส่ตามที่ระบุในบัตรประชาชน';

  @override
  String get endorsement_jobInput_label => 'อาชีพ';

  @override
  String get endorsement_jobInput_placeholder => 'ใส่ตามที่ระบุในบัตรประชาชน';

  @override
  String get endorsement_dateReleaseInput_label => 'วันที่ออกเอกสาร';

  @override
  String get endorsement_dateReleaseInput_placeholder => 'เลือกวันที่';

  @override
  String get endorsement_dateExpirationInput_label => 'วันหมดอายุ';

  @override
  String get endorsement_dateExpirationInput_placeholder => 'เลือกวันที่';

  @override
  String get endorsement_issuingOfficeInput_label => 'สำนักงานที่ออกเอกสาร';

  @override
  String get endorsement_issuingOfficeInput_placeholder => 'ใส่ชื่อสำนักงาน';
}
