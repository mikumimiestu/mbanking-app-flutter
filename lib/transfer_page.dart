import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  String? _selectedBank;
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  bool _isTransferEnabled = false;

  final List<Map<String, dynamic>> _banks = [
    {'name': 'BCA', 'code': '014', 'logo': 'assets/bca.png'},
    {'name': 'Mandiri', 'code': '008', 'logo': 'assets/mandiri.png'},
    {'name': 'BNI', 'code': '009', 'logo': 'assets/bni.png'},
    {'name': 'BRI', 'code': '002', 'logo': 'assets/bri.png'},
    {'name': 'CIMB Niaga', 'code': '022', 'logo': 'assets/cimb.png'},
    {'name': 'Danamon', 'code': '011', 'logo': 'assets/danamon.png'},
    {'name': 'Permata', 'code': '013', 'logo': 'assets/permata.png'},
    {'name': 'Maybank', 'code': '025', 'logo': 'assets/maybank.png'},
    {'name': 'OCBC NISP', 'code': '021', 'logo': 'assets/ocbc.png'},
    {'name': 'BTPN', 'code': '009', 'logo': 'assets/btpn.png'},
    {'name': 'BSI', 'code': '012', 'logo': 'assets/bsi.png'},
    {'name': 'Citi', 'code': '015', 'logo': 'assets/citi.png'},
    {'name': 'DBS', 'code': '016', 'logo': 'assets/dbs.png'},
    {'name': 'HSBC', 'code': '017', 'logo': 'assets/hsbc.png'},
  ];

  final List<Map<String, dynamic>> _quickActions = [
    {
      'icon': Icons.account_balance,
      'label': 'Bank Lain',
      'color': Colors.indigo[300],
    },
    {
      'icon': Icons.phone_android,
      'label': 'Dom. Digital',
      'color': Colors.green,
    },
    {'icon': Icons.account_circle, 'label': 'Kontak', 'color': Colors.orange},
    {'icon': Icons.qr_code, 'label': 'QRIS', 'color': Colors.purple},
    {'icon': Icons.history, 'label': 'Riwayat', 'color': Colors.red},
  ];

  @override
  void initState() {
    super.initState();
    _accountController.addListener(_validateForm);
    _amountController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _accountController.dispose();
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _isTransferEnabled =
          _accountController.text.isNotEmpty &&
          _amountController.text.isNotEmpty &&
          _selectedBank != null;
    });
  }

  void _showBankSelection() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pilih Bank Tujuan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari bank...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _banks.length,
                  itemBuilder: (context, index) {
                    final bank = _banks[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image.asset(bank['logo']),
                      ),
                      title: Text(bank['name']),
                      subtitle: Text(bank['code']),
                      trailing:
                          _selectedBank == bank['name']
                              ? const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                              : null,
                      onTap: () {
                        setState(() {
                          _selectedBank = bank['name'];
                          _validateForm();
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Transfer',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.history),
          //   // navigasi ke history_page.dart
          //   onPressed: () {
          //     Navigator.push(
          //       // navigasi ke history_page.dart
          //       context,
          //       MaterialPageRoute(builder: (context) => HistoryPage()),
          //     );
          //     // Navigate to transfer history
          //   },
          // ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance card with recent transactions
            // Container(
            //   padding: const EdgeInsets.all(16),
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: [Colors.indigo[300].shade700, Colors.indigo[300].shade500],
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //     ),
            //     borderRadius: BorderRadius.circular(16),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.indigo[300].withOpacity(0.2),
            //         blurRadius: 10,
            //         offset: const Offset(0, 5),
            //       ),
            //     ],
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         'Saldo Tersedia',
            //         style: TextStyle(
            //           color: Colors.white.withOpacity(0.9),
            //           fontSize: 14,
            //         ),
            //       ),
            //       const SizedBox(height: 8),
            //       Text(
            //         'Rp 12.450.000',
            //         style: const TextStyle(
            //           color: Colors.white,
            //           fontSize: 28,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       const SizedBox(height: 16),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           _buildTransactionChip('Terakhir', 'BRI - Rp 500.000'),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 24),

            // Transfer form
            Text(
              'Transfer ke',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 12),

            // Bank selection
            InkWell(
              onTap: _showBankSelection,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.account_balance, color: Colors.indigo),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        _selectedBank ?? 'Pilih Bank Tujuan',
                        style: TextStyle(
                          color:
                              _selectedBank != null
                                  ? Colors.black
                                  : Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Account number field
            TextField(
              controller: _accountController,
              decoration: InputDecoration(
                labelText: 'Nomor Rekening/Nomor HP',
                labelStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: const Icon(Icons.credit_card, color: Colors.indigo),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.contacts, color: Colors.indigo),
                  onPressed: () {
                    // Open contacts
                  },
                ),
              ),
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            // Amount field
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Jumlah Transfer',
                labelStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: const Icon(Icons.money, color: Colors.indigo),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                suffixText: 'IDR',
                suffixStyle: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Set nominal tertentu
                  _amountController.text = '100000';
                  _validateForm();
                },
                child: Text(
                  'Min Rp 10.000',
                  style: TextStyle(color: Colors.indigo[300]),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Note field
            TextField(
              controller: _noteController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Catatan (Opsional)',
                labelStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 48),
                  child: const Icon(Icons.note, color: Colors.indigo),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
              ),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            // Transfer button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed:
                    _isTransferEnabled
                        ? () {
                          // Transfer logic
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Transfer berhasil diproses'),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                        : null,
                child: const Text(
                  'TRANSFER SEKARANG',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _isTransferEnabled ? Colors.white : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            // Quick transfer section
            const SizedBox(height: 32),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       'Transfer Cepat ke',
            //       style: TextStyle(
            //         fontSize: 16,
            //         fontWeight: FontWeight.w600,
            //         color: Colors.grey[800],
            //       ),
            //     ),
            //     TextButton(
            //       onPressed: () {
            //         // View all quick options
            //       },
            //       child: Text(
            //         'Lihat Semua',
            //         style: TextStyle(color: Colors.indigo[300]),
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 16),
            // SizedBox(
            //   height: 100,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: _quickActions.length,
            //     itemBuilder: (context, index) {
            //       final action = _quickActions[index];
            //       return Padding(
            //         padding: const EdgeInsets.only(right: 16),
            //         child: _buildQuickTransferOption(
            //           action['icon'],
            //           action['label'],
            //           action['color'],
            //         ),
            //       );
            //     },
            //   ),
            // ),

            // Recent recipients
            const SizedBox(height: 24),
            Text(
              'Penerima Terakhir',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 12),
            _buildRecentRecipient('John Doe', 'BCA - 1234567890'),
            _buildRecentRecipient('Jane Smith', 'Mandiri - 0987654321'),
            _buildRecentRecipient('PT ABC Corp', 'BRI - 5678901234'),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionChip(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickTransferOption(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildRecentRecipient(String name, String account) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.indigo,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(name),
        subtitle: Text(account),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: Colors.white,
        onTap: () {
          // Auto-fill recipient details
          setState(() {
            _selectedBank = account.split(' - ')[0];
            _accountController.text = account.split(' - ')[1];
            _validateForm();
          });
        },
      ),
    );
  }
}
