<?php
require ("phpmailer/phpmailer/class.phpmailer.php");
require ("phpmailer/phpmailer/class.smtp.php");
$login="proektkvedu@gmail.com";
	$mail = new PHPMailer(true);                              
	$mail->CharSet = 'utf-8';
	$mail->setLanguage('ru', '/phpmailer/phpmailer/language/'); 
				//Options
	$mail->SMTPDebug = 0;                                
	$mail->isSMTP();                                      
	$mail->SMTPAuth = true;                                                    
	$mail->SMTPSecure = 'tls';                            
	$mail->Port = 587;                                     
	$mail->Host = 'smtp.gmail.com';  
	$mail->Username = 'proektkvedu@gmail.com';             
	$mail->Password = 'B4Djq2@olWie';                        
    			//Recipients
	$mail->setFrom('14.bit.mail@gmail.com', '=?UTF-8?B?' . base64_encode('Команда Quedy') . '?=');
	$mail->addAddress($login);
   			//Content
	$mail->isHTML(true);                                  
	$mail->Subject = '=?UTF-8?B?' . base64_encode('Информация ') . '?=';
	$mail->Body = "Благодарим! 

данное письмо пришло автоматически, не отвечайте на него.";
	$mail->send();

?>