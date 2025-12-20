// lib/features/appointments/presentation/widgets/appointment_card.dart
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String date;
  final String time;
  final String type; // Physical or Video
  final String status; // Confirmed, Pending, Completed
  final bool isUpcoming;

  const AppointmentCard({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.date,
    required this.time,
    required this.type,
    required this.status,
    required this.isUpcoming,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/home/dr_joynal.png', height: 50, width: 50, fit: BoxFit.cover),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(doctorName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(specialty, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
              _buildStatusBadge(),
            ],
          ),
          const SizedBox(height: 12),
          // Detail Strip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F5FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _iconDetail(Icons.calendar_month, date),
                _iconDetail(Icons.access_time, time),
                _iconDetail(type == "Video" ? Icons.videocam : Icons.business, type),
              ],
            ),
          ),
          if (isUpcoming) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF2F2F2),
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text("Reschedule", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD32F2F),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text("Cancel", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            )
          ]
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    Color color;
    if (status == "Confirmed") {
      color = Colors.green;
    } else if (status == "Pending") {color = Colors.orange;}
    else {color = Colors.green;} // Completed color

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status,
        style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _iconDetail(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.black87),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 11, color: Colors.black87)),
      ],
    );
  }
}