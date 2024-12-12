import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class AddProductPageScreen extends StatelessWidget {
  const AddProductPageScreen({super.key});

  Future<void> _checkCameraPermission(BuildContext context) async {
    final permission = Permission.camera;

    if (await permission.isDenied) {
      await permission.request();
    } else if (await permission.isPermanentlyDenied) {
      await openAppSettings();
    } else if (await permission.isGranted) {
      await _scanBarcode(context);
    }
  }

  Future<void> _scanBarcode(BuildContext context) async {
    try {
      var result = await BarcodeScanner.scan();
      if (result.rawContent.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Código escaneado: ${result.rawContent}')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nenhum código escaneado')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao escanear código')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.backgroundApp,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adicionar produto',
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => _checkCameraPermission(context),
              child: Container(
                height: 150,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: ColorsTheme.textGrey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'Clique aqui para escanear o código de barras',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}