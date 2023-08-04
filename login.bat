@echo off
color B
mode con: cols=78 lines=18
IF NOT EXIST "c:\uname.txt" goto DAFTAR
IF NOT EXIST "c:\password.txt" goto DAFTAR
goto LOGIN

:DAFTAR
title DAFTAR
cls
echo -------------------------------------------------
echo                     DAFTAR
echo -------------------------------------------------
echo.
set/p "unamesu=Masukkan Username : "
set/p "passsu=Masukkan Password : "
echo.
echo.
IF ["%unamesu%"] == [""] goto DAFTARERROR
IF ["%passsu%"] ==[""] goto DAFTARERROR
goto CREATEACC

:DAFTARERROR
echo -------------------------------------------------
echo                     GAGAL
echo -------------------------------------------------
echo Username atau Password Salah
pause
goto DAFTAR

:CREATEACC
echo %unamesu% >> C:\uname.txt
echo %passsu% >> C:\password.txt
attrib "C:\uname.txt" +s +h
attrib "C:\password.txt" +s +h

goto LOGIN

:LOGIN
set/p uname= < C:\uname.txt
set/p pass=< C:\password.txt
title Login
cls
echo -------------------------------------------------
echo                       Login
echo -------------------------------------------------
echo.
echo.
set/p "unamel=_               Username : "
set/p "passwordl=_               Password : "
echo.
IF "%unamel%"=="" goto LOGINERROR
IF "%passwordl"=="" goto LOGINERROR
IF NOT %unamel%==%uname% goto LOGINERROR
IF NOT %passwordl%==%pass% goto LOGINERROR
goto LOADING

:LOGINERROR
echo -------------------------------------------------
echo                     GAGAL
echo -------------------------------------------------
echo Username atau Password Salah
pause
goto LOGIN


:LOADING
title Loading...
set load=%load%!!!!!!!
cls
echo -------------------------------------------------
echo                       Login
echo -------------------------------------------------
echo.
echo.
echo                 Username : %unamel%
echo                 Password : %passwordl%
echo.
echo.
echo          Logging in...
echo          ===================================
echo          %load%
echo          ===================================
echo.                              Mohon Tunggu...
echo.
ping localhost -n 2 >nul
set/a loadnum=%loadnum% +1
if %loadnum%==5 goto BERHASIL
goto LOADING

:BERHASIL
title BERHASIL
cls
echo -------------------------------------------------
echo                       BERHASIL
echo -------------------------------------------------
echo.
echo               #
echo             #
echo     #     #            Login BERHASIL
echo      #  #
echo       #
echo.
echo.
echo -------------------------------------------------
pause



@echo off
setlocal enabledelayedexpansion

:menu
title MENU UTAMA
cls
echo MENU UTAMA
echo ---------------------------
echo 1. Penilaian Mahasiswa
echo 2. Perhitungan Luas Bangun
echo 3. Perbaikan Komputer
echo 4. Aplikasi
echo 5. Setting
echo 6. Jaringan Komputer
echo 7. Makanan Nusantara
echo 0. Keluar
echo ---------------------------
set /p "choice=Masukkan pilihan (0-7): "

if "%choice%"=="1" (
    call :penilaian_mahasiswa
    goto menu
) else if "%choice%"=="2" (
    call :perhitungan_luas_bangun
    goto menu
) else if "%choice%"=="3" (
    call :perbaikan_komputer
    goto menu
) else if "%choice%"=="4" (
    call :aplikasi
    goto menu
) else if "%choice%"=="5" (
    call :menu_setting
    goto menu
) else if "%choice%"=="6" (
    call :jaringan_komputer
    goto menu
) else if "%choice%"=="7" (
    call :makanan
    goto menu
) else if "%choice%"=="0" (
   echo Terimakasih telah menggunakan batchfile
   timeout 3 >nul
   exit
) else (
    echo Pilihan tidak valid!
    timeout 3 >nul
    goto menu
)
:penilaian_mahasiswa
title PENILAIAN MAHASISWA
cls
REM Meminta pengguna memasukkan data mahasiswa
set /p "nim=Masukkan NIM: "
set /p "nama=Masukkan Nama Mahasiswa: "
set /p "kelas=Masukkan Kelas: "
set /p "prodi=Masukkan Program Studi: "
set /p "nilai_so=Masukkan nilai mata kuliah Sistem Operasi: "
set /p "nilai_mp=Masukkan nilai mata kuliah Manajemen Proyek: "
set /p "nilai_mpnl=Masukkan nilai mata kuliah Metodologi Penelitian: "

REM Inisialisasi variabel grade untuk setiap mata kuliah
set "grade_so="
set "grade_mp="
set "grade_mpnl="

REM Menentukan grade untuk mata kuliah Sistem Operasi
if %nilai_so% geq 95 (
    set "grade_so=A"
) else if %nilai_so% geq 85 (
    set "grade_so=B"
) else if %nilai_so% geq 70 (
    set "grade_so=C"
) else (
    set "grade_so=Tidak Lulus"
)

REM Menentukan grade untuk mata kuliah Manajemen Proyek
if %nilai_mp% geq 95 (
    set "grade_mp=A"
) else if %nilai_mp% geq 85 (
    set "grade_mp=B"
) else if %nilai_mp% geq 70 (
    set "grade_mp=C"
) else (
    set "grade_mp=Tidak Lulus"
)

REM Menentukan grade untuk mata kuliah Metodologi Penelitian
if %nilai_mpnl% geq 95 (
    set "grade_mpnl=A"
) else if %nilai_mpnl% geq 85 (
    set "grade_mpnl=B"
) else if %nilai_mpnl% geq 70 (
    set "grade_mpnl=C"
) else (
    set "grade_mpnl=Tidak Lulus"
)

REM Tulis output ke dalam file txt
echo Hasil Penilaian Mahasiswa > output.txt
echo NIM: %nim% >> output.txt
echo Nama Mahasiswa: %nama% >> output.txt
echo Kelas: %kelas% >> output.txt
echo Program Studi: %prodi% >> output.txt
echo. >> output.txt
echo Penilaian Mata Kuliah: >> output.txt
echo Sistem Operasi: %nilai_so% (Grade: %grade_so%) >> output.txt
echo Manajemen Proyek: %nilai_mp% (Grade: %grade_mp%) >> output.txt
echo Metodologi Penelitian: %nilai_mpnl% (Grade: %grade_mpnl%) >> output.txt

echo Penilaian berhasil disimpan dalam file "output.txt"
timeout 3 >nul
exit /b

:perhitungan_luas_bangun
REM Implementasi menu perhitungan luas bangun

:submenu_perhitungan_luas_bangun
title MENU PERHITUNGAN LUAS BANGUN
cls
echo MENU PERHITUNGAN LUAS BANGUN
echo ---------------------------
echo 1. Luas Segitiga
echo 2. Luas Lingkaran
echo 3. Luas Persegi Panjang
echo 0. Kembali ke Menu Utama
echo ---------------------------
set /p "choice=Masukkan pilihan (0-4): "

if "%choice%"=="1" (
    call :luas_segitiga
    goto submenu_perhitungan_luas_bangun
) else if "%choice%"=="2" (
    call :luas_lingkaran
    goto submenu_perhitungan_luas_bangun
) else if "%choice%"=="3" (
    call :luas_persegi_panjang
    goto submenu_perhitungan_luas_bangun
) else if "%choice%"=="0" (
    goto menu
) else (
    echo Pilihan tidak valid!
    timeout 3 >nul
    goto submenu_perhitungan_luas_bangun
)

:luas_segitiga
REM Implementasi perhitungan luas segitiga
cls
title Segitiga
color 0d
echo ::Hitung Segitiga::
echo ======================
echo  1/2 x Alas x Tinggi
echo ====================== 
  Set /p alas= Alas    =
Set /p tinggi= Tinggi  =
set /a c=%alas%*%tinggi%
set /a d=c/2
echo ======================
          echo Hasil   = %d%
echo ====================== 
pause
echo Perhitungan Luas Segitiga
timeout 3 >nul
exit /b

:luas_lingkaran
REM Implementasi perhitungan luas lingkaran
:LINGKARAN
cls
title Lingkaran
color 0a
echo     .::Lingkaran::.
echo ======================
echo Rumus = PhixJarixJari
echo ======================
set /p Jari= Jari-Jari   =
        echo Phi ( TT )  = 22/7
set /a c=%Jari%*%Jari%
set /a d=c*22
set /a e=d/7 
echo ======================
echo Luas       = %e%
echo ======================
pause
echo Perhitungan Luas Lingkaran
timeout 3 >nul
exit /b

:luas_persegi_panjang
REM Implementasi perhitungan luas persegi panjang
cls
title PersegiPanjang
echo ======================
echo   ::Hitung Persegi::
echo ======================
echo     Panjang x Lebar
echo ======================
Set /p a= Panjang   =
Set /p b= Lebar     =
set /a c=%a%*%b%
echo ======================
     echo Hasil     = %c%
echo ======================
pause
echo Perhitungan Luas Persegi Panjang
timeout 3 >nul
exit /b

:perbaikan_komputer
REM Implementasi menu perbaikan komputer

:submenu_perbaikan_komputer
title MENU PERBAIKAN KOMPUTER
cls
echo MENU PERBAIKAN KOMPUTER
echo ---------------------------
echo 1. Memperbaiki Koneksi Internet
echo 2. Memperbaiki Sistem File
echo 3. Memperbaiki Error Aplikasi
echo 0. Kembali ke Menu Utama
echo ---------------------------
set /p "choice=Masukkan pilihan (0-3): "

if "%choice%"=="1" (
    call :perbaiki_koneksi_internet
    goto submenu_perbaikan_komputer
) else if "%choice%"=="2" (
    call :perbaiki_sistem_file
    goto submenu_perbaikan_komputer
) else if "%choice%"=="3" (
    call :perbaiki_error_aplikasi
    goto submenu_perbaikan_komputer
) else if "%choice%"=="0" (
    goto menu
) else (
    echo Pilihan tidak valid!
    timeout 3 >nul
    goto submenu_perbaikan_komputer
)

:perbaiki_koneksi_internet
REM Implementasi menu jaringan komputer
netsh winsock reset
echo Winsock berhasil di-reset.
echo Jaringan Komputer
timeout 3 >nul
exit /b


:perbaiki_sistem_file
REM Implementasi menu perbaikan sistem
chkdsk C: /f
echo Perbaikan Sistem
timeout 3 >nul
exit /b

:perbaiki_error_aplikasi
REM Memperbaiki Error WinRAR
echo Memperbaiki Error WinRAR...

REM 1. Mulai dengan mengakhiri proses WinRAR yang mungkin berjalan
taskkill /f /im WinRAR.exe

REM 2. Tunggu beberapa detik untuk memastikan proses WinRAR benar-benar berhenti
timeout 5 >nul

REM 3. Coba jalankan kembali WinRAR
start "" "C:\Program Files\WinRAR\WinRAR.exe"
echo Error aplikasi telah diperbaiki.
timeout 3 >nul
exit /b

:aplikasi
REM Implementasi menu aplikasi


:submenu_aplikasi
title MENU APLIKASI
cls
echo MENU APLIKASI
echo ---------------------------
echo 1. Buka Word
echo 2. Buka Excel
echo 3. Buka PowerPoint
echo 4. Buka Google Chrome
echo 0. Kembali ke Menu Utama
echo ---------------------------
set /p "choice=Masukkan pilihan (0-4): "

if "%choice%"=="1" (
    start "" "C:\Program Files\Microsoft Office\root\Office16\WINWORD.EXE"
    goto submenu_aplikasi
) else if "%choice%"=="2" (
    start "" "C:\Program Files\Microsoft Office\root\Office16\EXCEL.EXE"
    goto submenu_aplikasi
) else if "%choice%"=="3" (
    start "" "C:\Program Files\Microsoft Office\root\Office16\POWERPNT.EXE"
    goto submenu_aplikasi
) else if "%choice%"=="4" (
    start "" "C:\Program Files\Google\Chrome\Application\chrome.exe"
    goto submenu_aplikasi
) else if "%choice%"=="0" (
    goto menu
) else (
    echo Pilihan tidak valid!
    timeout 3 >nul
    goto submenu_aplikasi
)

:menu_setting
title MENU SETTING
cls
echo MENU SETTING
echo ---------------------------
echo 1. Buka Pengaturan Keyboard
echo 2. Buka Pengaturan Sound
echo 3. Buka Pengaturan Language
echo 0. Kembali ke Menu Utama
echo ---------------------------
set /p "choice=Masukkan pilihan (1-0): "

if "%choice%"=="1" (
    call :buka_pengaturan_keyboard
    goto menu_setting
) else if "%choice%"=="2" (
    call :buka_pengaturan_sound
    goto menu_setting
) else if "%choice%"=="3" (
    call :buka_pengaturan_language
    goto menu_setting
) else if "%choice%"=="0" (
    goto menu
) else (
    echo Pilihan tidak valid!
    timeout 3 >nul
    goto menu_setting
)

:buka_pengaturan_keyboard
REM Implementasi membuka pengaturan keyboard

start ms-settings:easeofaccess-keyboard
echo Pengaturan Keyboard telah dibuka
timeout 3 >nul
exit /b

:buka_pengaturan_sound
REM Implementasi membuka pengaturan sound


start mmsys.cpl
echo Pengaturan Sound telah dibuka
timeout 3 >nul
exit /b

:buka_pengaturan_language
REM Implementasi membuka pengaturan language
start ms-settings:regionlanguage
echo Pengaturan Language telah dibuka
timeout 3 >nul
exit /b

:jaringan_komputer
title MENU JARINGAN KOMPUTER
cls
REM Implementasi jaringan komputer
echo MENU JARINGAN KOMPUTER
echo ---------------------------
echo 1. Cek Nama Host dari IP
echo 2. Cek IP Address
echo 3. Ping ke Host
echo 0. Kembali ke menu utama
echo ---------------------------
set /p "choice=Masukkan pilihan (1-3): "

if "%choice%"=="1" (
    call :cek_nama_host_dari_ip
    goto jaringan_komputer
) else if "%choice%"=="2" (
    call :cek_ip_address
    goto jaringan_komputer
) else if "%choice%"=="3" (
    call :ping_ke_host
    goto jaringan_komputer
) else if "%choice%"=="0" (
    goto menu
) else (
    echo Pilihan tidak valid!
    timeout 3 >nul
    goto jaringan_komputer
)

:cek_nama_host_dari_ip
REM Implementasi cek nama host dari IP

set /p "ip=Masukkan alamat IP yang ingin diperiksa: "
echo Mencari nama host dari IP %ip%...
nslookup %ip%
pause
timeout 3 >nul
exit /b

:cek_ip_address
REM Implementasi cek IP address
ipconfig
echo Cek IP Address...
timeout 3 >nul
exit /b

:ping_ke_host
REM Implementasi ping ke host

set /p "host=Masukkan alamat host yang ingin diping: "
echo Mem-Ping ke %host%...
ping %host%
pause
exit /b

echo Jaringan Komputer
timeout 3 >nul
exit /b

:makanan
title MAKANAN NUSANTARA
cls
REM Menampilkan Makanan Nusantara
echo MAKANAN NUSANTARA
echo ---------------------------
echo 1. Gudeg
echo 2. Pecel
echo 0. Kembali ke menu utama
echo ---------------------------
set /p "choice=Masukkan pilihan (1-2): "

if "%choice%"=="1" (
    call :gudeg
    goto makanan
) else if "%choice%"=="2" (
    call :pecel
    goto makanan
) else if "%choice%"=="0" (
    goto menu
) else (
    echo Pilihan tidak valid!
    timeout 3 >nul
    goto makanan
)

:pecel
cls
REM Implementasi Pecel 
echo Harga Yang Harus Dibayar : Rp 20.000
pause
exit /b

:gudeg
cls
REM Implementasi Gudeg 
echo Harga Yang Harus Dibayar : Rp 50.000
pause
exit /b
