import 'package:flutter/material.dart';
import 'package:socia_live/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://wjzjtfwuhlppvtjbqdih.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Indqemp0Znd1aGxwcHZ0amJxZGloIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI2Mzc4NTIsImV4cCI6MjA0ODIxMzg1Mn0.UBLc-CPvK3Isz1eK2V_Baknn-P4zUVQvL7xyDnCkWVU',
  );
  runApp(const SociaLive());
}
