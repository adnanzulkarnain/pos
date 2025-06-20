# Papan Proyek: Aplikasi POS - Siklus 1

## Status Proyek
Siklus 0 (Inisialisasi Proyek) telah selesai. Memulai Siklus 1: Pengembangan fitur inti MVP.
Progress terakhir dapat dilihat di `progress.md` (Siklus 0).

## Baby Steps (Siklus 1)

| ID | Deskripsi Tugas | Kriteria Tes | Assignee | Status | Catatan |
|---|---|---|---|---|---|
| T4 | Implementasi Fitur User Login & Otentikasi (Backend) | - API endpoint untuk login (/auth/token) menggunakan username & password tersedia. - Menggunakan JWT untuk manajemen sesi. - Password disimpan dengan aman (hashed). - Endpoint terproteksi memerlukan token JWT yang valid. - Peran dasar (Admin, Kasir) dapat diidentifikasi dari token. | AgentJules | To Do | Fokus pada FastAPI. Sesuai `architecture.md` dan `spesifikasi-produk.md`. |
| T5 | Implementasi Fitur CRUD Produk (Backend) | - API endpoints untuk CREATE, READ, UPDATE, DELETE produk tersedia (/products). - CRUD operations untuk nama produk, deskripsi, harga, SKU, dan stok awal. - Stok produk ter-update setelah operasi terkait. - Validasi data input (misal: harga tidak boleh negatif). | AgentJules | To Do | Fokus pada FastAPI. Sesuai `architecture.md` dan `spesifikasi-produk.md`. |
| T6 | Perencanaan Awal Desain UI/UX untuk Halaman Transaksi Kasir | - Kumpulkan referensi desain POS yang baik. - Buat sketsa wireframe dasar (low-fidelity) untuk alur transaksi utama (tambah produk, bayar, cetak struk). - Identifikasi komponen UI utama yang dibutuhkan. | Budi | To Do | Untuk persiapan implementasi frontend. Lihat Alur 1 di PRD. |

## Diskusi & Keputusan Teknis Siklus Ini
- Pemilihan library UI untuk React (misal: Material UI, Ant Design) perlu dipertimbangkan setelah ada gambaran UI/UX awal.
- Detail skema database untuk produk dan pengguna akan difinalisasi seiring implementasi backend.

## Backlog / Ide Selanjutnya
- Implementasi Fitur Manajemen Transaksi (Backend & Frontend)
- Implementasi Frontend untuk Login & Manajemen Produk
- Desain UI/UX untuk halaman Manajemen Produk
- Implementasi Laporan Penjualan Harian Sederhana (Backend & Frontend)
- Manajemen Pengguna (Admin & Kasir) - Frontend
- Cetak Struk

## Informasi Tambahan
- **Link ke PRD:** `../memory-bank/spesifikasi-produk.md`
- **Link ke Arsitektur:** `../memory-bank/architecture.md`
- **Link ke Team Manifest:** `../vibe-guide/team-manifest.md`
