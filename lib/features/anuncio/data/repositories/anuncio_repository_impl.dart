import '../../domain/entities/anuncio_entity.dart';
import '../../domain/repositories/anuncio_repository.dart';

class AnuncioRepositoryImpl implements AnuncioRepository {
  final List<AnuncioEntity> _anuncios = [];
  int _nextId = 1;

  @override
  List<AnuncioEntity> listar() => List.unmodifiable(_anuncios);

  @override
  void publicar(AnuncioEntity anuncio) {
    _anuncios.insert(
      0, 
      AnuncioEntity(
        id: _nextId++,
        titulo: anuncio.titulo,
        descricao: anuncio.descricao,
        condicao: anuncio.condicao,
        categoria: anuncio.categoria,
        faixaEtaria: anuncio.faixaEtaria,
        isVenda: anuncio.isVenda,
        preco: anuncio.preco,
      ),
    );
  }
}