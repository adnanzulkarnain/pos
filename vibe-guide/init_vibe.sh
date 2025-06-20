#!/bin/bash

# Skrip Inisialisasi & Reset Vibe Coding V1.4

# Direktori utama proyek (asumsi skrip dijalankan dari root atau vibe-guide)
if [ -d "./vibe-guide" ]; then
  PROJECT_ROOT="."
elif [ -d "../vibe-guide" ]; then
  PROJECT_ROOT=".."
else
  echo "Error: Tidak dapat menemukan folder vibe-guide/. Jalankan skrip ini dari root proyek atau dari dalam vibe-guide/"
  exit 1
fi

# Folder inti
VIBE_GUIDE_DIR="$PROJECT_ROOT/vibe-guide"
MEMORY_BANK_DIR="$PROJECT_ROOT/memory-bank"
ARCHIVE_DIR="$PROJECT_ROOT/baby-steps-archive"
SRC_DIR="$PROJECT_ROOT/src" # src tidak diinisialisasi ulang oleh skrip ini

# File inti
TEAM_MANIFEST="$VIBE_GUIDE_DIR/team-manifest.md"
TEMPLATE_PAPAN="$VIBE_GUIDE_DIR/template-papan.md"

SPESIFIKASI_PRODUK="$MEMORY_BANK_DIR/spesifikasi-produk.md"
PAPAN_PROYEK="$MEMORY_BANK_DIR/papan-proyek.md"
ARSITEKTUR_DOC="$MEMORY_BANK_DIR/architecture.md"
PROGRESS_LOG="$MEMORY_BANK_DIR/progress.md"

# --- Fungsi ---

# Fungsi untuk membuat folder jika belum ada
ensure_dir() {
  if [ ! -d "$1" ]; then
    mkdir -p "$1"
    echo "Dibuat: Folder $1"
  fi
}

# Fungsi untuk membuat file dari template jika belum ada atau jika ada argumen --force-template
ensure_file_from_template() {
  local target_file="$1"
  local template_file="$2"
  local force_create="$3" # "--force-template" atau ""

  if [ ! -f "$template_file" ]; then
    echo "Peringatan: File template $template_file tidak ditemukan."
    # Buat file kosong jika template tidak ada, agar tidak error
    if [ ! -f "$target_file" ] || [ "$force_create" == "--force-template" ]; then
        touch "$target_file"
        echo "Dibuat: File kosong $target_file (template tidak ditemukan)"
    fi
    return
  fi

  if [ ! -f "$target_file" ] || [ "$force_create" == "--force-template" ]; then
    cp "$template_file" "$target_file"
    echo "Dibuat/Diperbarui: $target_file dari $template_file"
  fi
}

# Fungsi untuk membuat file kosong jika belum ada
ensure_empty_file() {
  if [ ! -f "$1" ]; then
    touch "$1"
    echo "Dibuat: File kosong $1"
  fi
}

# --- Logika Utama ---

echo "Memulai Vibe Coding Environment Setup..."

# 1. Buat struktur folder dasar
ensure_dir "$VIBE_GUIDE_DIR"
ensure_dir "$MEMORY_BANK_DIR"
ensure_dir "$ARCHIVE_DIR"
ensure_dir "$SRC_DIR" # Pastikan src ada, tapi jangan diapa-apain isinya

# 2. Inisialisasi file-file di vibe-guide/ (jika belum ada)
# team-manifest.md dan template-papan.md biasanya dibuat manual atau dari repo Vibe Coding
ensure_empty_file "$TEAM_MANIFEST" # Harusnya sudah ada, tapi pastikan
ensure_empty_file "$TEMPLATE_PAPAN" # Harusnya sudah ada

# 3. Inisialisasi file-file di memory-bank/
# spesifikasi-produk.md dan architecture.md dibuat sekali di awal proyek
ensure_empty_file "$SPESIFIKASI_PRODUK"
ensure_empty_file "$ARSITEKTUR_DOC"

# progress.md di-append, jadi cukup pastikan ada
ensure_empty_file "$PROGRESS_LOG"


# --- Logika Reset Papan Proyek (jika ada argumen --reset) ---
if [[ " $@" == *" --reset "* ]]; then
  echo ""
  echo "Memulai proses reset Papan Proyek..."

  if [ ! -f "$PAPAN_PROYEK" ]; then
    echo "Peringatan: $PAPAN_PROYEK tidak ditemukan. Membuat papan baru dari template."
    ensure_file_from_template "$PAPAN_PROYEK" "$TEMPLATE_PAPAN" "--force-template"
  else
    TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
    ARCHIVE_FILE="$ARCHIVE_DIR/papan-proyek-arsip-$TIMESTAMP.md"

    # Salin papan proyek ke arsip
    cp "$PAPAN_PROYEK" "$ARCHIVE_FILE"
    echo "Diarsipkan: $PAPAN_PROYEK ke $ARCHIVE_FILE"

    # Catat ke progress.md
    echo "" >> "$PROGRESS_LOG"
    echo "---" >> "$PROGRESS_LOG"
    echo "**Siklus Selesai & Papan Direset pada $(date +"%Y-%m-%d %H:%M:%S")**" >> "$PROGRESS_LOG"
    echo "Papan proyek sebelumnya diarsipkan ke: $ARCHIVE_FILE" >> "$PROGRESS_LOG"
    echo "---" >> "$PROGRESS_LOG"

    # Buat papan proyek baru dari template
    if [ -f "$TEMPLATE_PAPAN" ]; then
      cp "$TEMPLATE_PAPAN" "$PAPAN_PROYEK"
      echo "Dibuat Ulang: $PAPAN_PROYEK dari $TEMPLATE_PAPAN"
      # Tambahkan info siklus baru ke papan yang baru dibuat
      echo "" >> "$PAPAN_PROYEK"
      echo "## Siklus Baru (Setelah Reset pada $(date +"%Y-%m-%d %H:%M:%S"))" >> "$PAPAN_PROYEK"
      echo "" >> "$PAPAN_PROYEK"
      echo "| ID | Deskripsi Tugas | Kriteria Tes | Assignee | Status | Catatan |" >> "$PAPAN_PROYEK"
      echo "|----|-----------------|----------------|----------|--------|---------|" >> "$PAPAN_PROYEK"
      echo "| T1 | Tugas Baru...   |                |          | To Do  |         |" >> "$PAPAN_PROYEK"

    else
      echo "Peringatan: $TEMPLATE_PAPAN tidak ditemukan. $PAPAN_PROYEK tidak direset dari template."
      # Hapus konten papan lama jika template tidak ada, atau biarkan? Untuk sekarang, kita kosongkan.
      # > "$PAPAN_PROYEK" # Baris ini akan mengosongkan file, mungkin terlalu drastis
      # echo "Peringatan: $PAPAN_PROYEK dikosongkan karena template tidak ada."
      # Alternatif: Biarkan papan lama jika template tidak ada, hanya arsipkan.
       echo "Peringatan: $PAPAN_PROYEK hanya diarsipkan karena template tidak ada. Tidak ada papan baru yang dibuat."
    fi
  fi
  echo "Proses reset Papan Proyek selesai."
fi

echo ""
echo "Setup Vibe Coding Environment selesai."
echo "Pastikan file-file berikut ada dan sudah/siap diisi:"
echo "- $TEAM_MANIFEST (Daftar tim)"
echo "- $TEMPLATE_PAPAN (Template untuk papan proyek baru)"
echo "- $SPESIFIKASI_PRODUK (PRD)"
echo "- $ARSITEKTUR_DOC (Dokumen Arsitektur)"
echo "- $PAPAN_PROYEK (Papan Proyek saat ini)"
echo "- $PROGRESS_LOG (Catatan progres)"

# Ingatkan untuk memberikan izin eksekusi
if [ ! -x "$VIBE_GUIDE_DIR/init_vibe.sh" ]; then
    echo ""
    echo "PENTING: Jangan lupa memberikan izin eksekusi pada skrip ini:"
    echo "chmod +x $VIBE_GUIDE_DIR/init_vibe.sh"
fi
```
