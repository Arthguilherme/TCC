class AnuncioEntity {
  final int id;
  final String titulo;
  final String descricao;
  final String condicao;
  final String categoria;
  final String faixaEtaria;
  final bool isVenda;
  final String preco;

  const AnuncioEntity({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.condicao,
    required this.categoria,
    required this.faixaEtaria,
    required this.isVenda,
    required this.preco,
  });
}