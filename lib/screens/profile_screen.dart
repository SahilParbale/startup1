import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _soundEnabled = true;

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
            _buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    _buildProfileCard(),
                    const SizedBox(height: 28),
                    _buildSectionLabel('Account settings'),
                    const SizedBox(height: 12),
                    _buildSettingsGroup([
                      _SettingItem(icon: Icons.person_outline, label: 'Personal Information', type: SettingType.arrow),
                      _SettingItem(icon: Icons.list_alt_outlined, label: 'Remainder', type: SettingType.arrow),
                      _SettingItem(icon: Icons.volume_down_outlined, label: 'Sound', type: SettingType.toggle),
                    ]),
                    const SizedBox(height: 28),
                    _buildSectionLabel('Preferences'),
                    const SizedBox(height: 12),
                    _buildSettingsGroup([
                      _SettingItem(icon: Icons.person_outline, label: 'Experience level', type: SettingType.arrow),
                      _SettingItem(icon: Icons.warning_amber_outlined, label: 'Caution areas', type: SettingType.arrow),
                    ]),
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

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text(
            'Profile',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 16),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.edit_outlined, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Avatar
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.brown.shade200,
                  border: Border.all(color: Colors.white.withOpacity(0.2), width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    color: const Color(0xFF5C8A85),
                    child: const Icon(Icons.person, size: 44, color: Colors.white54),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Jacob Donald',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, color: Colors.white54, size: 14),
                      const SizedBox(width: 2),
                      Text(
                        'London, United Kingdom',
                        style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Stats row
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                _buildProfileStat('Age', '27 y.o'),
                _buildDivider(),
                _buildProfileStat('Height', '170 cm'),
                _buildDivider(),
                _buildProfileStat('Weight', '52 kg'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStat(String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(label, style: const TextStyle(color: Colors.white54, fontSize: 12)),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 30,
      color: Colors.white.withOpacity(0.15),
    );
  }

  Widget _buildSectionLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildSettingsGroup(List<_SettingItem> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Column(
        children: List.generate(items.length, (i) {
          final item = items[i];
          final bool isLast = i == items.length - 1;
          return Column(
            children: [
              _buildSettingRow(item),
              if (!isLast)
                Divider(
                  color: Colors.white.withOpacity(0.08),
                  height: 1,
                  indent: 54,
                  endIndent: 16,
                ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildSettingRow(_SettingItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(item.icon, color: Colors.white70, size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              item.label,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          if (item.type == SettingType.arrow)
            const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white54, size: 15)
          else
            Switch(
              value: _soundEnabled,
              onChanged: (val) => setState(() => _soundEnabled = val),
              activeColor: Colors.white,
              activeTrackColor: const Color(0xFF1E3330),
              inactiveThumbColor: Colors.white60,
              inactiveTrackColor: Colors.white24,
              thumbIcon: WidgetStateProperty.resolveWith<Icon?>((states) {
                if (states.contains(WidgetState.selected)) {
                  return const Icon(Icons.check, color: Color(0xFF1E3330), size: 12);
                }
                return null;
              }),
            ),
        ],
      ),
    );
  }
}

enum SettingType { arrow, toggle }

class _SettingItem {
  final IconData icon;
  final String label;
  final SettingType type;

  const _SettingItem({
    required this.icon,
    required this.label,
    required this.type,
  });
}
