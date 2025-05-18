import 'package:flutter/material.dart';

class QRPayPage extends StatelessWidget {
  const QRPayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Pay'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.qr_code, size: 200, color: Colors.blue),
            ),
            SizedBox(height: 20),
            Text(
              'Scan QR Code di atas untuk pembayaran',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Logic untuk menyimpan QR
                  },
                  icon: Icon(Icons.download),
                  label: Text('Simpan QR'),
                ),
                SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Logic untuk scan QR
                  },
                  icon: Icon(Icons.camera_alt),
                  label: Text('Scan QR'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
