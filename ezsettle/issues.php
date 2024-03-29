<?php

require_once("include.php");

switch($_SESSION['condition']) {
	case 1:
	case 2:
	case 5:
		$typing = "The system is generating text ...";
		$I = "the system";
		break;
	case 3:
	case 4:
	case 6:
		$typing = "The mediator is typing ... ";
		$I = "I";
		break;
}

$_SESSION['issuesArr']= array('Return laptop', 'Pay back cost of computer', 'Pay back original shipment', 'Pay cost of rental computer', 'Pay emotional distress damages', 'If relevant, who pays the cost of return shipment?');

$_SESSION['chatNew'] = array(
	array('speaker' => 'Mediator', 'message' => 'In this process, '.$I.' would like to address the concerns that you and
Seller345 raised. EZSettle combined the issues that the two of you
included in your correspondence with PC4U.com into a single list. You may not recognize all
the issues in the list: the other party may have raised an issue that you did not address. After
reviewing the list, please click “yes” to confirm that these are the issues or “no” to add another
issue.')
	);
	


$_SESSION['chatOld'] = array();
$smarty->assign('username', sessionVar('username'));
$smarty->assign('issues', $_SESSION['issuesArr']);
$smarty->assign('chatNew', $_SESSION['chatNew']);
$smarty->assign('chatOld', $_SESSION['chatOld']);
$smarty->assign('condition', $_SESSION['condition']);
$smarty->assign('avatar', $avatar);
$smarty->assign('typing',$typing);
$smarty->display('issues.tpl');


?>

