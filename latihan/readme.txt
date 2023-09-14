Tugas
1. buatlah script automasi menggunakan robot framework untuk dapat melakukan testing login dan register
2. push code yang telah di kerjakan dengan format nama brance participant_latihan_robot(pangestu_latihan_robot) dengan base brach dari training_robot

Testcase 
1. Register Valid 
    Step
        -Masuk ke halaman Register
        -Input semua field pada form register
        -Klik tombol Create an Account
    Expected Result
        -Berhasil melakukan register dan account tersebut dapat digunakan untuk login
2. Register With Email Field Is Empty
    Step
        -Masuk ke halaman Register
        -Input data field pada form register kecuali field email
        -Klik tombol Create an Account
    Expected Result
        -gagal melakukan register dan mendapatkan pesan error
3. Login with Valid Credential
    Step    
        -Masuk ke login page
        -Input email dan password dengan Account yang telah registrasi sebelumnya
        -Klik tombol Sign in
    Expected Result
        -Berhasil masuk dengan Account yang telah registrasi sebelumnya
4. Login with Invalid Credential
    Step    
        -Masuk ke login page
        -Input email dan password dengan Account yang telah registrasi sebelumnya tetapi password yang tidak sesuai
        -Klik tombol Sign in
    Expected Result
        -gagal melakukan login dan mendapatkan pesan error