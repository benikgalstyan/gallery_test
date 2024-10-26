import 'package:flutter/material.dart';
import 'package:gallery_test/core/theme/palette.dart';
import 'package:gallery_test/presentation/tokens/spacing.dart';

class PaginationControls extends StatelessWidget {
  const PaginationControls({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageSelected,
  });

  final int currentPage;
  final int totalPages;
  final void Function(int pageNumber) onPageSelected;

  Color _getPageButtonColor(int pageNumber) =>
      pageNumber == currentPage ? Palette.blueButtonColor : Palette.greyButtonColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Spacings.paddingV12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalPages, (index) {
          final pageNumber = index + 1;
          return Padding(
            padding: Spacings.paddingH4,
            child: ElevatedButton(
              onPressed: () {
                if (pageNumber != currentPage) {
                  onPageSelected(pageNumber);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _getPageButtonColor(pageNumber),
              ),
              child: Text(
                '$pageNumber',
                style: const TextStyle(color: Palette.pageColor),
              ),
            ),
          );
        }),
      ),
    );
  }
}
