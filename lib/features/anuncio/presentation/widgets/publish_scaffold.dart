import 'package:flutter/material.dart';
import 'package:replaykids/core/theme/app_colors.dart';

/// Helper compartilhado pelas 3 telas de publicação
Widget buildPublishScaffold({
  required BuildContext context,
  required String step,
  required double progress,
  required String title,
  required IconData leading,
  required Widget body,
  String? secondaryLabel,
  VoidCallback? onSecondary,
  required String primaryLabel,
  IconData? primaryIcon,
  VoidCallback? onPrimary,
}) {
  return Scaffold(
    backgroundColor: AppColors.c50,
    body: SafeArea(
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.maybePop(context),
                  icon: Icon(leading, color: AppColors.neutral700),
                ),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  step,
                  style: const TextStyle(
                    color: AppColors.c700,
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // Barra de progresso
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(99),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 6,
                backgroundColor: AppColors.c100,
                valueColor: const AlwaysStoppedAnimation(AppColors.c500),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Conteúdo principal com scroll
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: body,
            ),
          ),

          // Botões de navegação
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
            child: Row(
              children: [
                if (secondaryLabel != null) ...[
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onSecondary,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.c700,
                        side: const BorderSide(color: AppColors.c300),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text(secondaryLabel),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
                Expanded(
                  flex: 2,
                  child: ElevatedButton.icon(
                    onPressed: onPrimary,
                    icon: primaryIcon != null
                        ? Icon(primaryIcon, size: 16)
                        : const SizedBox.shrink(),
                    label: Text(primaryLabel),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.c500,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

/// Label de seção
class SectionLabel extends StatelessWidget {
  final String text;
  const SectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: AppColors.neutral800,
        ),
      ),
    );
  }
}

/// Chip selecionável
class SelectChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  const SelectChip(
    this.label, {
    super.key,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? AppColors.c500 : Colors.white,
          borderRadius: BorderRadius.circular(99),
          border: Border.all(
            color: selected ? AppColors.c500 : AppColors.neutral200,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: selected ? Colors.white : AppColors.neutral700,
          ),
        ),
      ),
    );
  }
}