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
  final List<String> allAvailablePlayers = [
    'Alex M.',
    'Jamie K.',
    'Sam R.',
    'Riley P.',
    'Casey L.',
    'Cordf D.',
    'Dam R.',
    'Jordan T.',
    'Taylor S.',
  ];

  @override
  void initState() {
    super.initState();
    if (widget.autoOpenLogModal) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showLogSessionBottomSheet(
          context,
          isEdit: false,
          title: null,
          duration: '',
          winner: null,
          initialPlayers: [],
        );
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
                      title: null,
                      duration: '',
                      winner: null,
                      initialPlayers: [],
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
                  initialPlayers: players,
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

  void _showLogSessionBottomSheet(
      BuildContext context, {
        required bool isEdit,
        required String? title,
        required String duration,
        required String? winner,
        required List<String> initialPlayers,
      }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return _SessionFormModal(
          isEdit: isEdit,
          initialTitle: title,
          initialDuration: duration,
          initialWinner: winner,
          initialPlayers: initialPlayers,
          allAvailablePlayers: allAvailablePlayers,
        );
      },
    );
  }

  void _showDeleteDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteConfirmationDialog(
          title: 'Delete Session?',
          itemName: title,
          onDelete: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }
}

class _SessionFormModal extends StatefulWidget {
  final bool isEdit;
  final String? initialTitle;
  final String initialDuration;
  final String? initialWinner;
  final List<String> initialPlayers;
  final List<String> allAvailablePlayers;

  const _SessionFormModal({
    Key? key,
    required this.isEdit,
    required this.initialTitle,
    required this.initialDuration,
    required this.initialWinner,
    required this.initialPlayers,
    required this.allAvailablePlayers,
  }) : super(key: key);

  @override
  State<_SessionFormModal> createState() => _SessionFormModalState();
}

class _SessionFormModalState extends State<_SessionFormModal> {
  late String? selectedTitle;
  late String? selectedWinner;
  late List<String> selectedPlayers;

  bool isPickerOpen = false;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    selectedTitle = widget.initialTitle;
    selectedWinner = widget.initialWinner;
    selectedPlayers = List.from(widget.initialPlayers);
  }

  @override
  Widget build(BuildContext context) {
    final filteredPlayers = widget.allAvailablePlayers.where((player) {
      return player.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

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
                  widget.isEdit ? 'Edit Session' : 'Log Session',
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
              value: selectedTitle,
              hint: Text(
                'Select game',
                style: TextStyle(fontSize: 13, color: Colors.grey.shade400),
              ),
              icon: Icon(Icons.arrow_drop_down, color: Colors.grey.shade400),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              items: const [
                DropdownMenuItem(value: 'Catan', child: Text('Catan', style: TextStyle(fontSize: 13))),
                DropdownMenuItem(value: 'Ticket to Ride', child: Text('Ticket to Ride', style: TextStyle(fontSize: 13))),
                DropdownMenuItem(value: 'Azul', child: Text('Azul', style: TextStyle(fontSize: 13))),
                DropdownMenuItem(value: 'Pandemic', child: Text('Pandemic', style: TextStyle(fontSize: 13))),
              ],
              onChanged: (val) {
                setState(() => selectedTitle = val);
              },
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
                          hintText: 'e.g. Sep 17, 2026',
                          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
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
                        initialValue: widget.initialDuration.isEmpty ? null : widget.initialDuration,
                        decoration: InputDecoration(
                          hintText: '60',
                          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
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

            // ЕЛЕГАНТНА СЕКЦІЯ ГРАВЦІВ В ОДИНОМУ ТОНІ МАКЕТУ
            const Text('Players', style: TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ...selectedPlayers.map((p) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3F2FD),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        p,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF1565C0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPlayers.remove(p);
                            if (selectedWinner == p) selectedWinner = null;
                          });
                        },
                        child: const Icon(
                          Icons.close,
                          size: 14,
                          color: Color(0xFF1565C0),
                        ),
                      ),
                    ],
                  ),
                )),

                // Стильна кнопка "+" / "-"
                InkWell(
                  onTap: () {
                    setState(() {
                      isPickerOpen = !isPickerOpen;
                    });
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: isPickerOpen ? const Color(0xFF1565C0) : Colors.blue.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isPickerOpen ? Icons.close : Icons.add,
                      color: isPickerOpen ? Colors.white : const Color(0xFF1565C0),
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),

            // ПРЕМІУМ ПАНЕЛЬ ПОШУКУ (Біле тло, точна рамка, без брудних сірих відтінків)
            if (isPickerOpen) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFF1565C0).withOpacity(0.3), width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.shade900.withOpacity(0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      onChanged: (val) {
                        setState(() {
                          searchQuery = val;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search player...',
                        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                        prefixIcon: Icon(Icons.search, size: 18, color: Colors.blue.shade700),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        fillColor: const Color(0xFFF8FAFC),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 130),
                      child: SingleChildScrollView(
                        child: Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: filteredPlayers.map((player) {
                            final isSelected = selectedPlayers.contains(player);
                            return ChoiceChip(
                              label: Text(player),
                              selected: isSelected,
                              onSelected: (bool checked) {
                                setState(() {
                                  if (checked) {
                                    selectedPlayers.add(player);
                                  } else {
                                    selectedPlayers.remove(player);
                                    if (selectedWinner == player) selectedWinner = null;
                                  }
                                });
                              },
                              selectedColor: const Color(0xFF1565C0),
                              backgroundColor: Colors.white,
                              labelStyle: TextStyle(
                                fontSize: 12,
                                color: isSelected ? Colors.white : Colors.grey.shade800,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                  color: isSelected ? const Color(0xFF1565C0) : Colors.grey.shade300,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

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
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text('Winner', style: TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              value: selectedPlayers.contains(selectedWinner) ? selectedWinner : null,
              hint: Text(
                '— Select winner —',
                style: TextStyle(fontSize: 13, color: Colors.grey.shade400),
              ),
              icon: Icon(Icons.arrow_drop_down, color: Colors.grey.shade400),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              items: selectedPlayers
                  .map((p) => DropdownMenuItem(value: p, child: Text(p, style: const TextStyle(fontSize: 13))))
                  .toList(),
              onChanged: (val) {
                setState(() => selectedWinner = val);
              },
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
                  widget.isEdit ? 'Save Changes' : 'Log Session',
                  style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}