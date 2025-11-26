import 'package:flutter/material.dart';
import '../widgets/feature_card.dart';
import '../widgets/app_nav_bar.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const AppNavBar(currentRoute: '/support'),
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
                    'Support & Contact',
                    style: theme.textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "We're here to help",
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Have questions, need assistance, or want to provide feedback? We\'re ready to help you with app issues, general feedback, and feature enhancement requests.',
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Contact Information
          SliverList(
            delegate: SliverChildListDelegate([
              FeatureCard(
                title: 'Contact Information',
                description: 'You can reach us through the following channels:',
                items: [
                  'Email Address: [your-email@example.com]',
                  'Legal Address: [Your Legal Address]',
                  'Telephone: [Your Phone Number]',
                ],
              ),
              FeatureCard(
                title: 'Report an Issue',
                description:
                    'Found a bug or experiencing a problem with the app? Here\'s how you can report it:',
                items: [
                  'Send an email to [your-email@example.com] with the subject line "Bug Report"',
                  'Please include the following information in your report:\n'
                      '• Device information (model, operating system version)\n'
                      '• App version\n'
                      '• Steps to reproduce the issue\n'
                      '• Screenshots or error messages (if applicable)',
                  'We aim to respond to bug reports within 2-3 business days',
                ],
              ),
              FeatureCard(
                title: 'Request a Feature',
                description:
                    'Have an idea for a new feature or improvement? We\'d love to hear from you!',
                items: [
                  'Email us at [your-email@example.com] with the subject line "Feature Request"',
                  'Please describe:\n'
                      '• The feature or enhancement you\'d like to see\n'
                      '• How it would improve your experience\n'
                      '• Any specific use cases or examples',
                  'We review all feature requests and consider them for future updates',
                ],
              ),
              FeatureCard(
                title: 'General Feedback',
                description:
                    'We welcome your feedback, suggestions, and comments about Batch File Rename Assistant.',
                items: [
                  'Share your thoughts via email at [your-email@example.com]',
                  'Your feedback helps us improve the app and better serve all users',
                  'We appreciate your time and input',
                ],
              ),
              _buildCommonSupportSection(context),
            ]),
          ),

          // Footer
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(32),
              color: theme.colorScheme.surfaceContainerHighest,
              child: Text(
                'Batch File Rename Assistant - Need help? Contact our support team.',
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommonSupportSection(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Common Support Scenarios',
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Here are answers to some frequently asked questions:',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            _buildFAQItem(
              context,
              'How do I use AI-powered renaming?',
              'Select your files, enable AI renaming mode, and describe your renaming requirements in plain English. The app will generate appropriate renaming rules for you to review.',
            ),
            const SizedBox(height: 16),
            _buildFAQItem(
              context,
              'Can I undo a batch rename operation?',
              'Before applying any renaming changes, the app shows you a preview. However, once applied, renaming cannot be automatically undone. We recommend backing up important files before batch renaming.',
            ),
            const SizedBox(height: 16),
            _buildFAQItem(
              context,
              'Is my file data sent to external servers?',
              'File data is only transmitted when you explicitly use the AI renaming feature. All other file operations are performed locally on your device. For more information, please see our Privacy Policy.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(
    BuildContext context,
    String question,
    String answer,
  ) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            answer,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

