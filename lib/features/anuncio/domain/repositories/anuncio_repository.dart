import '../entities/anuncio_entity.dart';

abstract class AnuncioRepository {
  List<AnuncioEntity> listar();
  void publicar(AnuncioEntity anuncio);
}