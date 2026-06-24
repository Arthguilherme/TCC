import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:replaykids/core/injector/injector.dart';
import 'package:replaykids/core/routes/app_router.dart';
import 'package:replaykids/core/theme/app_colors.dart';
import 'package:replaykids/features/anuncio/presentation/controllers/publish_controller.dart';
import 'package:replaykids/features/anuncio/presentation/widgets/publish_scaffold.dart';

class PublishStep3Page extends StatelessWidget {
  const PublishStep3Page({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = injector.get<PublishController>();

    return buildPublishScaffold(
      context: context,
      step: '3/3',
      progress: 1,
      title: 'Revisar e publicar',
      leading: Icons.arrow_back,
      secondaryLabel: 'Voltar',
      onSecondary: () => Navigator.maybePop(context),
      primaryLabel: 'Publicar agora',
      primaryIcon: Icons.check,
      onPrimary: () {
        controller.publicar(); 
        ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(
          content: Text('Anúncio publicado com sucesso!'),
          backgroundColor: AppColors.c600,
          ),

        );

        context.go(AppRouter.feed);
      },
      
      body: Builder(builder: (context) {
        final titulo =
            controller.titulo.isEmpty ? 'Sem título' : controller.titulo;
        final descricao = controller.descricao.isEmpty
            ? 'Sem descrição'
            : controller.descricao;
        final condicao = controller.condicao.toUpperCase();
        final categoria = controller.categoria;
        final faixaEtaria = controller.faixaEtaria;
        final isVenda = controller.isVenda;
        final preco = controller.preco;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.neutral100),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 140,
                    decoration: const BoxDecoration(
                      color: AppColors.c100,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.image_outlined,
                            color: AppColors.c400, size: 40),
                        SizedBox(height: 6),
                        Text(
                          'Fotos do anúncio',
                          style: TextStyle(
                            color: AppColors.c600,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                titulo,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.c100,
                                borderRadius: BorderRadius.circular(99),
                              ),
                              child: Text(
                                condicao,
                                style: const TextStyle(
                                  fontSize: 10,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.c800,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          descricao,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.neutral600,
                            height: 1.45,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(height: 1, color: AppColors.neutral100),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.location_on_outlined,
                                    size: 12, color: AppColors.neutral500),
                                SizedBox(width: 4),
                                Text(
                                  'Litoral do PR',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: AppColors.neutral500,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              isVenda ? 'R\$ $preco' : 'Doação',
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                color: AppColors.c700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Resumo
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.c50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.c200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'RESUMO',
                    style: TextStyle(
                      fontSize: 11,
                      letterSpacing: 1.5,
                      color: AppColors.c800,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _SummaryRow('Categoria', categoria),
                  _SummaryRow('Faixa etária', faixaEtaria),
                  _SummaryRow('Tipo', isVenda ? 'Venda' : 'Doação'),
                  _SummaryRow('Condição', controller.condicao),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Checkbox confirmação
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.only(top: 2),
                  decoration: BoxDecoration(
                    color: AppColors.c500,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(Icons.check, size: 14, color: Colors.white),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Confirmo que o item está higienizado, em boas condições e que as fotos são reais.',
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.neutral600,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        );
      }),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String k, v;
  const _SummaryRow(this.k, this.v, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(k,
              style:
                  const TextStyle(fontSize: 12, color: AppColors.neutral600)),
          Text(v,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.neutral900)),
        ],
      ),
    );
  }
}
