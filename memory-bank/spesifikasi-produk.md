# Dokumen Kebutuhan Produk (PRD): Aplikasi Point of Sale (POS) Berbasis Web

## 1. Tinjauan Produk

**Visi Produk:** Menyediakan sistem Point of Sale berbasis web yang efisien, mudah digunakan, dan dapat diakses secara daring untuk membantu usaha kecil dan menengah mengelola penjualan dan inventaris.

**Target Pengguna:**
- Kasir toko retail
- Pemilik usaha kecil dan menengah (UKM)
- Supervisor atau manajer toko

**Tujuan Bisnis:**
- Meningkatkan efisiensi proses penjualan.
- Mempermudah pengelolaan stok barang.
- Menyediakan laporan penjualan yang akurat untuk pengambilan keputusan.
- Memungkinkan akses data penjualan dan inventaris dari mana saja.

**Metrik Kesuksesan:**
- Jumlah transaksi harian/mingguan/bulanan.
- Tingkat adopsi pengguna (jumlah UKM yang menggunakan).
- Akurasi data stok.
- Waktu rata-rata per transaksi.
- Kepuasan pengguna (melalui survei atau feedback).

## 2. Persona Pengguna

### Persona 1: Rina, Kasir Toko
- **Demografi:** 22 tahun, lulusan SMA, cukup mahir menggunakan komputer dan aplikasi kasir dasar.
- **Tujuan:** Melayani pelanggan dengan cepat dan akurat, mencatat transaksi penjualan, menerima berbagai metode pembayaran.
- **Masalah (Pain Points):** Sistem POS lama lambat dan sering error, sulit mencari produk, proses refund rumit.
- **Perjalanan Pengguna:** Login ke sistem, memindai/mencari produk, menambahkan ke keranjang, memproses pembayaran (tunai, kartu, digital), mencetak struk.

### Persona 2: Pak Budi, Pemilik Kedai Kopi
- **Demografi:** 45 tahun, pemilik UKM, sibuk, butuh akses cepat ke laporan penjualan dan stok.
- **Tujuan:** Memantau kinerja penjualan harian, mengetahui produk terlaris, mengelola stok bahan baku kopi, mengatur harga produk.
- **Masalah (Pain Points):** Sulit melacak stok secara manual, tidak tahu pasti keuntungan harian, repot membuat laporan keuangan.
- **Perjalanan Pengguna:** Login ke sistem (bisa via tablet/laptop), melihat dashboard ringkasan penjualan, mengecek laporan stok, menambahkan produk baru atau mengubah harga, mengelola akun kasir.

### Persona 3: Sarah, Manajer Area Toko Pakaian
- **Demografi:** 35 tahun, mengawasi beberapa cabang toko, perlu membandingkan kinerja antar toko.
- **Tujuan:** Memastikan semua cabang berjalan lancar, memantau target penjualan, mengelola hak akses kasir dan supervisor di masing-masing cabang.
- **Masalah (Pain Points):** Sulit mendapatkan data penjualan terkonsolidasi dari semua cabang, repot mengatur promosi serentak.
- **Perjalanan Pengguna:** Login ke sistem, melihat laporan penjualan agregat dan per cabang, mengatur hak akses pengguna, mungkin mendaftarkan produk baru yang berlaku untuk semua cabang.

## 3. Kebutuhan Fitur

| Fitur | Deskripsi | User Stories | Prioritas | Kriteria Penerimaan | Ketergantungan |
|---|---|---|---|---|---|
| **Manajemen Transaksi** | Memproses penjualan, pembayaran, dan cetak struk. | Sebagai kasir, saya ingin dapat dengan mudah menambahkan produk ke transaksi, memilih metode pembayaran, dan mencetak struk. | Wajib | Transaksi berhasil tercatat, stok berkurang, struk tercetak/digital terkirim. | Manajemen Produk |
| **Manajemen Produk & Inventaris** | Mengelola daftar produk, kategori, harga, dan jumlah stok. | Sebagai pemilik, saya ingin dapat menambahkan produk baru, mengubah harga, dan melihat sisa stok secara real-time. | Wajib | Produk dapat ditambah/diubah/dihapus, stok terupdate otomatis setelah transaksi. | - |
| **Laporan Penjualan** | Menampilkan laporan penjualan harian, mingguan, bulanan, dan produk terlaris. | Sebagai pemilik, saya ingin dapat melihat laporan penjualan untuk menganalisis kinerja bisnis. | Wajib | Laporan dapat di-filter berdasarkan periode dan menampilkan data yang akurat. | Manajemen Transaksi |
| **Manajemen Pengguna & Hak Akses** | Mengelola akun pengguna (kasir, admin, supervisor) dan hak aksesnya. | Sebagai admin, saya ingin dapat membuat akun untuk kasir baru dan mengatur apa saja yang bisa mereka akses. | Wajib | Pengguna hanya bisa mengakses fitur sesuai perannya. | - |
| **Pencarian Produk** | Memungkinkan pencarian produk berdasarkan nama, kode, atau kategori. | Sebagai kasir, saya ingin cepat menemukan produk yang dicari pelanggan. | Wajib | Hasil pencarian relevan dan cepat ditampilkan. | Manajemen Produk |
| **Pembayaran Multi-Metode** | Mendukung berbagai metode pembayaran (tunai, kartu kredit/debit, e-wallet). | Sebagai kasir, saya ingin bisa menerima pembayaran dari pelanggan dengan berbagai cara. | Sebaiknya | Sistem mencatat metode pembayaran dengan benar. | - |
| **Manajemen Pelanggan (Dasar)** | Menyimpan data pelanggan untuk program loyalitas atau riwayat pembelian. | Sebagai pemilik, saya ingin bisa melihat riwayat pembelian pelanggan tertentu. | Bagus Jika Ada | Data pelanggan dapat disimpan dan diakses. | - |
| **Cetak Struk & E-Receipt** | Mencetak struk fisik atau mengirim struk digital ke email/nomor pelanggan. | Sebagai kasir, saya ingin memberikan bukti pembelian kepada pelanggan. | Wajib | Struk berisi informasi transaksi yang lengkap. | - |
| **Diskon & Promosi** | Kemampuan untuk menerapkan diskon per item atau total belanja. | Sebagai pemilik, saya ingin bisa membuat program promosi untuk meningkatkan penjualan. | Sebaiknya | Diskon terhitung dengan benar dalam transaksi. | Manajemen Transaksi |

## 4. Alur Pengguna (User Flows)

### Alur 1: Proses Transaksi Penjualan (Kasir)
1. Kasir login ke sistem.
2. Kasir memindai barcode produk atau mencari produk berdasarkan nama/kode.
3. Produk ditambahkan ke keranjang belanja. Kasir dapat mengubah jumlah item.
4. Ulangi langkah 2-3 untuk produk lain.
5. Kasir klik "Bayar".
6. Sistem menampilkan total belanja. Kasir memilih metode pembayaran (Tunai, Kartu, E-wallet).
    - Jika Tunai: Masukkan jumlah uang diterima, sistem hitung kembalian.
    - Jika Kartu/E-wallet: Proses pembayaran melalui integrasi (jika ada) atau catat manual.
7. Transaksi selesai. Sistem menawarkan opsi cetak struk atau kirim e-receipt.
8. Stok produk otomatis berkurang.
    - **Alur alternatif:** Pembatalan item, pembatalan transaksi.
    - **Kondisi error:** Produk tidak ditemukan, stok habis, mesin pembayaran offline.

### Alur 2: Pengelolaan Produk (Admin/Pemilik)
1. Admin/Pemilik login ke sistem.
2. Masuk ke menu "Manajemen Produk".
3. Untuk menambah produk: Klik "Tambah Produk Baru", isi form (nama, kode, kategori, harga beli, harga jual, satuan, stok awal). Simpan.
4. Untuk mengubah produk: Cari produk, klik "Edit", ubah informasi yang diperlukan. Simpan.
5. Untuk melihat stok: Daftar produk menampilkan jumlah stok terkini. Ada fitur filter/sortir.
    - **Kondisi error:** Data tidak valid saat input, gagal menyimpan ke database.

### Alur 3: Melihat Laporan Penjualan (Admin/Pemilik/Supervisor)
1. Pengguna (sesuai hak akses) login ke sistem.
2. Masuk ke menu "Laporan".
3. Pilih jenis laporan (harian, mingguan, bulanan, per produk, dll.).
4. Atur filter periode tanggal jika perlu.
5. Sistem menampilkan laporan dalam bentuk tabel dan grafik.
    - **Kondisi error:** Data tidak tersedia untuk periode yang dipilih.

## 5. Kebutuhan Non-Fungsional

### Performa
- **Waktu Muat Halaman Utama Kasir:** < 3 detik.
- **Pengguna Bersamaan:** Awalnya minimal 10 kasir aktif bersamaan per toko.
- **Waktu Respons API Transaksi:** < 500ms untuk proses inti.

### Keamanan
- **Otentikasi:** Login menggunakan username & password, password di-hash. Menggunakan JWT untuk sesi API.
- **Otorisasi:** Peran pengguna (Admin, Supervisor, Kasir) membatasi akses ke fitur tertentu.
- **Perlindungan Data:** Data transaksi dan pelanggan disimpan dengan aman. Pertimbangkan enkripsi untuk data sensitif jika diperlukan.

### Kompatibilitas
- **Perangkat:** Optimal untuk Tablet (misal iPad, Android Tablet > 10 inch) dan Desktop. Responsif untuk layar lebih kecil jika memungkinkan.
- **Browser:** Chrome, Firefox, Safari, Edge versi terbaru.
- **Ukuran Layar:** Prioritas untuk resolusi 1024x768 ke atas.

### Aksesibilitas
- **Tingkat Kepatuhan:** WCAG 2.1 Level A sebagai dasar, berusaha ke AA untuk elemen kunci.
- **Kebutuhan Spesifik:** Kontras warna yang cukup, navigasi keyboard dasar.

## 6. Spesifikasi Teknis (Gambaran Umum)

### Frontend
- **Tumpukan Teknologi (Tech Stack):** React
- **Sistem Desain:** Akan ditentukan (misal: Material UI, Ant Design, atau custom)

### Backend
- **Tumpukan Teknologi (Tech Stack):** Python (FastAPI direkomendasikan untuk kecepatan dan kemudahan, Django atau Flask juga opsi)
- **Kebutuhan API:** RESTful API
- **Database:** PostgreSQL atau MySQL

### Infrastruktur
- **Hosting:** VPS atau layanan Cloud (AWS, GCP, DigitalOcean)
- **Skalabilitas:** Desain modular untuk kemudahan skala di masa depan.
- **CI/CD:** Akan disiapkan (misal: GitHub Actions, Jenkins).

## 7. Rencana Rilis

### MVP (v1.0)
- **Fitur:**
    - Manajemen Transaksi (penjualan dasar, pembayaran tunai/catat manual non-tunai, cetak struk dasar)
    - Manajemen Produk & Inventaris (CRUD produk, update stok manual & otomatis dari transaksi)
    - Laporan Penjualan Harian Sederhana
    - Manajemen Pengguna (Admin & Kasir)
    - Login & Otentikasi
- **Target Waktu:** [Akan ditentukan kemudian]
- **Kriteria Sukses MVP:** Sistem dapat digunakan untuk mencatat penjualan dan mengelola produk dasar di satu toko kecil.

### Rilis Berikutnya
- **v1.1:** Laporan penjualan lebih detail, pembayaran multi-metode terintegrasi, manajemen diskon dasar.
- **v1.2:** Manajemen pelanggan dasar, e-receipt.
- **v2.0:** Dukungan multi-toko, fitur supervisor, dashboard analitik yang lebih canggih.

## 8. Pertanyaan Terbuka & Asumsi

- **Pertanyaan 1:** Detail integrasi dengan payment gateway pihak ketiga?
- **Pertanyaan 2:** Perlu fitur offline mode untuk kasir jika koneksi internet terputus? (Scope MVP: Online dulu)
- **Asumsi 1:** Pengguna memiliki koneksi internet yang stabil untuk versi awal.
- **Asumsi 2:** Struk dicetak menggunakan printer thermal standar yang terhubung ke perangkat kasir.

## 9. Lampiran

### Wawasan dari Percakapan dengan AI
- **Percakapan 1:** [Akan diisi jika ada diskusi signifikan dengan AI selama pembuatan PRD ini]
- **Edge Case dari AI:** [Akan diisi jika AI mengidentifikasi skenario tak terduga]
- **Saran Perbaikan dari AI:** [Akan diisi jika AI memberikan saran perbaikan]

### Glosarium
- **POS:** Point of Sale
- **CRUD:** Create, Read, Update, Delete
- **JWT:** JSON Web Token
- **MVP:** Minimum Viable Product
