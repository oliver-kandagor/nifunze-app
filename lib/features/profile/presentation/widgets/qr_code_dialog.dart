import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class QRCodeDialog extends StatelessWidget {
  final String name;
  final String username;
  final String avatarUrl;

  const QRCodeDialog({
    super.key,
    required this.name,
    required this.username,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 48,
                  height: 48,
                  child: IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.close),
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: AppColors.borderGrey, width: 1.5),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      name,
                      style: AppTypography.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.textHeading,
                      ),
                    ),
                    Text(
                      username,
                      style: AppTypography.textTheme.bodySmall?.copyWith(
                        color: AppColors.textBody,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 48), // To balance the close button
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: 250,
              height: 250,
              child: QrImageView(
                data: 'https://nifunze.app/user/$username',
                version: QrVersions.auto,
                size: 250.0,
                backgroundColor: Colors.white,
                embeddedImage: AssetImage(avatarUrl),
                embeddedImageStyle: const QrEmbeddedImageStyle(
                  size: Size(60, 60),
                ),
                eyeStyle: const QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: Colors.black,
                ),
                dataModuleStyle: const QrDataModuleStyle(
                  dataModuleShape: QrDataModuleShape.square,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.textHeading,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: AppColors.borderGrey, width: 1.5),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.ios_share, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Share',
                          style: AppTypography.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.textHeading,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: AppColors.borderGrey, width: 1.5),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.link, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Copy',
                          style: AppTypography.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
