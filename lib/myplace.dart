import 'package:flutter/material.dart';

class LakePage extends StatelessWidget {
  const LakePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Địa điểm'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _imageSection(),
            const SizedBox(height: 16),
            _titleSection(),
            const SizedBox(height: 12),
            _actionSection(context),
            const SizedBox(height: 12),
            _descriptionSection(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _imageSection() {
    // fixed URL (unsplash) and added errorBuilder + rounded corners
    const src =
        "https://images.unsplash.com/photo-1439066290691-510066268af5?q=80&w=1200&auto=format&fit=crop&ixlib=rb-4.1.0";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            src,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey.shade200,
                child: const Center(
                  child: Icon(Icons.broken_image, size: 56, color: Colors.grey),
                ),
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                color: Colors.grey.shade100,
                child: const Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _titleSection() {
    const namePlace = "Hồ Zurich";
    const addressPlace = "Thụy Sĩ";
    const votePlace = "41";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                namePlace,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 4),
              Text(addressPlace, style: TextStyle(color: Colors.grey)),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.star, color: Colors.red),
              ),
              const SizedBox(width: 8),
              const Text(
                votePlace,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionSection(BuildContext context) {
    const color = Colors.blue;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _actionItem(icon: Icons.call, label: 'Call', color: color, onTap: () {}),
          _actionItem(icon: Icons.route, label: 'Route', color: color, onTap: () {}),
          _actionItem(icon: Icons.share, label: 'Share', color: color, onTap: () {}),
        ],
      ),
    );
  }

  Widget _actionItem({required IconData icon, required String label, required Color color, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(label, style: TextStyle(color: color)),
        ],
      ),
    );
  }

  Widget _descriptionSection() {
    const data =
        'Hồ Zurich nằm ở độ cao 406m, với diện tích rộng lớn, dài 40km và rộng 3km. Ở độ sâu tối đa, nó đạt đến 143 m. Nước của hồ rất sạch, dòng chảy đến từ những ngọn núi Thụy Sĩ và được sử dụng để cung cấp nước cho các thành phố xung quanh, lớn nhất trong số đó là Zurich với khoảng 360.000 cư dân.';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        data,
        style: const TextStyle(fontSize: 15, height: 1.5),
        textAlign: TextAlign.justify,
      ),
    );
  }
}