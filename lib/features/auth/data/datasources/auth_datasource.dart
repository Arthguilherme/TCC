import '../models/usuario_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart';

abstract class AuthDatasource {
  Future<UsuarioModel> login(String email, String senha);
  Future<UsuarioModel> cadastrar(UsuarioModel usuario);
}

class AuthDatasourceSupabase implements AuthDatasource {
  final _supabase = Supabase.instance.client;

  @override
  Future<UsuarioModel> login(String email, String senha) async {
    final response = await _supabase.auth.signInWithPassword(
      email: email,
      password: senha,
    );

    if (response.user == null) {
      throw Exception('Email ou senha incorretos');
    }

    final perfil = await _supabase
        .from('perfis')
        .select()
        .eq('id', response.user!.id)
        .single();

    return UsuarioModel(
      id: null,
      nome: perfil['nome'] as String,
      email: response.user!.email!,
      senha: '',
      telefone: perfil['telefone'] as String?,
      cidade: perfil['cidade'] as String?,
    );
  }

@override
Future<UsuarioModel> cadastrar(UsuarioModel usuario) async {
  try {
    final response = await _supabase.auth.signUp(
      email: usuario.email,
      password: usuario.senha,
    );

    debugPrint('SignUp response: ${response.user}');

    if (response.user == null) {
      throw Exception('Erro ao criar conta');
    }

    await _supabase.from('perfis').insert({
      'id': response.user!.id,
      'nome': usuario.nome,
      'telefone': usuario.telefone,
      'cidade': usuario.cidade,
    });

    return UsuarioModel(
      id: null,
      nome: usuario.nome,
      email: usuario.email,
      senha: '',
      telefone: usuario.telefone,
      cidade: usuario.cidade,
    );
  } catch (e) {
    debugPrint('Erro no cadastro: $e');
    rethrow;
  }
}
}