import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PremiumTutorialsApp());
}

class PremiumTutorialsApp extends StatelessWidget {
  const PremiumTutorialsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0A0A0F),
      ),
      home: const HomeScreen(),
    );
  }
}

class Tutorial {
  final String flag;
  final String title;
  final String subtitle;
  final List<Color> gradient;
  final String youtubeUrl;
  final List<String> steps;
  const Tutorial({required this.flag, required this.title, required this.subtitle, required this.gradient, required this.youtubeUrl, required this.steps});
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const List<Tutorial> tutorials = [
    Tutorial(flag: '🇺🇸', title: 'حساب امريكي', subtitle: 'Google Play / Apple ID', gradient: [Color(0xFF0F52BA), Color(0xFF041E42)], youtubeUrl: 'https://www.youtube.com/watch?v=8aGhZQkoFbQ', steps: ['VPN امريكا', 'Gmail جديد', 'الدولة United States']),
    Tutorial(flag: '🇫🇷', title: 'حساب فرنسي', subtitle: 'للمحتوى الاوروبي', gradient: [Color(0xFF002395), Color(0xFFED2939)], youtubeUrl: 'https://www.youtube.com/watch?v=QH2-TGUlwu4', steps: ['VPN فرنسا', 'حساب جديد', 'كود 75001']),
    Tutorial(flag: '🇬🇧', title: 'حساب بريطاني', subtitle: 'للبرامج المدفوعة', gradient: [Color(0xFF012169), Color(0xFFC8102E)], youtubeUrl: 'https://www.youtube.com/watch?v=9bZkp7q19f0', steps: ['VPN بريطانيا', 'حساب جديد', 'كود SW1A 1AA']),
    Tutorial(flag: '🇯🇵', title: 'حساب ياباني', subtitle: 'للالعاب والانمي', gradient: [Color(0xFFBC002D), Color(0xFF000000)], youtubeUrl: 'https://www.youtube.com/watch?v=jNQXAC9IVRw', steps: ['VPN اليابان', 'حساب جديد', 'كود 100-0001']),
    Tutorial(flag: '🇭🇰', title: 'حساب هونج كونج', subtitle: 'للالعاب قبل نزولها', gradient: [Color(0xFFDE2910), Color(0xFFFFDE00)], youtubeUrl: 'https://www.youtube.com/watch?v=OPf0YbXqDm0', steps: ['VPN هونج كونج', 'حساب جديد', 'بدون رقم']),
    Tutorial(flag: '🇨🇦', title: 'حساب كندي', subtitle: 'بديل للامريكي', gradient: [Color(0xFFFF0000), Color(0xFF000000)], youtubeUrl: 'https://www.youtube.com/watch?v=09R8_2nJtjg', steps: ['VPN كندا', 'حساب جديد', 'كود K1A 0B1']),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF12121A), Color(0xFF0A0A0F)])),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.all(20), child: Text('اختار الدولة\nوشوف الشرح', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900))),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 14, mainAxisSpacing: 14, childAspectRatio: 0.85),
                  itemCount: tutorials.length,
                  itemBuilder: (context, i) {
                    final t = tutorials[i];
                    return GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(tutorial: t))),
                      child: Container(
                        decoration: BoxDecoration(gradient: LinearGradient(colors: t.gradient), borderRadius: BorderRadius.circular(24)),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text(t.flag, style: const TextStyle(fontSize: 38)),
                            const Spacer(),
                            Text(t.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17)),
                            Text(t.subtitle, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 11)),
                          ]),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Tutorial tutorial;
  const DetailScreen({super.key, required this.tutorial});
  Future<void> _openYoutube(BuildContext context) async {
    final uri = Uri.parse(tutorial.youtubeUrl);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('مش قادر افتح اليوتيوب')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(backgroundColor: Colors.transparent, iconTheme: const IconThemeData(color: Colors.white), title: Text(tutorial.title, style: const TextStyle(color: Colors.white))),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(height: 180, decoration: BoxDecoration(gradient: LinearGradient(colors: tutorial.gradient), borderRadius: BorderRadius.circular(24)), child: Center(child: Text(tutorial.flag, style: const TextStyle(fontSize: 60)))),
            const SizedBox(height: 20),
            ...tutorial.steps.map((s) => Container(margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white.withOpacity(0.06), borderRadius: BorderRadius.circular(14)), child: Row(children: [const Icon(Icons.check_circle, color: Colors.white54, size: 18), const SizedBox(width: 8), Text(s, style: const TextStyle(color: Colors.white70))]))),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(onPressed: () => _openYoutube(context), icon: const Icon(Icons.play_circle_fill, color: Colors.white), label: const Text('فتح الشرح على يوتيوب', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF0000), padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
            ),
          ],
        ),
      ),
    );
  }
}