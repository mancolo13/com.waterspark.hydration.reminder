import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab4Screen extends StatefulWidget {
  const Tab4Screen({super.key});

  @override
  State<Tab4Screen> createState() => _Tab4ScreenState();
}

class _Tab4ScreenState extends State<Tab4Screen> {
  int _counter = 60;
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WaterSpark • History', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: AppTheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.stars_rounded, color: AppTheme.primary),
            onPressed: () => RoutingService.openPartnerLink(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.primary.withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'History Dashboard',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textPrimary),
                      ),
                      Icon(Icons.show_chart, color: AppTheme.primary, size: 28),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '$_counter',
                    style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: AppTheme.primary),
                  ),
                  Text('Active Units / Metrics', style: TextStyle(color: AppTheme.textSecondary, fontSize: 13)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => setState(() => _counter += 5),
                        icon: const Icon(Icons.add),
                        label: const Text('Increase'),
                        style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, foregroundColor: Colors.black),
                      ),
                      const SizedBox(width: 12),
                      OutlinedButton.icon(
                        onPressed: () => setState(() => _active = !_active),
                        icon: Icon(_active ? Icons.pause : Icons.play_arrow),
                        label: Text(_active ? 'Pause' : 'Start'),
                        style: OutlinedButton.styleFrom(foregroundColor: AppTheme.primary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: AppTheme.surface,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: AppTheme.primary,
                  child: Icon(Icons.card_giftcard, color: Colors.black),
                ),
                title: const Text('Special Partner Rewards', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                subtitle: const Text('Tap to view available bonus offers in external browser', style: TextStyle(fontSize: 12)),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppTheme.primary),
                onTap: () => RoutingService.openPartnerLink(),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Activity & Performance', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 12),
                  for (int i = 1; i <= 3; i++) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Session record #$i', style: const TextStyle(color: AppTheme.textSecondary)),
                        Text('+${i * 12 + t_idx * 4} pts', style: const TextStyle(color: AppTheme.secondary, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const Divider(height: 16, color: Colors.white12),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
