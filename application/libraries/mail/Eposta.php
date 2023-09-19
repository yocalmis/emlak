<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Eposta {




function bilgi($nm,$em,$ph,$msg, $ulke)
{


include("class.phpmailer.php");

$mail = new PHPMailer();
$mail->IsSMTP();
$mail->SMTPDebug = 1; // hata ayiklama: 1 = hata ve mesaj, 2 = sadece mesaj
$mail->SMTPAuth = true;
$mail->SMTPSecure = 'ssl';
$mail->Host = 'smtp.gmail.com';
$mail->Port = 465;
$mail->IsHTML(true);
$mail->SetLanguage("tr", "phpmailer/language");
$mail->CharSet  ="utf-8";
$mail->Username = "jennethomes@gmail.com"; // Mail adresimizin kullanicı adi
$mail->Password = "forms1453"; // Mail adresimizin sifresi
//$mail->SetFrom("Saray Mefruşat İletişim Formu", "aaaa"); // Mail attigimizda gorulecek ismimiz

$mail->SetFrom("jennethomes@gmail.com");
$mail->addReplyTo("jennethomes@gmail.com");

//$mail->AddAddress("yocalmis@gmail.com"); // Maili gonderecegimiz kisi yani alici
//$mail->AddAddress("kayhan@saraymefrusat.com"); // Maili gonderecegimiz kisi yani alici
//$mail->AddAddress("yocalmis@gmail.com"); // Maili gonderecegimiz kisi yani alici
$mail->AddAddress("jennethomes@gmail.com"); // Maili gonderecegimiz kisi yani alici
$mail->Subject = "Jennet Homes Tr Bilgi Maili"; // Konu basligi
$mail->Body = "<br><br>Adı: ".$nm." <br><br> Email: ".$em."  <br><br> Tel: ". $ulke." ".$ph." <br><br> Message: ".$msg; // Mailin icerigi

if(!$mail->Send()){
	return FALSE;
} else {
	return TRUE;
}




}














}


?>