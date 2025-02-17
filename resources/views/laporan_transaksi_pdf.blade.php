<!DOCTYPE html>
<html>
<head>
    <title>Laporan Transaksi</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .periode {
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            font-size: 12px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f8f9fa;
            font-weight: bold;
            text-align: left;
        }
        .text-right {
            text-align: right;
        }
        .text-center {
            text-align: center;
        }
        .items-list {
            margin: 5px 0;
            padding-left: 15px;
            font-size: 11px;
            color: #666;
        }
        .total-row {
            background-color: #f8f9fa;
            font-weight: bold;
        }
        .pelanggan-info {
            font-size: 11px;
            line-height: 1.4;
        }
    </style>
</head>
<body>
    <div class="header">
        <h2>Laporan Transaksi</h2>
        <p>Periode: {{ \Carbon\Carbon::parse($startDate)->format('d/m/Y') }} s/d {{ \Carbon\Carbon::parse($endDate)->format('d/m/Y') }}</p>
    </div>

    <div class="summary" style="margin-bottom: 20px;">
        <table>
            <tr>
                <td style="border: none; width: 50%;"><strong>Total Transaksi:</strong> {{ $totalTransaksi }} transaksi</td>
                <td style="border: none; width: 50%; text-align: right;"><strong>Total Pendapatan:</strong> Rp {{ number_format($totalPendapatan, 0, ',', '.') }}</td>
            </tr>
        </table>
    </div>

    <table>
        <thead>
            <tr>
                <th class="text-center" style="width: 5%;">No</th>
                <th style="width: 15%;">Faktur</th>
                <th style="width: 12%;">Tanggal</th>
                <th style="width: 38%;">Pelanggan</th>
                <th style="width: 30%;">Detail Layanan</th>
                <th class="text-right" style="width: 15%;">Total</th>
            </tr>
        </thead>
        <tbody>
            @foreach($laporan as $index => $item)
            <tr>
                <td class="text-center">{{ $index + 1 }}</td>
                <td>{{ $item['faktur'] }}</td>
                <td>{{ \Carbon\Carbon::parse($item['tanggal'])->format('d/m/Y') }}</td>
                <td>
                    <div class="pelanggan-info">
                        <strong>{{ $item['pelanggan']['nama'] }}</strong><br>
                        {{ $item['pelanggan']['alamat'] }}<br>
                        Telp: {{ $item['pelanggan']['no_hp'] }}
                    </div>
                </td>
                <td>
                    @foreach($item['items'] as $layanan)
                    <div class="items-list">
                        • {{ $layanan['nama_paket'] }}<br>
                        &nbsp;&nbsp;(Rp {{ number_format($layanan['harga'], 0, ',', '.') }})
                    </div>
                    @endforeach
                </td>
                <td class="text-right">Rp {{ number_format($item['total_bayar'], 0, ',', '.') }}</td>
            </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr class="total-row">
                <td colspan="5" class="text-right"><strong>Total Pendapatan:</strong></td>
                <td class="text-right"><strong>Rp {{ number_format($totalPendapatan, 0, ',', '.') }}</strong></td>
            </tr>
        </tfoot>
    </table>

    <div style="font-size: 11px; color: #666; text-align: center; margin-top: 30px;">
        Dicetak pada: {{ \Carbon\Carbon::now()->format('d/m/Y H:i:s') }}
    </div>
</body>
</html>
