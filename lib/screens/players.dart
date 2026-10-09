import 'package:flutter/material.dart';

class PlayersScreen extends StatefulWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  bool isByWinsSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Заголовок
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Players',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Поле пошуку
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search players...',
                  hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade400, size: 20),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  // Блок Top Player
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1565C0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white24,
                          child: Icon(Icons.person, color: Colors.white, size: 32),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Top Player',
                                style: TextStyle(color: Colors.white70, fontSize: 11),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Anastasiia',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                '19 wins · 47 games',
                                style: TextStyle(color: Colors.white70, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text(
                              '40%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Win Rate',
                              style: TextStyle(color: Colors.white70, fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Кнопки фільтрації (By Wins / By Played)
                  Row(
                    children: [
                      _buildFilterChip('By Wins', isByWinsSelected, () {
                        setState(() => isByWinsSelected = true);
                      }),
                      const SizedBox(width: 8),
                      _buildFilterChip('By Played', !isByWinsSelected, () {
                        setState(() => isByWinsSelected = false);
                      }),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Рейтинговий список гравців
                  _buildPlayerRow('1', 'Alex Morgan', '19w  47g', '40%', 0.40),
                  _buildPlayerRow('2', 'Jamie Kim', '12w  31g', '39%', 0.39),
                  _buildPlayerRow('3', 'Sam Rivera', '9w  28g', '32%', 0.32),
                  _buildPlayerRow('4', 'Riley Park', '7w  22g', '32%', 0.32),
                  _buildPlayerRow('5', 'Jordan Taylor', '5w  18g', '28%', 0.28),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE3F2FD) : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF1565C0) : Colors.transparent,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? const Color(0xFF1565C0) : Colors.grey.shade600,
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerRow(
      String rank,
      String name,
      String stats,
      String winRateText,
      double progress,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            child: Text(
              rank,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFFE0E0E0),
            child: Icon(Icons.person, color: Colors.grey, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Icon(Icons.emoji_events_outlined, size: 12, color: Colors.grey.shade400),
                    const SizedBox(width: 4),
                    Text(
                      stats,
                      style: TextStyle(color: Colors.grey.shade400, fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                winRateText,
                style: const TextStyle(
                  color: Color(0xFF1565C0),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: 50,
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.blue.shade50,
                  color: const Color(0xFF1565C0),
                  minHeight: 4,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}