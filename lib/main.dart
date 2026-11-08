import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _repositoryUrl = 'https://github.com/HasanMu/univ-s5-pm2-p5';

void main() {
  runApp(const MyApp());
}

/// Warna utama aplikasi agar konsisten di seluruh halaman.
class AppColors {
  AppColors._();

  static const background = Color(0xFFF5F1E8);
  static const primary = Color(0xFF0D6B65);
  static const darkText = Color(0xFF193A38);
  static const mutedText = Color(0xFF3A4A47);
  static const amber = Color(0xFFE6B566);
  static const mint = Color(0xFFB7D8D2);
  static const noteBackground = Color(0xFFE4EFEA);
  static const noteBorder = Color(0xFFB8D3C9);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruang Belajar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Comfortaa',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: AppColors.background,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: AppColors.darkText,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: AppColors.darkText,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(color: AppColors.mutedText, height: 1.45),
        ),
      ),
      home: const LearningProfilePage(),
    );
  }
}

class LearningProfilePage extends StatelessWidget {
  const LearningProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Ruang Belajar'),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: 'Notifikasi',
            icon: Badge(
              smallSize: 8,
              backgroundColor: AppColors.amber,
              child: const Icon(Icons.notifications_none_rounded),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _GreetingCard(),
                        const SizedBox(height: 28),
                        Text(
                          'Ringkasan minggu ini',
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: 12),
                        const Row(
                          children: [
                            Expanded(
                              child: _ProgressCard(
                                icon: Icons.menu_book_rounded,
                                value: '12',
                                label: 'Materi selesai',
                                color: AppColors.amber,
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: _ProgressCard(
                                icon: Icons.timer_outlined,
                                value: '6j 40m',
                                label: 'Waktu belajar',
                                color: AppColors.mint,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 28),
                        Text(
                          'Lanjutkan belajar',
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: 12),
                        const _ContinueLearningCard(),
                        const SizedBox(height: 28),
                        Text(
                          'Target minggu ini',
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: 12),
                        const _WeeklyTargetCard(),
                        const SizedBox(height: 28),
                        Text(
                          'Catatan singkat',
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: 12),
                        const _NoteCard(),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: Center(child: _RepositoryFooter()),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _GreetingCard extends StatelessWidget {
  const _GreetingCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            width: 76,
            height: 76,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Image.asset('assets/github.png'),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo, Hasan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Siap melanjutkan progres Flutter hari ini?',
                  style: TextStyle(color: Color(0xFFD8EFEB), height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  const _ProgressCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.darkText),
          const SizedBox(height: 18),
          Text(value, style: textTheme.headlineSmall),
          const SizedBox(height: 4),
          Text(label, style: textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _ContinueLearningCard extends StatelessWidget {
  const _ContinueLearningCard();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFFCE4C1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.widgets_rounded, color: Color(0xFF9A5B18)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mengenal Widget Dasar',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text('Bab 3  •  68% selesai', style: textTheme.bodyMedium),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(99),
                  child: LinearProgressIndicator(
                    value: 0.68,
                    minHeight: 6,
                    backgroundColor: const Color(0xFFF1EDE3),
                    valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right_rounded, color: AppColors.primary),
        ],
      ),
    );
  }
}

class _WeeklyTargetCard extends StatelessWidget {
  const _WeeklyTargetCard();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.noteBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.emoji_events_outlined,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('4 dari 6 materi', style: textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(
                      '2 materi lagi untuk mencapai target',
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '67%',
                style: textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: LinearProgressIndicator(
              value: 0.67,
              minHeight: 6,
              backgroundColor: const Color(0xFFF1EDE3),
              valueColor: const AlwaysStoppedAnimation(AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}

class _NoteCard extends StatelessWidget {
  const _NoteCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.noteBackground,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.noteBorder),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lightbulb_outline_rounded, color: AppColors.primary),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Gunakan Column untuk susunan vertikal dan Row untuk susunan mendatar. Container membantu mengatur ruang dan tampilan.',
            ),
          ),
        ],
      ),
    );
  }
}

class _RepositoryFooter extends StatelessWidget {
  const _RepositoryFooter();

  Future<void> _openRepository() async {
    final uri = Uri.parse(_repositoryUrl);
    if (!await launchUrl(uri)) {
      debugPrint('Tidak dapat membuka $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _openRepository,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/github.png', width: 18, height: 18),
            const SizedBox(width: 8),
            const Flexible(
              child: Text(
                'github.com/HasanMu/univ-s5-pm2-p5',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, color: AppColors.mutedText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
