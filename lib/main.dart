import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PremiumShadowApp());
}

class PremiumShadowApp extends StatelessWidget {
  const PremiumShadowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shadow Tutorials',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0F),
        primaryColor: const Color(0xFFD4AF37), // لون ذهبي فخم
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// ==========================================
// 1. بيانات الدول (مع إضافة الإمارات)
// ==========================================
class CountryData {
  final String title;
  final String flag;
  final String subtitle;
  final List<Color> gradient;
  final String youtubeUrl;

  CountryData({
    required this.title,
    required this.flag,
    required this.subtitle,
    required this.gradient,
    required this.youtubeUrl,
  });
}

final List<CountryData> countries = [
  CountryData(
    title: 'حساب أمريكي',
    flag: '🇺🇸',
    subtitle: 'Google Play / Apple ID',
    gradient: [const Color(0xFF0F52BA), const Color(0xFF041E42)],
    youtubeUrl: 'https://www.youtube.com/results?search_query=create+usa+account+tutorial',
  ),
  CountryData(
    title: 'حساب فرنسي',
    flag: '🇫🇷',
    subtitle: 'للمحتوى الأوروبي',
    gradient: [const Color(0xFF002395), const Color(0xFFED2939)],
    youtubeUrl: 'https://www.youtube.com/results?search_query=create+france+account+tutorial',
  ),
  CountryData(
    title: 'حساب بريطاني',
    flag: '🇬🇧',
    subtitle: 'أفضل للبرامج المدفوعة',
    gradient: [const Color(0xFF012169), const Color(0xFFC8102E)],
    youtubeUrl: 'https://www.youtube.com/results?search_query=create+uk+account+tutorial',
  ),
  CountryData(
    title: 'حساب إماراتي',
    flag: '🇦🇪',
    subtitle: 'للمحتوى الخليجي',
    gradient: [const Color(0xFF00732F), const Color(0xFFFF0000)], // أخضر وأحمر إماراتي
    youtubeUrl: 'https://www.youtube.com/results?search_query=create+uae+account+tutorial',
  ),
  CountryData(
    title: 'حساب ياباني',
    flag: '🇯🇵',
    subtitle: 'للألعاب والأنمي',
    gradient: [const Color(0xFFBC002D), const Color(0xFF000000)],
    youtubeUrl: 'https://www.youtube.com/results?search_query=create+japan+account+tutorial',
  ),
  CountryData(
    title: 'حساب كندي',
    flag: '🇨🇦',
    subtitle: 'بديل ممتاز للأمريكي',
    gradient: [const Color(0xFFFF0000), const Color(0xFF000000)],
    youtubeUrl: 'https://www.youtube.com/results?search_query=create+canada+account+tutorial',
  ),
];

// ==========================================
// 2. الشاشة الرئيسية (الفخمة)
// ==========================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF12121A), Color(0xFF0A0A0F)],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // العنوان الفخم
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD4AF37).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.5)),
                      ),
                      child: const Text(
                        'PREMIUM • SHADOW TUTORIALS',
                        style: TextStyle(color: Color(0xFFD4AF37), fontSize: 10, letterSpacing: 2, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'اختر الدولة\nوشاهد الشرح',
                      style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900, height: 1.2),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'روابط مباشرة لشرح إنشاء الحسابات خطوة بخطوة.',
                      style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 14),
                    ),
                  ],
                ),
              ),
              
              // شبكة الدول
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: countries.length,
                  itemBuilder: (context, i) {
                    final country = countries[i];
                    return GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(country: country))),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: country.gradient, begin: Alignment.topLeft, end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: country.gradient.first.withOpacity(0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            )
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned(right: -20, top: -20, child: Text(country.flag, style: const TextStyle(fontSize: 100, color: Colors.white10))),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(country.flag, style: const TextStyle(fontSize: 40)),
                                  const Spacer(),
                                  Text(country.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                                  const SizedBox(height: 4),
                                  Text(country.subtitle, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12)),
                                  const SizedBox(height: 12),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.play_arrow_rounded, size: 16, color: Colors.black),
                                        SizedBox(width: 4),
                                        Text('شاهد', style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
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

// ==========================================
// 3. شاشة التفاصيل وزر اليوتيوب
// ==========================================
class DetailScreen extends StatelessWidget {
  final CountryData country;
  const DetailScreen({super.key, required this.country});

  Future<void> _openYoutube(BuildContext context) async {
    final uri = Uri.parse(country.youtubeUrl);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تعذر فتح رابط اليوتيوب')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        title: Text('${country.flag} ${country.title}', style: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: country.gradient, begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(color: country.gradient.first.withOpacity(0.4), blurRadius: 20, offset: const Offset(0, 10)),
                ],
              ),
              child: Center(
                child: Text(country.flag, style: const TextStyle(fontSize: 80)),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'اضغط على الزر بالأسفل لمشاهدة شرح إنشاء الحساب',
              style: TextStyle(color: Colors.white70, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () => _openYoutube(context),
                icon: const Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
                label: const Text('مشاهدة الشرح على يوتيوب', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF0000),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}