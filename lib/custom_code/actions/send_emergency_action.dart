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
) async {
  // --- CONFIGURAÇÃO ---
  const String phoneNumber = "180"; // Polícia (Prioridade 1)
  // Número da ONG/Ajuda (Fallback) - Atualizado com o seu número
  const String whatsappNumber = "5561983090025";
  // --------------------

  final LatLng? userLocation = FFAppState().userLocation;
  final Uri phoneUri = Uri.parse("tel:$phoneNumber");

  // TENTATIVA 1: LIGAÇÃO (Modo Forçado)
  // Tentamos abrir o discador direto.
  try {
    // O await aqui é importante para garantir que o sistema processou o pedido
    bool conseguiuLigar = await launchUrl(phoneUri);

    // Se o sistema retornou 'true', o discador abriu. Encerramos a função.
    if (conseguiuLigar) {
      return;
    }
  } catch (e) {
    // Se der erro técnico (ex: rodando em PC), o código continua para o WhatsApp
    print('Erro ao tentar ligar: $e');
  }

  // --- TENTATIVA 2: WHATSAPP (FALLBACK) ---
  // Só chega aqui se a ligação falhou ou foi bloqueada pelo navegador

  final StringBuffer message = StringBuffer();
  message.writeln("Olá, gostaria de confirmar o pedido da Pizza. Pedido 180");
  message.writeln("Para o endereço abaixo:");
  message.writeln("-----------------------------------");
  message.writeln("Endereço: $endereco");
  message.writeln("Ref: $referencia");

  if (userLocation != null) {
    message.writeln("Link para entrega:");
    // Link do Maps para a polícia localizar rápido
    message.writeln(
        "http://googleusercontent.com/maps.google.com/maps?q=${userLocation.latitude},${userLocation.longitude}");
  }

  final String encodedMessage = Uri.encodeComponent(message.toString());
  final Uri whatsappUri =
      Uri.parse("https://wa.me/$whatsappNumber?text=$encodedMessage");

  // Tenta abrir o WhatsApp
  try {
    await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
  } catch (e) {
    print('Erro ao abrir WhatsApp: $e');
  }
}
