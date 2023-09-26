Tugas
1. buatlah script automasi menggunakan robot framework untuk dapat melakukan testing login dan register
2. push code yang telah di kerjakan dengan format nama brance participant_latihan_robot(cth : pangestu_latihan_robot) dengan base brach dari training_robot
*pastikan sudah download web driver dan di simpan di variable ${WebDriverPath} 

Testcase 
1. Register Valid 
    Step
        -Masuk ke halaman Register
        -centang kolom Phone number is registered in whatsapp
        -Input semua field pada form register
        -Klik tombol Create an Account
    Expected Result
        -Berhasil melakukan register dan account tersebut dapat digunakan untuk login
2. Register With Email Field Is Empty
    Step
        -Masuk ke halaman Register
        -centang kolom Phone number is registered in whatsapp
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


${InputEmail}    //input[@id='login-email-textfield']
${InputPassword}    //input[@id='login-password-passfield']
${EmailAddress}    jellytest@yopmail.com
${FailedEmail}    jellytestyopmail.com
${Password}    Jellyfansclub#2023
${passwordConfirm}    Jellyfansclub#2023
${FailedPassword}    Passwordfail
${Name}    Jelly
${Lastname}    Oke
${NoHP}    83112512212
${NoHPsatu}    83162206391