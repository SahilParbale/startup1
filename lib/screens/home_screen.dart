import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF3D5E5A), Color(0xFF1E3330)],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    _buildWelcomeText(),
                    const SizedBox(height: 4),
                    _buildDate(),
                    const SizedBox(height: 20),
                    _buildSearchBar(),
                    const SizedBox(height: 28),
                    _buildSectionHeader('Today\'s stats', 'View more'),
                    const SizedBox(height: 14),
                    _buildStatsRow(),
                    const SizedBox(height: 28),
                    _buildSectionHeader('Today\'s workout', 'View more'),
                    const SizedBox(height: 14),
                    _buildWorkoutCard(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Fitbit-style logo
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.grid_view_rounded, color: Colors.white70, size: 28),
          ),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.bar_chart_outlined, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 10),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.notifications_outlined, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 10),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.brown.shade300,
                child: ClipOval(
                  child: Container(
                    color: Colors.brown.shade200,
                    child: const Icon(Icons.person, color: Colors.white, size: 24),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeText() {
    return RichText(
      text: const TextSpan(
        style: TextStyle(fontSize: 26, color: Colors.white, height: 1.3),
        children: [
          TextSpan(text: 'Welcome, '),
          TextSpan(
            text: 'Alex!',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          TextSpan(text: ' here\'s your\nhealth snapshot for today!'),
        ],
      ),
    );
  }

  Widget _buildDate() {
    return const Text(
      'Today is 01 November 2025',
      style: TextStyle(color: Colors.white60, fontSize: 13),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Row(
        children: [
          SizedBox(width: 14),
          Icon(Icons.search, color: Colors.white54, size: 20),
          SizedBox(width: 10),
          Text('Search...', style: TextStyle(color: Colors.white38, fontSize: 15)),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          action,
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow() {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [
          _buildStatCard(
            title: 'Step to wall',
            value: '5,400 steps',
            badge: 'Good',
            badgeColor: const Color(0xFF2D4A47),
            progress: 0.54,
            progressColor: const Color(0xFFFF8C42),
            icon: Icons.directions_walk_rounded,
          ),
          const SizedBox(width: 12),
          _buildStatCard(
            title: 'Cal burnt',
            value: '312 KCAL',
            badge: 'Average',
            badgeColor: const Color(0xFF2D4A47),
            progress: 0.62,
            progressColor: const Color(0xFFFF5722),
            icon: Icons.local_fire_department_rounded,
          ),
          const SizedBox(width: 12),
          _buildStatCard(
            title: 'Kilo',
            value: '312',
            badge: 'Good',
            badgeColor: const Color(0xFF2D4A47),
            progress: 0.7,
            progressColor: const Color(0xFF4CAF50),
            icon: Icons.monitor_weight_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String badge,
    required Color badgeColor,
    required double progress,
    required Color progressColor,
    required IconData icon,
  }) {
    return Container(
      width: 155,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.13),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white60, fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  badge,
                  style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 38,
                height: 38,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 3.5,
                      backgroundColor: Colors.white24,
                      valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                    ),
                    Icon(icon, color: progressColor, size: 16),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutCard() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.13),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // Background gradient
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: 140,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4A7570), Color(0xFF2D4A47)],
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.person, size: 100, color: Colors.white24),
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Upper body\nstrength',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    '16 exercises',
                    style: TextStyle(color: Colors.white60, fontSize: 13),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      _buildWorkoutTag(Icons.fitness_center_rounded, '350 Cal'),
                      const SizedBox(width: 8),
                      _buildWorkoutTag(Icons.local_fire_department, '350 Cal', color: Colors.orange),
                    ],
                  ),
                ],
              ),
            ),
            // Play button
            Positioned(
              right: 16,
              bottom: 16,
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.play_arrow_rounded, color: Color(0xFF1E3330), size: 26),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutTag(IconData icon, String label, {Color color = Colors.white}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 13, color: color),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
