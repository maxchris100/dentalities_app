import 'dart:convert';

import 'package:foriyana_app/data/models/agent_commission_model.dart';
import 'package:foriyana_app/domain/entities/user/agent_contribution.dart';

AgentContributonModel agentContributionModelFromJson(String str) =>
    AgentContributonModel.fromJson(json.decode(str));

String agentContributionModelToJson(AgentContributonModel data) =>
    json.encode(data.toJson());

class AgentContributonModel extends AgentContribution {
  const AgentContributonModel({
    required super.gwp,
    required AgentCommissionModel super.commission,
  });

  factory AgentContributonModel.fromJson(Map<String, dynamic> json) =>
      AgentContributonModel(
        gwp: json["gwp"],
        commission: AgentCommissionModel.fromJson(json["commission"]),
      );

  Map<String, dynamic> toJson() => {
        "gwp": gwp,
        "commission": (commission as AgentCommissionModel).toJson(),
      };
}
