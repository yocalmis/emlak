<?php
$name = $_POST["name"];
$phone = $_POST["phone"];
$subject = $_POST["subject"];
$email = $_POST["email"];
$message = $_POST["message"];
$proje = $_POST["subject"];



$ac = fopen("data.txt","aw");

$eklenecek_metin = $name . " - " . $phone . " - " . $email . " - " . $proje  . " - " . $message . "\n";
fwrite($ac,$eklenecek_metin);



date_default_timezone_set('Etc/UTC');
require 'PHPMailer/PHPMailerAutoload.php';
$mail = new PHPMailer;
$mail->isSMTP();
$mail->SMTPDebug = 0;
$mail->Debugoutput = 'html';
$mail->Host = 'smtp.gmail.com';
$mail->Port = 587;
$mail->SMTPSecure = 'tls';
$mail->SetLanguage("tr", "PHPMailer/language");
$mail->CharSet  ="utf-8";
$mail->Encoding="base64";
$mail->SMTPAuth = true;
$mail->Username = "ogzblt@gmail.com";
$mail->Password = "+ogz66blt+";
$mail->setFrom('ogzblt@gmail.com', 'Data From Liv Marmara');
//Set who the message is to be sent to
$mail->addAddress('abdullatif.koc@propertytr.com', 'Abdüllatif KOÇ');
$mail->AddCC('ogzblt@gmail.com', 'Oğuzhan BULUT');
$mail->AddCC('yusuf.boz@propertytr.com', 'Yusuf BOZ');
//Set the subject line
$mail->Subject = $proje;

$html = "
<!DOCTYPE html>
<html>
<head>
<meta charset=\"utf-8\">
</head>
<body>
<table>
  <tr>
    <td width='25%'>AD SOYAD</td>
    <td>$name</td>
  </tr>
  <tr>
    <td width='25%'>TELEFON</td>
    <td>$phone</td>
  </tr>
  <tr>
    <td width='25%'>EMAİL</td>
    <td>$email</td>
  </tr>
  <tr>
    <td width='25%'>PROJE</td>
    <td>$proje</td>
  </tr>
  <tr>
    <td width='25%'>MESAJ</td>
    <td>$message</td>
  </tr>
</table>
</body>
</html>";


$mail->msgHTML($html);
if (!$mail->send()) {
    echo 'error';
} else {
    echo 'success';
}
