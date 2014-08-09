<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//$target_path = "../images/";
//for ($i = 0; $i < count($_FILES['file']['name']); $i++) {
//    $ext = explode('.', basename($_FILES['file']['name'][$i]));
//    $target_path = $target_path . md5(uniqid()) . "." . $ext[count($ext) - 1];
//
//    if (move_uploaded_file($_FILES['file']['tmp_name'][$i], $target_path)) {
//        echo "The file has been uploaded successfully <br />";
//    } else {
//        echo "There was an error uploading the file, please try again! <br /> $target_path";
//        
//        echo json_encode(error_get_last());
//    }
//}


//if (file_exists("../images/" . $_FILES["file"]["name"])) {
//    echo $_FILES["file"]["name"] . " already exists. ";
//} else {
//    if (move_uploaded_file($_FILES["file"]["tmp_name"], "../images/" . $_FILES["file"]["name"])) {
//        echo "Stored in: " . "../images/" . $_FILES["file"]["name"];
//    } else {
//        echo 'Fail';
//    }
//}

echo $_POST['id'];

//if (file_exists("../images/" . $_FILES["file"]["name"])) {
//    echo $_FILES["file"]["name"] . " already exists. ";
//} else {
//    echo 'new file';
//}
?>