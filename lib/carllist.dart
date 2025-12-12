import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Khoá học của tôi')),
      body: _cardListBody(),
    );
  }

  // body tách riêng
  Widget _cardListBody() {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        block1(),
        block2(),
        block3(),
        block4(),
        block5(),
      ],
    );
  }

  // ===== Các block nhỏ – mỗi block là 1 thẻ =====
  Widget block1() {
    return CourseCard(
      title: 'XML và ứng dụng - Nhóm 1',
      code: '2025-2026.1.TIN4583.001',
      students: 58,
      banner:
          'https://images.unsplash.com/photo-1516387938699-a93567ec168e?w=1200&q=80',
    );
  }

  Widget block2() {
    return CourseCard(
      title: 'Lập trình ứng dụng cho các t...',
      code: '2025-2026.1.TIN4403.006',
      students: 55,
      banner:
          'https://images.unsplash.com/photo-1519681393784-d120267933ba?w=1200&q=80',
    );
  }

  Widget block3() {
    return CourseCard(
      title: 'Lập trình ứng dụng cho các t...',
      code: '2025-2026.1.TIN4403.005',
      students: 52,
      banner:
          'https://images.unsplash.com/photo-1518779578993-ec3579fee39f?w=1200&q=80',
    );
  }

  Widget block4() {
    return CourseCard(
      title: 'Lập trình ứng dụng cho các t...',
      code: '2025-2026.1.TIN4403.004',
      students: 50,
      banner:
          'https://images.unsplash.com/photo-1521587760476-6c12a4b040da?w=1200&q=80',
    );
  }

  Widget block5() {
    return CourseCard(
      title: 'Lập trình ứng dụng cho các t...',
      code: '2025-2026.1.TIN4403.003',
      students: 52,
      banner:
          'https://images.unsplash.com/photo-1513258496099-48168024aec0?w=1200&q=80',
    );
  }
}

// ===== Widget thẻ khoá học đơn giản =====
class CourseCard extends StatelessWidget {
  final String title;
  final String code;
  final int students;
  final String banner;

  const CourseCard({
    super.key,
    required this.title,
    required this.code,
    required this.students,
    required this.banner,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: NetworkImage(banner), fit: BoxFit.cover),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // làm tối nền để chữ dễ đọc
            Container(color: Colors.black.withOpacity(0.35)),
            Padding(
              padding: const EdgeInsets.all(16),child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Icon(Icons.more_vert, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(code, style: const TextStyle(color: Colors.white70)),
                  const Spacer(),
                  Text('$students học viên',
                      style: const TextStyle(color: Colors.white70)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}