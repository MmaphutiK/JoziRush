import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Colors.deepPurple.shade700;
    final Color accentColor = Colors.deepPurpleAccent;

    return Scaffold(
      appBar: AppBar(
        title: const Text('About JoziRush'),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            aboutCard(
              title: 'My Story',
              content:
                  'Hi, I’m Mmaphuti Kgomo, a passionate software developer dedicated to creating innovative and user-friendly applications. '
                  'My journey into development started with curiosity and has grown into a full-fledged career where I love solving real-world problems with code.',
              primaryColor: primaryColor,
              accentColor: accentColor,
            ),
            const SizedBox(height: 20),
            aboutCard(
              title: 'The Idea',
              content:
                  'JoziRush was born from the desire to showcase Johannesburg\'s rich culture, events, and hidden gems in a way that is accessible and engaging for both locals and tourists. '
                  'The app combines curated tours, restaurant guides, events, and exclusive deals all in one place.',
              primaryColor: primaryColor,
              accentColor: accentColor,
            ),
            const SizedBox(height: 20),
            aboutCard(
              title: 'Vision & Mission',
              content:
                  'Our vision is to become the leading digital companion for discovering Johannesburg, enriching visitor experiences and supporting local businesses.\n\n'
                  'Our mission is to provide a seamless, interactive, and visually appealing platform that connects people with what Johannesburg truly has to offer.',
              primaryColor: primaryColor,
              accentColor: accentColor,
            ),
            const SizedBox(height: 20),
            aboutCard(
              title: 'What We\'re Trying to Achieve',
              content:
                  'We aim to empower tourists and locals alike to explore the city confidently and conveniently, discovering new places, events, and special offers. '
                  'By partnering with local businesses, we provide exclusive deals and promote economic growth within the community.',
              primaryColor: primaryColor,
              accentColor: accentColor,
            ),
            const SizedBox(height: 20),
            aboutCard(
              title: 'How It Solves a Problem',
              content:
                  'Johannesburg has an abundance of attractions and events, but information is often scattered across many sources. This fragmentation makes it difficult for visitors to plan and enjoy their trips fully.\n\n'
                  'JoziRush centralizes all essential information in one app, offering curated tours, event updates, restaurant guides, and easy navigation. '
                  'This simplifies trip planning, saves time, and enhances the overall experience.',
              primaryColor: primaryColor,
              accentColor: accentColor,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget aboutCard({
    required String title,
    required String content,
    required Color primaryColor,
    required Color accentColor,
  }) {
    return Card(
      elevation: 5,
      shadowColor: primaryColor.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Big heading with underline accent
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              height: 4,
              width: 60,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
