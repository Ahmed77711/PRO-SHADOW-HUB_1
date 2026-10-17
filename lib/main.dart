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
  final String noPaymentTip;
  final String sandboxInfo;

  const Tutorial({
    required this.flag,
    required this.title,
    required this.subtitle,
    required this.gradient,
    required this.youtubeUrl,
    required this.steps,
    required this.noPaymentTip,
    required this.sandboxInfo,
  });
}

class HomeScreen extends StatelessWidget 
  const HomeScreen({super.key});

  static const List<Tutorial> tutorials = 
    Tutorial(
      flag: '🇺🇸',
      title: 'حساب أمريكي',
      subtitle: 'Google Play / Apple ID',
      gradient: [Color(0xFF0F52BA), Color(0xFF041E42)],
      youtubeUrl: 'https://www.youtube.com/watch?v=8aGhZQkoFbQ',
      steps: ['افتح VPN أمريكا', 'انشئ Gmail جديد', 'اختار الدولة United States'],
      noPaymentTip: 'الطريقة القانونية: نزّل أي تطبيق مجاني > انشئ Apple ID جديد > هيظهرلك None في الدفع',
      sandboxInfo: 'للمطورين: استخدم بطاقة اختبار جوجل 4111 1111 1111 1111 في وضع الاختبار',
    ),
    Tutorial(
      flag: '🇫🇷',
      title: 'حساب فرنسي',
      subtitle: 'للمحتوى الأوروبي',
      gradient: [Color(0xFF002395), Color(0xFFED2939)],
      youtubeUrl: 'https://www.youtube.com/watch?v=QH2-TGUlwu4',
      steps: ['VPN فرنسا', 'حساب جديد', 'كود بريدي 75001'],
      noPaymentTip: 'اختار الدولة France واعمل Skip لخطوة الدفع',
      sandboxInfo: 'فعل Test Mode من Google Play Console > Setup > License Testing',
    ),
    Tutorial
      flag: '🇬🇧',
      title: 'حساب بريطاني',
      subtitle: 'أفضل للبرامج المدفوعة',
      gradient: [Color(0xFF012169), Color(0xFFC8102E)],
      youtube