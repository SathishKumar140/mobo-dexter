<html>
    <script src="../jquery/jquery-1.11.0.js"></script>
<!--<script src="/Scripts/jquery-1.7.1.js"></script>-->
    <script src="../jquery/jPanelMenu-1.0.0.min.js" type="text/javascript"></script> 
    <link rel="stylesheet" type="text/css" href="../css/sidebarstyle.css" />
    <link rel="stylesheet" type="text/css" href="../css/demo.css" />
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../css/animate-custom.css" />

    <header class="main">
        <div id="headerBar1">
            <div id="logoimg">
                <img src="/images/logo.png" alt="" />
            </div>
        </div>
        <div>
            <ul id="menu">
                <li><a href="ViewUserTag.php">View & Save Tag</a></li>
                <li><a href="CreateUserTag.php">Create Tag</a></li>
                <li><a href="BusinessFunctions.php">Business Offers</a></li>
                <li><a href="BusCreateTag.php">Business Create Tag</a></li>
                <li><a href="#">Options</a></li>
                <li><a href="#">API</a></li>
                <li><a href="#">Tips &amp; Examples</a></li>
                <li><a href="#">About</a></li>
            </ul>
        </div>
    </header>
    <script type="text/javascript">
        $(document).ready(function() {
            var jPM = $.jPanelMenu();
            jPM.on();
        });
    </script>
