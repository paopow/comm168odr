<?
require_once(dirname(__FILE__) . '/../utils.php');
//check username and password
session_start();

$_SESSION['username'] = 'Pat128';
$_SESSION['experimental_id'] = postVar('password');

$_SESSION['condition'] = $_SESSION['experimental_id'] % 6 + 1; //conditions 1-6

$result = array('success' => true);

echo json_encode($result);

?>