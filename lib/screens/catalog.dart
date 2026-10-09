import 'package:flutter/material.dart';
import '../core/widgets/delete_confirmation_dialog.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  int selectedCategoryIndex = 0;
  final List<String> categories = ['All', 'Strategy', 'Family', 'Cooperative', 'Abstract'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Заголовок та кнопка + Add
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Game Catalog',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => _showAddGameBottomSheet(context),
                    icon: const Icon(Icons.add, size: 18, color: Colors.white),
                    label: const Text('Add', style: TextStyle(color: Colors.white)),
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

            // Поле пошуку
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search games...',
                  hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  prefixIcon: Icon(Icons.tune, color: Colors.grey.shade400, size: 20),
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
            const SizedBox(height: 12),

            // Горизонтальний список категорій
            SizedBox(
              height: 36,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedCategoryIndex == index;
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(categories[index]),
                      selected: isSelected,
                      onSelected: (bool selected) {
                        setState(() => selectedCategoryIndex = index);
                      },
                      selectedColor: const Color(0xFFE3F2FD),
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: isSelected ? const Color(0xFF1565C0) : Colors.grey.shade600,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: isSelected ? const Color(0xFF1565C0) : Colors.grey.shade300,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // Сітка картки ігор (2x2)
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(16),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.85,
                children: [
                  _buildGameCard('Catan', 'Strategy', '3–4p · ~90m', minP: '3', maxP: '4', duration: '90'),
                  _buildGameCard('Ticket to Ride', 'Family', '2–5p · ~60m', minP: '2', maxP: '5', duration: '60'),
                  _buildGameCard('Pandemic', 'Cooperative', '2–4p · ~75m', minP: '2', maxP: '4', duration: '75'),
                  _buildGameCard('Azul', 'Abstract', '2–4p · ~45m', minP: '2', maxP: '4', duration: '45'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Побудова картки гри
  Widget _buildGameCard(
      String title,
      String genre,
      String info, {
        required String minP,
        required String maxP,
        required String duration,
      }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: const Center(
                  child: Icon(Icons.extension_outlined, size: 36, color: Color(0xFF1565C0)),
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: PopupMenuButton<String>(
                  icon: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.more_vert, size: 16, color: Colors.grey),
                  ),
                  onSelected: (value) {
                    if (value == 'edit') {
                      _showGameFormBottomSheet(
                        context,
                        isEdit: true,
                        title: title,
                        minP: minP,
                        maxP: maxP,
                        duration: duration,
                        genre: genre,
                      );
                    } else if (value == 'delete') {
                      _showDeleteDialog(context, title: title);
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'edit',
                      child: Row(
                        children: const [
                          Icon(Icons.edit_outlined, size: 18, color: Colors.black87),
                          SizedBox(width: 8),
                          Text('Edit', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'delete',
                      child: Row(
                        children: const [
                          Icon(Icons.delete_outline, size: 18, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Delete', style: TextStyle(fontSize: 14, color: Colors.red)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3F2FD),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    genre,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF1565C0),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  info,
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Викликається при натисканні на "+ Add"
  void _showAddGameBottomSheet(BuildContext context) {
    _showGameFormBottomSheet(
      context,
      isEdit: false,
      title: '',
      minP: '2',
      maxP: '4',
      duration: '60',
      genre: 'Strategy',
    );
  }

  // Універсальна нижня шторка для створення/редагування гри
  void _showGameFormBottomSheet(
      BuildContext context, {
        required bool isEdit,
        required String title,
        required String minP,
        required String maxP,
        required String duration,
        required String genre,
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isEdit ? 'Edit Game' : 'Add New Game',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, size: 20, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Title', style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 6),
              _buildModalTextField(title),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Min Players', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        const SizedBox(height: 6),
                        _buildModalTextField(minP),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Max Players', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        const SizedBox(height: 6),
                        _buildModalTextField(maxP),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Duration (min)', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        const SizedBox(height: 6),
                        _buildModalTextField(duration),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Genre', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        const SizedBox(height: 6),
                        DropdownButtonFormField<String>(
                          value: genre,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                          items: const [
                            DropdownMenuItem(value: 'Strategy', child: Text('Strategy', style: TextStyle(fontSize: 13))),
                            DropdownMenuItem(value: 'Family', child: Text('Family', style: TextStyle(fontSize: 13))),
                            DropdownMenuItem(value: 'Cooperative', child: Text('Cooperative', style: TextStyle(fontSize: 13))),
                            DropdownMenuItem(value: 'Abstract', child: Text('Abstract', style: TextStyle(fontSize: 13))),
                          ],
                          onChanged: (val) {},
                        ),
                      ],
                    ),
                  ),
                ],
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
                    isEdit ? 'Save Changes' : 'Add to Catalog',
                    style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Діалог видалення гри
  void _showDeleteDialog(BuildContext context, {required String title}) {
    showDialog(
      context: context,
      builder: (context) => DeleteConfirmationDialog(
        title: 'Delete Game?',
        itemName: title,
        onDelete: () {},
      ),
    );
  }

  Widget _buildModalTextField(String initialValue) {
    return TextFormField(
      initialValue: initialValue,
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
    );
  }
}