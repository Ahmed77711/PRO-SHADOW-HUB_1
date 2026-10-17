import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const ProShadowHubApp());
}

class ProShadowHubApp extends StatelessWidget {
  const ProShadowHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PRO SHADOW HUB',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF030712),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF3B82F6),
          secondary: Color(0xFFF59E0B),
          surface: Color(0xFF0F172A),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String telegramUrl = 'https://t.me/+ADCq_-JXiuE3NGU0';

  final List<Map<String, dynamic>> itemsList = [
    {
      'title': '💳 طريقة إضافة فيزا وهمية مفعلة',
      'subtitle': 'شرح مباشر لطريقة إنشاء وتفعيل الفيزا الوهمية',
      'url': 'https://www.youtube.com/results?search_query=طريقة+عمل+فيزا+وهمية+تفعيل+سوق+بلاي',
      'icon': Icons.credit_card_rounded,
      'color': const Color(0xFF10B981),
    },
    {
      'title': '🇺🇸 طريقة صنع حساب أمريكي احترافي',
      'subtitle': 'دليل خطوة بخطوة لإنشاء متجر وحساب أمريكي بالكامل',
      'url': 'https://www.youtube.com/results?search_query=طريقة+انشاء+حساب+أمريكي+سوق+بلاي',
      'icon': Icons.flag_rounded,
      'color': const Color(0xFF3B82F6),
    },
    {
      'title': '🇯🇵 طريقة صنع حساب ياباني مميز',
      'subtitle': 'شرح كيفية فتح حساب ياباني للحصول على الألعاب الحصرية',
      'url': 'https://www.youtube.com/results?search_query=طريقة+انشاء+حساب+ياباني+سوق+بلاي',
      'icon': Icons.language_rounded,
      'color': const Color(0xFFEF4444),
    },
    {
      'title': '📦 طريقة اظهار صندوق 400',
      'subtitle': 'شرح مفصل لطريقة إظهار صندوق 400 وحل المشاكل التقنية',
      'url': 'https://www.youtube.com/results?search_query=طريقة+اظهار+صندوق+400',
      'icon': Icons.inventory_2_rounded,
      'color': const Color(0xFFF59E0B),
    },
    {
      'title': '🎬 أفلام متنوعة وحصرية',
      'subtitle': 'مجموعة واسعة من أقوى الأفلام والإنتاجات العالمية',
      'url': 'https://www.youtube.com/results?search_query=فيلم+كامل+HD',
      'icon': Icons.movie_filter_rounded,
      'color': const Color(0xFF8B5CF6),
    },
    {
      'title': '😂 أفلام كوميدية مضحكة',
      'subtitle': 'اضحك من قلبك مع أفضل الأفلام الكوميدية العربية',
      'url': 'https://www.youtube.com/results?search_query=فيلم+كوميدي+عربي+كامل',
      'icon': Icons.emoji_emotions_rounded,
      'color': const Color(0xFFFF7043),
    },
  ];

  Future<void> openExternalUrl(String targetUrl) async {
    final Uri uri = Uri.parse(targetUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PRO SHADOW HUB',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            letterSpacing: 2.2,
            color: Colors.amberAccent,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF090D16),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.send_rounded, color: Color(0xFF3B82F6)),
            tooltip: 'مجموعة التيليجرام',
            onPressed: () => openExternalUrl(telegramUrl),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E1B4B), Color(0xFF0F172A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.amberAccent.withOpacity(0.3), width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.6),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.amberAccent, width: 2),
                    ),
                    child: const CircleAvatar(
                      radius: 26,
                      backgroundColor: Color(0xFF3B82F6),
                      child: Icon(Icons.star_rounded, color: Colors.amberAccent, size: 32),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'منصة الشروحات والترفيه',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'تجربة فاخرة، شروحات وأفلام حصرية',
                          style: TextStyle(fontSize: 12, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            ElevatedButton.icon(
              onPressed: () => openExternalUrl(telegramUrl),
              icon: const Icon(Icons.telegram, color: Colors.white, size: 24),
              label: const Text(
                'انضم إلى مجموعة التيليجرام الرسمية',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0088cc),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 6,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TasksScreen()),
                );
              },
              icon: const Icon(Icons.military_tech_rounded, color: Colors.amberAccent, size: 24),
              label: const Text(
                'مركز المهام والربح (Bybit)',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E293B),
                side: const BorderSide(color: Colors.amberAccent, width: 1.2),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 6,
              ),
            ),
            const SizedBox(height: 26),
            const Text(
              '🔥 الأقسام والشروحات المميزة',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 14),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: itemsList.length,
              itemBuilder: (context, index) {
                final item = itemsList[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.white.withOpacity(0.08)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: (item['color'] as Color).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: (item['color'] as Color).withOpacity(0.3)),
                      ),
                      child: Icon(item['icon'], color: item['color'], size: 28),
                    ),
                    title: Text(
                      item['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                        item['subtitle'],
                        style: const TextStyle(color: Colors.white60, fontSize: 11),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.play_circle_fill_rounded,
                      color: Colors.redAccent,
                      size: 38,
                    ),
                    onTap: () => openExternalUrl(item['url']),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  double balance = 0.00;
  final String bybitUrl = 'https://www.bybit.com/invite?ref=7OZW45Z&medium=referral&utm_campaign=evergreen';
  final String telegramUrl = 'https://t.me/+ADCq_-JXiuE3NGU0';

  Future<void> openExternalUrl(String targetUrl) async {
    final Uri uri = Uri.parse(targetUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'مركز المهام والأرباح',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amberAccent),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF090D16),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.4),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                const Text(
                  'رصيدك المكتسب',
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${balance.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'المهمات الفاخرة المتاحة:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.amberAccent.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'فيزا Bybit مجانية (7OZW45Z)',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      '\$0.50',
                      style: TextStyle(
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'سجل عبر رابط الإحالة الخاص بنا واحصل على الفيزا فوراً.',
                  style: TextStyle(fontSize: 12, color: Colors.white60),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      await openExternalUrl(bybitUrl);
                      setState(() {
                        balance += 0.50;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF10B981),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      elevation: 5,
                    ),
                    child: const Text(
                      'احصل على الفيزا الآن',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white.withOpacity(0.08)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'الانضمام لمجموعة التيليجرام',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      '\$0.10',
                      style: TextStyle(
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'انضم لمجموعتنا الرسمية لمتابعة كل جديد وتحديثات التطبيق.',
                  style: TextStyle(fontSize: 12, color: Colors.white60),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      await openExternalUrl(telegramUrl);
                      setState(() {
                        balance += 0.10;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0088cc),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      elevation: 5,
                    ),
                    child: const Text(
                      'انضم للمجموعة الآن',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
