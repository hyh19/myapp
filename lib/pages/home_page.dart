import 'package:flutter/material.dart';
import '../widgets/section_header.dart';
import '../widgets/feature_card.dart';
import '../widgets/use_case_card.dart';
import '../widgets/app_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const AppNavBar(currentRoute: '/'),
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
                  Image.asset(
                    'assets/images/app-icon.png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Batch File Rename Assistant',
                    style: theme.textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Batch renaming tool with AI',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Powerful batch file renaming tool with insert, replace, delete, and incremental renaming features, plus AI-powered smart renaming for efficient file management.',
                      style: theme.textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Batch File Rename Assistant is a powerful yet easy-to-use batch file renaming tool designed to help you manage and rename files efficiently.',
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Features Section
          const SliverToBoxAdapter(
            child: SectionHeader(title: 'Key Features'),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              FeatureCard(
                title: 'Batch Renaming',
                description:
                    'Rename multiple files at once, eliminating the need to rename files one by one manually.',
              ),
              FeatureCard(
                title: 'Multiple Renaming Options',
                description:
                    'Choose from a variety of renaming methods to suit your needs:',
                items: [
                  'Insert Text: Add custom text at specified positions in filenames',
                  'Replace Text: Replace specified text in filenames with new text',
                  'Delete Text: Remove specified text from filenames',
                  'Incremental Renaming: Automatically add sequential numbers to files, such as File-1, File-2, File-3',
                ],
              ),
              FeatureCard(
                title: 'AI-Powered Smart Renaming',
                description:
                    'Use AI technology to automatically generate renaming rules based on your description, making file renaming smarter and more convenient.',
              ),
            ]),
          ),

          // Use Cases Section
          SliverToBoxAdapter(
            child: Container(
              color: theme.colorScheme.surfaceContainerHighest,
              child: const SectionHeader(title: 'Use Cases'),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverLayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = constraints.crossAxisExtent > 600 ? 2 : 1;
                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: crossAxisCount == 2 ? 1.2 : 1.5,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  delegate: SliverChildListDelegate([
                const UseCaseCard(
                  title: 'Organize Photos and Video Files',
                  description:
                      'Quickly rename your media files with consistent naming conventions, making them easier to find and organize.',
                ),
                const UseCaseCard(
                  title: 'Batch Modify Downloaded File Names',
                  description:
                      'Clean up and standardize file names from downloads, removing unnecessary characters or adding meaningful prefixes.',
                ),
                const UseCaseCard(
                  title: 'Standardize File Naming Conventions',
                  description:
                      'Ensure all files in a directory follow the same naming pattern for better organization and consistency.',
                ),
                const UseCaseCard(
                  title: 'Add Sequential Numbers or Dates',
                  description:
                      'Automatically add sequential numbers or dates to files, perfect for organizing series or chronological files.',
                ),
                const UseCaseCard(
                  title: 'Clean Up Unnecessary Characters',
                  description:
                      'Remove unwanted characters, spaces, or symbols from file names to keep them clean and professional.',
                ),
                  ]),
                );
              },
            ),
          ),

          // Usage Section
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(top: 24),
              child: const SectionHeader(title: 'Usage Guide'),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildUsageSection(
                context,
                'Basic Workflow',
                'Follow these steps to rename your files:',
                [
                  'Open Batch File Rename Assistant',
                  'Select the files you want to rename',
                  'Add one or more renaming rules',
                  'Preview the new file names',
                  'Apply the changes to rename your files',
                ],
              ),
              _buildUsageSection(
                context,
                'Combining Multiple Rules',
                'You can combine multiple renaming rules to achieve complex renaming tasks. Rules are applied in sequence, allowing you to:',
                [
                  'First insert a prefix or suffix',
                  'Then replace specific text patterns',
                  'Finally add incremental numbers',
                ],
                additionalText:
                    'For example, you can first replace "IMG_" with "Photo_", then add incremental numbers to create "Photo_1.jpg", "Photo_2.jpg", etc.',
              ),
              _buildUsageSection(
                context,
                'AI-Powered Smart Renaming',
                'The AI renaming feature allows you to describe your renaming needs in natural language, and the app will automatically generate the appropriate renaming rules.',
                [
                  'Select the files you want to rename',
                  'Enable AI renaming mode',
                  'Describe your renaming requirements in plain English',
                  'Review the generated renaming rules',
                  'Apply the changes if satisfied',
                ],
                exampleText:
                    'If you describe "Replace \'IMG_\' with \'Photo_\' and add numbers at the end", the AI will generate rules to replace the text and add incremental numbers, resulting in files like "Photo_1.jpg", "Photo_2.jpg", etc.',
              ),
            ]),
          ),

          // Footer
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(32),
              color: theme.colorScheme.surfaceContainerHighest,
              child: Text(
                'Batch File Rename Assistant features an intuitive interface and simple operations, making file renaming easy and efficient.',
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUsageSection(
    BuildContext context,
    String title,
    String description,
    List<String> steps, {
    String? additionalText,
    String? exampleText,
  }) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: theme.textTheme.bodyLarge,
            ),
            if (additionalText != null) ...[
              const SizedBox(height: 12),
              Text(
                additionalText,
                style: theme.textTheme.bodyLarge,
              ),
            ],
            const SizedBox(height: 16),
            ...steps.asMap().entries.map((entry) {
              final index = entry.key;
              final step = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        step,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              );
            }),
            if (exampleText != null) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                  border: Border(
                    left: BorderSide(
                      color: theme.colorScheme.primary,
                      width: 4,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Example:',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      exampleText,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

