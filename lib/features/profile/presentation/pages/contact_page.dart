import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/custom_top_bar.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final List<bool> _selected = List.generate(4, (index) => true);

  final List<Map<String, String>> _contacts = [
    {'name': 'Oliver Thompson', 'handle': '@oliver', 'avatar': 'assets/images/avatar/1.png'},
    {'name': 'Sophia Martinez', 'handle': '@sophia', 'avatar': 'assets/images/avatar/2.png'},
    {'name': 'Liam Johnson', 'handle': '@liam', 'avatar': 'assets/images/avatar/3.png'},
    {'name': 'Emma Williams', 'handle': '@emma', 'avatar': 'assets/images/avatar/4.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomTopBar(
        variant: TopBarVariant.title,
        title: 'Contact',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Text(
              '4 Contacts',
              style: AppTypography.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 24,
                color: AppColors.textHeading,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _contacts.length,
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                final contact = _contacts[index];
                return Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image.asset(
                          contact['avatar']!,
                          fit: BoxFit.cover,
                          width: 48,
                          height: 48,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            contact['name']!,
                            style: AppTypography.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textHeading,
                            ),
                          ),
                          Text(
                            contact['handle']!,
                            style: AppTypography.textTheme.bodyMedium?.copyWith(
                              color: AppColors.textBody,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected[index] = !_selected[index];
                        });
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: _selected[index] ? AppColors.primaryBlue : Colors.white,
                          border: Border.all(
                            color: _selected[index] ? AppColors.primaryBlue : AppColors.borderGrey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: _selected[index]
                            ? const Icon(Icons.check, size: 16, color: Colors.white)
                            : null,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Add ${_selected.where((e) => e).length} Friends',
                  style: AppTypography.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
