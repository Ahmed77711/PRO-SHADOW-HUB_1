import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          tutorial.title, 
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 1. الكارت العلوي (التدرج اللوني)
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: tutorial.gradient),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Text(
                  tutorial.flag, 
                  style: const TextStyle(fontSize: 60),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // 2. قائمة الخطوات
            ...tutorial.steps.map((s) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.06),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.white54, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      s, 
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
            )),
            
            const SizedBox(height: 20),
            
            // 3. زر فتح اليوتيوب
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _openYoutube(context),
                icon: const Icon(Icons.play_circle_fill, color: Colors.white),
                label: const Text(
                  'فتح الشرح على يوتيوب', 
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF0000), // لون يوتيوب
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}