// lib/features/appointments/presentation/pages/book_appointment_screen.dart
import 'package:flutter/material.dart';
import 'package:ui_demo_proj/core/common_widgets/primary_button.dart';
import 'package:ui_demo_proj/features/appointments/data/appointment_type.dart';

import 'widgets/appointment_type_selector.dart';
import 'widgets/time_slot_grid.dart';
import 'widgets/upload_box.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  AppointmentType selectedType = AppointmentType.physical;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text("Book Appointment", 
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (selectedType == AppointmentType.video)
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  "*Video appointments- patient must upload payment screenshot*",
                  style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            
            const Text("Appointment Type", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            AppointmentTypeSelector(
              selectedType: selectedType,
              onChanged: (type) => setState(() => selectedType = type),
            ),
            
            const SizedBox(height: 24),
            const Text("Select Date", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildDatePicker(),
            
            const SizedBox(height: 24),
            const Center(child: Text("Available Time", style: TextStyle(fontWeight: FontWeight.bold))),
            const SizedBox(height: 12),
            const TimeSlotGrid(),
            
            const SizedBox(height: 24),
            const Text("Describe your Symptoms", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildSymptomsField(),
            
            const SizedBox(height: 24),
            const Text("Upload Medical Documents", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const UploadBox(label: "Tap to Upload image or PDF"),
            
            if (selectedType == AppointmentType.video) ...[
              const SizedBox(height: 24),
              const Text("Upload Payment Screenshot", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              const UploadBox(label: "Tap to Upload Your Payment Screenshot"),
            ],
            
            const SizedBox(height: 32),
            PrimaryButton(
              label: "Submit Appointment Request", 
              onPressed: () {},
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "dd/mm/yyyy",
          border: InputBorder.none,
          suffixIcon: Icon(Icons.calendar_month_outlined),
        ),
      ),
    );
  }

  Widget _buildSymptomsField() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade100, style: BorderStyle.solid),
      ),
      child: const TextField(
        maxLines: 4,
        decoration: InputDecoration(
          hintText: "Please describe your symptoms in detail...",
          hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}