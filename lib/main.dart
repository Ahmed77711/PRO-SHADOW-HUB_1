import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

// ==========================================
// 1. البيانات والموديل (في نفس الملف)
// ==========================================
class Tutorial {
  final String title;
  final String flag;
  final List<Color> gradient;
  final List<String> steps;
  final String youtubeUrl;

  Tutorial({
    required this.title,
    required this.flag,
    required this.gradient,
    required this.steps,
    required this.youtubeUrl,
  });
}

List<Tutorial> tutorials = [
  Tutorial(
    title: 'حساب أمريكي 🇺🇸',
    flag: '🇺🇸',
    gradient: [const Color(0xFF1E3C72), const Color(0xFF2A5298)],
    steps: [
      'قم بتشغيل تطبيق VPN واختر سيرفر أمريكي (USA).',
      'افتح التيك توك أو انستقرام واختر التسجيل برقم هاتف.',
      'ابحث في جوجل عن "USA Virtual Number" للحصول على رقم وهمي.',
      'أدخل الرقم واستقبل كود التحقق بسرعة.',
      'أكمل بياناتك واختر اهتماماتك بما يتناسب مع المحتوى الأمريكي.',
    ],
    youtubeUrl: 'https://www.youtube.com/results?search_query=create+usa+account+tutorial',
  ),
  Tutorial(
    title: 'حساب فرنسي 🇫🇷',
    flag: '🇫🇷',
    gradient: [const Color(0xFF0F2027), const Color(0xFF203A43)],
    steps: [
      'قم بتشغيل الـ VPN واختر سيرفر فرنسا (France).',
      'افتح التطبيق المطلوب وسجل برقم الهاتف.',
      'احصل على رقم فرنسي مؤقت من مواقع مثل SMS-Activate.',
      'أدخل الرقم وفعل الحساب.',
      'قم بتغيير لغة التطبيق للفرنسية لزيادة الأمان.',
    ],
    youtubeUrl: 'https://www.youtube.com/results?search_query=create+france+account+tutorial',
  ),
  Tutorial(
    title: 'حساب بريطاني 🇬🇧',
    flag: '🇬🇧',
    gradient: [const Color(0xFF141E30), const Color(0xFF243B55)],
    steps: [
      'اتصل بـ VPN سيرفر لندن (UK).',
      'اذهب لصفحة التسجيل في التطبيق.',
      'استخدم رقم بريطاني وهمي (+44).',
      'تأكد من إدخال تاريخ ميلاد فوق 18 سنة.',
      'تفاعل مع فيديوهات بريطانية لمدة يومين لتثبيت الحساب.',
    ],
    youtubeUrl: 'https://www.youtube.com/results?search_query=create+uk+account+tutorial',
  ),
  Tutorial(
    title: 'حساب ياباني 🇯🇵',
    flag: '🇯🇵',
    gradient: [const Color(0xFF870000), const Color(0xFF190A05)],
    steps: [
      'اختر سيرفر اليابان (Japan) في الـ VPN.',
      'حمل التطبيق من متجر ياباني أو استخدم APK.',
      'احصل على رقم ياباني (+81).',
      'سجل واختر اللغة اليابانية في الإعدادات.',
      'أكمل الخطوات ولا تخرج من الـ VPN أثناء التسجيل.',
    ],
    youtubeUrl: 'https://www.youtube.com/results?search_query=create+japan+account+tutorial',
  ),
  Tutorial(
    title: 'حساب هونغ كونغ 🇭🇰',
    flag: '🇭🇰',
    gradient: [const Color(0xFF4B79A1), const Color(0xFF283E51)],
    steps: [
      'قم بتوصيل الـ VPN بهونغ كونغ.',
      'استخدم بريد إلكتروني جديد (Gmail).',
      'احصل على رقم هونغ كونغ (+852).',
      'أدخل الكود واستقبل الرسالة.',
      'قم بتسجيل الدخول من المتصفح أولاً لتأمين الحساب.',
    ],
    youtubeUrl: 'https://www.youtube.com/results?search_query=create+hong+kong+account+tutorial',
  ),
  Tutorial(
    title: 'حساب كندي 🇨🇦',
    flag: '🇨🇦',
    gradient: [const Color(0xFFCB356B), const Color(0xFFBD3F32)],
    steps: [
      'افتح الـ VPN واتصل بكندا (Canada).',
      'افتح التطبيق واختر التسجيل.',
      'استخدم رقم كندي (+1).',
      'أدخل كود التحقق الذي سيصلك.',
      'قم بتغيير المنطقة في إعدادات الحساب لتثبيت الدولة.',
    ],
    youtubeUrl: 'https://www.youtube.com/results?search_query=create+canada+account+tutorial',
  ),
];

// ==========================================
// 2. التطبيق والثيم الفخم
// ==========================================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'دليل الحسابات',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F0F13),
        primaryColor: const Color(0xFFD4AF37),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// ==========================================
// 3. الشاشة الرئيسية
// ==========================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('دليل الحسابات العالمية'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tutorials.length,
        itemBuilder: (context, index) {
          final tutorial = tutorials[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(tutorial: tutorial),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: tutorial.gradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: tutorial.gradient.last.withOpacity(0.4),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Text(
                    tutorial.flag,
                    style: const TextStyle(fontSize: 50),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      tutorial.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white70,
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ==========================================
// 4. شاشة التفاصيل
// ==========================================
class DetailScreen extends StatelessWidget {
  final Tutorial tutorial;
  
  const DetailScreen({super.key, required this.tutorial});

  Future<void> _openYoutube(BuildContext context) async {
    final uri = Uri.parse(tutorial.youtubeUrl);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('مش قادر افتح اليوتيوب')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tutorial.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: tutorial.gradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: tutorial.gradient.last.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  tutorial.flag, 
                  style: const TextStyle(fontSize: 70),
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            Expanded(
              child: ListView.builder(
                itemCount: tutorial.steps.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: tutorial.gradient.first,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            tutorial.steps[index], 
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 16),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _openYoutube(context),
                icon: const Icon(Icons.play_circle_fill, color: Colors.white),
                label: const Text(
                  'فتح الشرح على يوتيوب', 
                  style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF0000),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 8,
                  shadowColor: Colors.red.withOpacity(0.5),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}