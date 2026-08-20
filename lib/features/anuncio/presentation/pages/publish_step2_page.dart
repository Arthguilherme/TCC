import 'package:flutter/material.dart';
import 'package:replaykids/core/injector/injector.dart';
import 'package:replaykids/core/theme/app_colors.dart';
import 'package:replaykids/features/anuncio/presentation/controllers/publish_controller.dart';
import 'package:replaykids/features/anuncio/presentation/widgets/publish_scaffold.dart';
import 'publish_step3_page.dart';

class PublishStep2Page extends StatefulWidget {
  const PublishStep2Page({super.key});

  @override
  State<PublishStep2Page> createState() => _PublishStep2PageState();
}

class _PublishStep2PageState extends State<PublishStep2Page> {
  final _controller = injector.get<PublishController>();
  late final _precoController =
      TextEditingController(text: _controller.preco);

  final _categorias = [
    'Brinquedos',
    'Roupas',
    'Carrinhos',
    'Móveis',
    'Livros',
    'Calçados',
    'Acessórios',
    'Outros',
  ];

  final _faixas = [
    '0-6m',
    '6-12m',
    '1-2 anos',
    '2-4 anos',
    '4-6 anos',
    '6+ anos',
  ];

  @override
  void dispose() {
    _precoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildPublishScaffold(
      context: context,
      step: '2/3',
      progress: 2 / 3,
      title: 'Publicar Anúncio',
      leading: Icons.arrow_back,
      secondaryLabel: 'Voltar',
      onSecondary: () => Navigator.maybePop(context),
      primaryLabel: 'Próximo',
      onPrimary: () {
        _controller.preco = _precoController.text;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PublishStep3Page()),
        );
      },
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _categorias.map((c) {
              return SelectChip(
                c,
                selected: _controller.categoria == c,
                onTap: () => setState(() => _controller.categoria = c),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 2.6,
            children: _faixas.map((f) {
              final selected = _controller.faixaEtaria == f;
              return GestureDetector(
                onTap: () => setState(() => _controller.faixaEtaria = f),
                child: Container(
                  decoration: BoxDecoration(
                    color: selected ? AppColors.c500 : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: selected ? AppColors.c500 : AppColors.neutral200,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    f,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: selected ? Colors.white : AppColors.neutral700,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: _OfferCard(
                  title: 'Venda',
                  subtitle: 'Definir preço',
                  icon: Icons.local_offer_outlined,
                  selected: _controller.isVenda,
                  onTap: () => setState(() => _controller.isVenda = true),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _OfferCard(
                  title: 'Doação',
                  subtitle: 'Gratuito',
                  icon: Icons.favorite_border,
                  selected: !_controller.isVenda,
                  onTap: () => setState(() => _controller.isVenda = false),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          if (_controller.isVenda) ...[
            const SectionLabel('Preço'),
            TextField(
              controller: _precoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixText: 'R\$ ',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.neutral200),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: AppColors.c400, width: 1.5),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 4, top: 6),
              child: Text(
                'Sem taxas no ReplayKids.',
                style: TextStyle(fontSize: 11, color: AppColors.neutral500),
              ),
            ),
          ],
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _OfferCard extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _OfferCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: selected ? AppColors.c500 : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? AppColors.c500 : AppColors.neutral200,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon,
                color: selected ? Colors.white : AppColors.c700, size: 18),
            const SizedBox(height: 6),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: selected ? Colors.white : AppColors.neutral800,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 11,
                color: selected ? Colors.white70 : AppColors.neutral500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
