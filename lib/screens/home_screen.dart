import 'package:flutter/material.dart';
import 'profile.dart';

class HomeScreen extends StatelessWidget {
  final Function(int, {bool openLogModal})? onNavigateToTab;

  const HomeScreen({
    Key? key,
    this.onNavigateToTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Профіль користувача
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue.shade50,
                          border: Border.all(color: Colors.blue.shade100, width: 1.5),
                        ),
                        child: const Icon(Icons.person, color: Colors.grey, size: 30),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Good evening,',
                              style: TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                            Text(
                              'Anastasiia',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.chevron_right, color: Colors.grey.shade400),
                    ],
                  ),
                ),
              ),

              const Divider(height: 1),

              // 2. Блок статистики
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1565C0),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatItem('47', 'Total Games'),
                      Container(height: 30, width: 1, color: Colors.white24),
                      _buildStatItem('19', 'Victories'),
                      Container(height: 30, width: 1, color: Colors.white24),
                      _buildStatItem('40%', 'Win Rate'),
                    ],
                  ),
                ),
              ),

              // 3. Recent Sessions та "See all"
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recent Sessions',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        if (onNavigateToTab != null) {
                          onNavigateToTab!(2); // Перехід на вкладку Sessions
                        }
                      },
                      child: const Text(
                        'See all',
                        style: TextStyle(
                          color: Color(0xFF1565C0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 4. Останні партії
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildSessionCard(
                      context,
                      title: 'Catan',
                      details: 'Sep 17 · 4p',
                      winner: 'Alex M.',
                      players: const ['Alex M.', 'Jamie K.', 'Sam R.', 'Riley P.'],
                      duration: '95',
                    ),
                    _buildSessionCard(
                      context,
                      title: 'Ticket to Ride',
                      details: 'Sep 14 · 3p',
                      winner: 'Jamie K.',
                      players: const ['Jamie K.', 'Sam R.', 'Casey L.'],
                      duration: '65',
                    ),
                    _buildSessionCard(
                      context,
                      title: 'Pandemic',
                      details: 'Sep 10 · 2p',
                      winner: 'Sam R.',
                      players: const ['Alex M.', 'Riley P.'],
                      duration: '80',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // 5. Кнопка "+": перекидає на сторінку Sessions і одразу відкриває вікно Log Session
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (onNavigateToTab != null) {
            onNavigateToTab!(2, openLogModal: true);
          }
        },
        backgroundColor: const Color(0xFF1565C0),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 11),
        ),
      ],
    );
  }

  Widget _buildSessionCard(
      BuildContext context, {
        required String title,
        required String details,
        required String winner,
        required List<String> players,
        required String duration,
      }) {
    return GestureDetector(
      onTap: () {
        if (onNavigateToTab != null) {
          onNavigateToTab!(2);
        }
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 12, bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: const Center(
                child: Icon(Icons.casino, size: 40, color: Color(0xFF1565C0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(details, style: TextStyle(color: Colors.grey.shade500, fontSize: 11)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.emoji_events, size: 14, color: Colors.orange),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          winner,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.orange,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}