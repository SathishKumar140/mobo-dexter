<html>
    <body>

        <form action="Checkpermission.php" method="post"
              enctype="multipart/form-data">
            <label for="file">Filename:</label>
            <input type="file" name="file" id="file"><br>
            <input type="submit" name="submit" value="Submit">
        </form>

    </body>
</html>

<?php
$allowedExts = array("gif", "jpeg", "jpg", "png");
$temp = explode(".", $_FILES["file"]["name"]);
$extension = end($temp);

if ($_FILES["file"]["error"] > 0) {
    echo "Error: " . $_FILES["file"]["error"] . "<br>";
} else {
//    echo "Upload: " . $_FILES["file"]["name"] . "<br>";
//    echo "Type: " . $_FILES["file"]["type"] . "<br>";
//    echo "Size: " . ($_FILES["file"]["size"] / 1024) . " kB<br>";
//    echo "Stored in: " . $_FILES["file"]["tmp_name"];
}

if (file_exists("../images/" . $_FILES["file"]["name"])) {
    echo $_FILES["file"]["name"] . " already exists. ";
} else {
    if (move_uploaded_file($_FILES["file"]["tmp_name"], "../images/" . $_FILES["file"]["name"])) {
        echo "Stored in: " . "../images/" . $_FILES["file"]["name"];
    } else {
        echo 'Fail';
    }
}
?>