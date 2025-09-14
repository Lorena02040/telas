import 'package:flutter/material.dart';
import 'package:voyagebus/screens/my_tickets_screen.dart';
import 'package:voyagebus/screens/ticket_detail_screen.dart';
import 'package:voyagebus/screens/my_luggage_screen.dart';
import 'package:voyagebus/screens/luggage_view_screen.dart';
import 'package:voyagebus/screens/qr_screen.dart';

void main() {
  runApp(VoyagebusApp());
}

class VoyagebusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voyagebus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyTicketsScreen(),
        '/ticketDetail': (context) => TicketDetailScreen(),
        '/myLuggage': (context) => MyLuggageScreen(),
        '/luggageView': (context) => LuggageViewScreen(),
        '/qrCode': (context) => QrScreen(),
      },
    );
  }
}