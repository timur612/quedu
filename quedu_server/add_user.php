<?
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Headers: X-Requested-With,Origin,Content-Type,Cookie,Accept');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
require ("bd.php");
require ("phpmailer/phpmailer/class.phpmailer.php");
require ("phpmailer/phpmailer/class.smtp.php");
$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE);
//print_r($input);
$name=$input[name];
$email=$input[email];
$password=$input[password];
$result=mysqli_query ($db,"SELECT login FROM users WHERE login='$email'");
$content=mysqli_fetch_array ($result);
if (isset($content[login])) {die ("Uzhe est takoy accaunt");}


$code_proverki=mt_rand(10000,99999);
$result=mysqli_query ($db,"INSERT INTO users (Name,Login,Password,Hash) VALUES ('$name','$email','$password','$code_proverki')");
$result=mysqli_query ($db,"SELECT * FROM users WHERE login='$email'");
$content2=mysqli_fetch_array($result);

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
	$mail->setFrom('proektkvedu.noreply@gmail.com', '=?UTF-8?B?' . base64_encode('Команда Quedy') . '?=');
	$mail->addAddress($email);
   			//Content
	$mail->isHTML(true);                                  
	$mail->Subject = '=?UTF-8?B?' . base64_encode('Информация о регистрации на quedu') . '?=';
	$mail->Body = "Благодарим за регистрацию, код проверки -".$code_proverki." 

//данное письмо пришло автоматически, не отвечайте на него.";
	$mail->send();

print (' {
"Id" :	"'.$content2[Id].'"
}
');
?>