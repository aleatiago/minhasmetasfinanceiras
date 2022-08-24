class MetaFinanceira {
  int id;
  String? nome;
  String? descricao;
  double valorMeta;
  DateTime prazo;

  MetaFinanceira(
      {required this.id,
      this.nome,
      this.descricao,
      required this.valorMeta,
      required this.prazo});
}

class DetalheMetaFinanceira {
  int? idMeta;
  String? tipoInvestimento;
  double? taxaPreFixada;
  String? taxaPos;
  double? ultimoIndiceTaxaPos;
  DateTime? dataInidiceTaxaPos;
  DateTime? dataResgate;
  double? valorAtual;
}
