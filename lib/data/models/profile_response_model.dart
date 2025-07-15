import 'package:foriyana_app/core/util/string_util.dart';

class ProfileResponseModel {
  String? id;
  String? channel;
  String? account;
  String? accountParent;
  String? code;
  double? gwp;
  Commission? commission;

  ProfileResponseModel({
    this.id,
    this.channel,
    this.account,
    this.accountParent,
    this.code,
    this.gwp,
    this.commission,
  });

  ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    channel = json['channel'];
    account = json['account'];
    accountParent = json['account_parent'];
    code = json['code'];
    gwp = json['gwp'];
    commission =
        json['commission'] != null
            ? Commission.fromJson(json['commission'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['channel'] = this.channel;
    data['account'] = this.account;
    data['account_parent'] = this.accountParent;
    data['code'] = this.code;
    data['gwp'] = this.gwp;
    if (this.commission != null) {
      data['commission'] = this.commission!.toJson();
    }
    return data;
  }
}

class Commission {
  double? potential;
  double? earned;

  Commission({this.potential, this.earned});

  Commission.fromJson(Map<String, dynamic> json) {
    potential = double.parse(StringUtil.castToString(json['potential']));
    earned = double.parse(StringUtil.castToString(json['earned']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['potential'] = this.potential;
    data['earned'] = this.earned;
    return data;
  }
}
