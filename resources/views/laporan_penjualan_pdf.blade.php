<!DOCTYPE html>
<html>
<head>
    <title>Laporan Penjualan</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 5px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Laporan Penjualan</h2>
    <p>Periode: {{ $startDate }} s/d {{ $endDate }}</p>
    
    <table>
        <thead>
            <tr>
                <th>No</th>
                <th>Faktur</th>
                <th>Tanggal</th>
                <th>Pelanggan</th>
                <th>Total Bayar</th>
            </tr>
        </thead>
        <tbody>
            @foreach($laporan as $index => $item)
            <tr>
                <td>{{ $index + 1 }}</td>
                <td>{{ $item->faktur_2110003 }}</td>
                <td>{{ date('d/m/Y', strtotime($item->tanggal_2110003)) }}</td>
                <td>{{ $item->namapelanggan_2110003 }}</td>
                <td align="right">Rp {{ number_format($item->totalbayar_2110003, 0, ',', '.') }}</td>
            </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <td colspan="4" align="right"><strong>Total:</strong></td>
                <td align="right"><strong>Rp {{ number_format($laporan->sum('totalbayar_2110003'), 0, ',', '.') }}</strong></td>
            </tr>
        </tfoot>
    </table>
</body>
</html>