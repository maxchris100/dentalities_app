import 'dart:convert';

import 'package:foriyana_app/domain/entities/user/agent_contribution.dart';

AgentCommissionModel userModelFromJson(String str) =>
    AgentCommissionModel.fromJson(json.decode(str));

String userModelToJson(AgentCommissionModel data) => json.encode(data.toJson());

class AgentCommissionModel extends AgentCommission {
  const AgentCommissionModel({required super.earned, required super.potential});

  factory AgentCommissionModel.fromJson(Map<String, dynamic> json) =>
      AgentCommissionModel(
        earned: json["earned"],
        potential: json["potential"],
      );

  Map<String, dynamic> toJson() => {"earned": earned, "potential": potential};
}
