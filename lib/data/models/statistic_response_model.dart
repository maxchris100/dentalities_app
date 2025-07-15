import 'package:foriyana_app/core/util/string_util.dart';
import 'package:foriyana_app/data/models/profile_response_model.dart';

class StatisticResponseModel {
  int? downline;
  double? fee;
  int? point;
  dynamic dates;
  int? landingPage;
  int? personalInfo;
  int? declaration;
  int? payment;
  int? uploadNRIC;
  int? issueCertificate;
  int? onProgress;
  double? gwp;
  Commission? commission;

  StatisticResponseModel({
    this.downline,
    this.fee,
    this.point,
    this.dates,
    this.landingPage,
    this.personalInfo,
    this.declaration,
    this.payment,
    this.uploadNRIC,
    this.issueCertificate,
    this.onProgress,
    this.gwp,
    this.commission,
  });

  StatisticResponseModel.fromJson(Map<String, dynamic> json) {
    downline = json['downline'];
    fee = double.tryParse(StringUtil.castToString(json['fee']));
    point = json['point'];
    dates = json['dates'];
    landingPage = json['Landing Page'];
    personalInfo = json['Personal Info'];
    declaration = json['Declaration'];
    payment = json['Payment'];
    uploadNRIC = json['Upload NRIC'];
    issueCertificate = json['Issue Certificate'];
    onProgress = json['On Progress'];
    gwp = double.tryParse(StringUtil.castToString(json['gwp']));
    commission = json['commission'] != null
        ? new Commission.fromJson(json['commission'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['downline'] = this.downline;
    data['fee'] = this.fee;
    data['point'] = this.point;

    data['Landing Page'] = this.landingPage;
    data['Personal Info'] = this.personalInfo;
    data['Declaration'] = this.declaration;
    data['Payment'] = this.payment;
    data['Upload NRIC'] = this.uploadNRIC;
    data['gwp'] = this.gwp;
    if (this.commission != null) {
      data['commission'] = this.commission!.toJson();
    }
    return data;
  }
}
