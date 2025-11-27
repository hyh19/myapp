import 'package:flutter/material.dart';
import '../widgets/feature_card.dart';
import '../widgets/app_nav_bar.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const AppNavBar(currentRoute: '/privacy'),
      body: CustomScrollView(
        slivers: [
          // Hero Section
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    theme.colorScheme.surfaceContainerHighest,
                    theme.colorScheme.surface,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Privacy Policy',
                    style: theme.textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your privacy is important to us',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          // Privacy Policy Content
          SliverList(
            delegate: SliverChildListDelegate([
              FeatureCard(
                title: 'Internet Access',
                description:
                    'This application requires internet access for the following features:',
                items: [
                  'Firebase Remote Config: To fetch AI service configuration settings',
                  'AI-Powered Renaming: When you use the AI renaming feature, the application connects to third-party AI services (such as OpenRouter) to process your renaming requests',
                ],
              ),
              _buildDataCollectionSection(context),
              FeatureCard(
                title: 'Third-Party Services',
                description:
                    'This application uses the following third-party services:',
                items: [
                  'Firebase: Used for remote configuration management. Firebase\'s privacy policy applies to data handled by their services',
                  'AI Service Providers: When using AI renaming, your file names and requirements are sent to third-party AI service providers (such as OpenRouter). Please refer to their respective privacy policies for information on how they handle your data',
                ],
              ),
              FeatureCard(
                title: 'Data Storage',
                description:
                    'AI service configuration settings (API keys, endpoints, etc.) are cached locally on your device for performance purposes. These settings do not contain any personal information or file data.',
              ),
              FeatureCard(
                title: 'Privacy Protection',
                description:
                    'We are committed to protecting your privacy:',
                items: [
                  'File operations are performed locally unless you explicitly use the AI renaming feature',
                  'We do not collect, store, or share your personal information',
                  'We do not track your usage or behavior',
                  'Your files remain on your device and are never uploaded to our servers',
                ],
              ),
            ]),
          ),

          // Footer
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(32),
              color: theme.colorScheme.surfaceContainerHighest,
              child: Text(
                'Batch File Rename Assistant is committed to protecting your privacy and ensuring your data security. Need help? Contact our support team.',
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataCollectionSection(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data Collection and Usage',
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'When using AI renaming feature:',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ...[
              'File names and your renaming requirements are sent to third-party AI services to generate renaming suggestions',
              'This data is transmitted only when you actively use the AI renaming feature',
              'The AI service processes your request and returns renaming suggestions',
              'We do not store or retain the file names or renaming requests after processing',
            ].map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4, right: 8),
                        child: Icon(
                          Icons.check_circle,
                          size: 20,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          item,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: 16),
            Text(
              'When not using AI renaming:',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ...[
              'All file operations are performed locally on your device',
              'No data is collected or transmitted',
            ].map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4, right: 8),
                        child: Icon(
                          Icons.check_circle,
                          size: 20,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          item,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

