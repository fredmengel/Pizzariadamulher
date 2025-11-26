import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String? buildAlertMessage(
  double? latitude,
  double? longitude,
) {
  // Data/hora atual formatada para ficar mais legível (Opcional)
  final now = DateTime.now().toString();

  // Texto base do pedido de ajuda
  const baseText = 'PRECISO DE AJUDA. SITUAÇÃO DE PERIGO.';

  final buffer = StringBuffer()
    ..writeln(baseText)
    ..writeln('Data/Hora: $now');

  // Verifica se as coordenadas foram passadas e não são zero
  if (latitude != null &&
      longitude != null &&
      latitude != 0 &&
      longitude != 0) {
    buffer.writeln(
      'Localização aproximada: '
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude',
    );
  } else {
    buffer.writeln('Localização não disponível no momento.');
  }

  return buffer.toString();
}
