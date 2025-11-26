// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports manuais necessários para abrir URL
import 'package:url_launcher/url_launcher.dart';

Future sendEmergencyAction(
  String nome,
  String endereco,
  String referencia,
  String telefone,
  String acao, // <--- TEM QUE TER ISSO AQUI
) async {
  // --- CONFIGURAÇÃO ---
  const String phoneNumber = "180";
  const String whatsappNumber = "5561983090025";
  // --------------------

  final LatLng? userLocation = FFAppState().userLocation;

  // LÓGICA DA LIGAÇÃO
  if (acao == 'ligar') {
    final Uri phoneUri = Uri.parse("tel:$phoneNumber");
    try {
      await launchUrl(phoneUri);
    } catch (e) {
      print('Erro ao tentar ligar: $e');
    }
    return;
  }

  // LÓGICA DO WHATSAPP
  if (acao == 'whatsapp') {
    final StringBuffer message = StringBuffer();

    message.writeln("Olá, gostaria de confirmar o pedido da Pizza. Pedido 180");
    message.writeln("Para o endereço abaixo:");
    message.writeln("-----------------------------------");
    message.writeln("Endereço: $endereco");
    message.writeln("Ref: $referencia");

    if (userLocation != null) {
      message.writeln("Link para entrega:");
      message.writeln(
          "http://googleusercontent.com/maps.google.com/maps?q=${userLocation.latitude},${userLocation.longitude}");
    }

    final String encodedMessage = Uri.encodeComponent(message.toString());
    final Uri whatsappUri =
        Uri.parse("https://wa.me/$whatsappNumber?text=$encodedMessage");

    try {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } catch (e) {
      print('Erro ao abrir WhatsApp: $e');
    }
  }
}
