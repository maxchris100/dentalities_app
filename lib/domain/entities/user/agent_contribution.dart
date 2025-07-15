import 'package:equatable/equatable.dart';

class AgentContribution extends Equatable {
  final int gwp;
  final AgentCommission commission;

  const AgentContribution({
    required this.gwp,
    required this.commission,
  });

  @override
  List<Object> get props => [
        gwp,
        commission,
      ];
}

class AgentCommission {
  final int? earned;
  final int? potential;

  const AgentCommission({
    this.earned,
    this.potential,
  });
}
