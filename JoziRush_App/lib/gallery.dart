import 'package:flutter/material.dart';



// =================== GALLERY PAGE ===================
class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  final List<String> _images = const [
    'https://images.pexels.com/photos/1403653/pexels-photo-1403653.jpeg',
    'https://images.pexels.com/photos/69903/pexels-photo-69903.jpeg',
    'https://images.pexels.com/photos/9789494/pexels-photo-9789494.jpeg',
    'https://images.pexels.com/photos/169677/pexels-photo-169677.jpeg',
    'https://images.pexels.com/photos/32632143/pexels-photo-32632143.jpeg',
    'https://images.pexels.com/photos/1190297/pexels-photo-1190297.jpeg',
    'https://images.pexels.com/photos/868110/pexels-photo-868110.jpeg',
    'https://images.pexels.com/photos/1293265/pexels-photo-1293265.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: const ValueKey('GalleryPage'),
      padding: const EdgeInsets.all(16),
      itemCount: _images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            _images[index],
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) =>
            const Center(child: Icon(Icons.broken_image, size: 50)),
          ),
        );
      },
    );
  }
}
