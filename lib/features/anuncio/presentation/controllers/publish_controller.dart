class PublishController {
  // Step 1
  String titulo = '';
  String descricao = '';
  String condicao = 'Novo';

  // Step 2
  String categoria = 'Brinquedos';
  String faixaEtaria = '1-2 anos';
  bool isVenda = true;
  String preco = '45,00';

  void resetar() {
    titulo = '';
    descricao = '';
    condicao = 'Novo';
    categoria = 'Brinquedos';
    faixaEtaria = '1-2 anos';
    isVenda = true;
    preco = '45,00';
  }
}