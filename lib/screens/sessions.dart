import 'package:flutter/material.dart';
import '../core/widgets/delete_confirmation_dialog.dart';
class SessionsScreen extends StatefulWidget {
  final bool autoOpenLogModal;

  const SessionsScreen({
    Key? key,
    this.autoOpenLogModal = false,
  }) : super(key: key);

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.autoOpenLogModal) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showLogSessionBottomSheet(context, isEdit: false, title: 'Catan', duration: '60', winner: 'Select', players: ['Alex M.', 'Jamie K.', 'Sam R.', 'Riley P.']);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Заголовок та кнопка + Log
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sessions',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => _showLogSessionBottomSheet(
                      context,
                      isEdit: false,
                      title: 'Catan',
                      duration: '60',
                      winner: 'Select',
                      players: ['Alex M.', 'Jamie K.', 'Sam R.', 'Riley P.'],
                    ),
                    icon: const Icon(Icons.add, size: 18, color: Colors.white),
                    label: const Text('Log', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1565C0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                  ),
                ],
              ),
            ),

            // Блоки статистики
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3F2FD).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: const [
                          Text(
                            '3',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1565C0),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('Total', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3F2FD).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: const [
                          Text(
                            '3',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1565C0),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('This Month', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Logged Sessions',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Список сесій
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildSessionCard(
                    title: 'Ticket to Ride',
                    dateDuration: 'Sep 14, 2026 · 65m',
                    players: const ['Casey L.', 'Jamie K.', 'Sam R.', 'Cordf D.', 'Dam R.'],
                    winner: 'Jamie K.',
                    duration: '65',
                  ),
                  _buildSessionCard(
                    title: 'Catan',
                    dateDuration: 'Sep 17, 2026 · 95m',
                    players: const ['Alex M.', 'Jamie K.', 'Sam R.', 'Riley P.'],
                    winner: 'Alex M.',
                    duration: '95',
                  ),
                  _buildSessionCard(
                    title: 'Azul',
                    dateDuration: 'Sep 5, 2026 · 50m',
                    players: const ['Alex M.', 'Riley P.'],
                    winner: 'Alex M.',
                    duration: '50',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Внутрішній метод побудови картки сесії
  Widget _buildSessionCard({
    required String title,
    required String dateDuration,
    required List<String> players,
    required String winner,
    required String duration,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.emoji_events_outlined, color: Color(0xFF1565C0), size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.calendar_today_outlined, size: 12, color: Colors.grey.shade400),
                    const SizedBox(width: 4),
                    Text(dateDuration, style: TextStyle(color: Colors.grey.shade500, fontSize: 11)),
                  ],
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: players
                      .map((p) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(p, style: TextStyle(fontSize: 10, color: Colors.grey.shade700)),
                  ))
                      .toList(),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 11),
                    children: [
                      TextSpan(text: 'Winner: ', style: TextStyle(color: Colors.grey.shade500)),
                      TextSpan(text: winner, style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              InkWell(
                onTap: () => _showLogSessionBottomSheet(
                  context,
                  isEdit: true,
                  title: title,
                  duration: duration,
                  winner: winner,
                  players: players,
                ),
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3F2FD),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(Icons.edit_outlined, color: Color(0xFF1565C0), size: 16),
                ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () => _showDeleteDialog(context, title),
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEBEE),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(Icons.delete_outline, color: Colors.red, size: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Модальне вікно створення/редагування сесії
  void _showLogSessionBottomSheet(
      BuildContext context, {
        required bool isEdit,
        required String title,
        required String duration,
        required String winner,
        required List<String> players,
      }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isEdit ? 'Edit Session' : 'Log Session',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close, size: 20, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Game', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 6),
                DropdownButtonFormField<String>(
                  value: title,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  items: [
                    DropdownMenuItem(value: title, child: Text(title, style: const TextStyle(fontSize: 13))),
                    if (title != 'Catan') const DropdownMenuItem(value: 'Catan', child: Text('Catan', style: TextStyle(fontSize: 13))),
                    if (title != 'Ticket to Ride') const DropdownMenuItem(value: 'Ticket to Ride', child: Text('Ticket to Ride', style: TextStyle(fontSize: 13))),
                  ],
                  onChanged: (val) {},
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Date', style: TextStyle(fontSize: 12, color: Colors.grey)),
                          const SizedBox(height: 6),
                          TextFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Duration (min)', style: TextStyle(fontSize: 12, color: Colors.grey)),
                          const SizedBox(height: 6),
                          TextFormField(
                            initialValue: duration,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text('Players', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ...players.map((p) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3F2FD),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blue.shade300),
                      ),
                      child: Text(p, style: const TextStyle(fontSize: 12, color: Color(0xFF1565C0))),
                    )),
                    const Icon(Icons.add_circle_outline, color: Color(0xFF1565C0), size: 28),
                  ],
                ),
                const SizedBox(height: 12),
                const Text('Scores', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 6),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'e.g. Alex:12, Jamie:9..',
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text('Winner', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 6),
                DropdownButtonFormField<String>(
                  value: players.contains(winner) ? winner : 'Select',
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  items: [
                    const DropdownMenuItem(
                      value: 'Select',
                      child: Text('— Select winner —', style: TextStyle(fontSize: 13, color: Colors.grey)),
                    ),
                    ...players.map((p) => DropdownMenuItem(value: p, child: Text(p, style: const TextStyle(fontSize: 13)))),
                  ],
                  onChanged: (val) {},
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1565C0),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      isEdit ? 'Save Changes' : 'Log Session',
                      style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Діалог видалення
  void _showDeleteDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(color: Color(0xFFFFEBEE), shape: BoxShape.circle),
                  child: const Icon(Icons.delete_outline, color: Color(0xFFE53935), size: 28),
                ),
                const SizedBox(height: 16),
                const Text('Delete Session?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                    children: [
                      const TextSpan(text: 'Are you sure you want to delete '),
                      TextSpan(text: '"$title"', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
                      const TextSpan(text: '?\nThis action cannot be undone.'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          side: BorderSide(color: Colors.blue.shade200),
                        ),
                        child: const Text('Cancel', style: TextStyle(color: Color(0xFF1565C0), fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE53935),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          elevation: 0,
                        ),
                        child: const Text('Delete', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}