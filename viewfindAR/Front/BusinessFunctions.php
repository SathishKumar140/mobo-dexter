<?php
session_start();
//require_once 'sidebarmenu/index.html';
require_once '../conf/config.php';
require_once '../conf/verticalsidebar.php';

$user_id = $_SESSION['userid'];
$user_name = $_SESSION['username'];
?>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
        <meta charset="utf-8">
        <title>Business Functionality</title>
        <style>
            html, body, #map-canvas {
                height: 100%;
                /*                margin: 0px;
                                padding: 0px*/
            }
        </style>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>

    </head>
    <body>
        <div id="map-canvas"></div>
        <?php
        $Latitude = "12.935192";
        $Longitude = "77.62415";
//        $user_id = 1;
        $showninterest = $_GET['shwnintrst'];
        $removeerror = $_GET['remerror'];
        $sql_tags = "SELECT `tagMaster`.`TAG_ID`,
                           `tagMaster`.`TAG_NAME`,
                           `tagMaster`.`TAG_LATITUDE`,
                           `tagMaster`.`TAG_LATITUDE`,
                           `tagMaster`.`TAG_LONGITUDE`,
                           `tagMaster`.`TAG_DESCRIPTION`,
                           `tagMaster`.`SUBTAG_NAME`,
                           `tagMaster`.`TAG_TYPE`,
                           `tagMaster`.`TAG_SUBTYPE`,
                           `tagMaster`.`TAG_CATEGORY`,
                           `tagMaster`.`TAG_SUBCATERGORY`
                    FROM `tagMaster`
                    WHERE `tagMaster`.`CREATED_BY_BUSNSS` = " . $user_id . ";";

        $result_tags = mysql_query($sql_tags);
//
        echo '$sql_tags=', $sql_tags;
//
        $count_tags = mysql_num_rows($result_tags);
//
//        echo '$count_tags=', $count_tags;
        if ($count_tags > 0) {
            $tags = array();

            while ($row_tags = mysql_fetch_array($result_tags)) {
                $tag_array['tag_id'] = $row_tags['TAG_ID'];
                $tag_array['tag_name'] = $row_tags['TAG_NAME'];
                $tag_array['tag_latitide'] = $row_tags['TAG_LATITUDE'];
                $tag_array['tag_longtitude'] = $row_tags['TAG_LONGITUDE'];
                $tag_array['tag_description'] = $row_tags['TAG_DESCRIPTION'];
                $tag_array['tag_sbtagnme'] = $row_tags['SUBTAG_NAME'];
                $tag_array['tag_type'] = $row_tags['TAG_TYPE'];
                $tag_array['tag_sbtype'] = $row_tags['TAG_SUBTYPE'];
                $tag_array['tag_ctgory'] = $row_tags['TAG_CATEGORY'];
                $tag_array['tag_sbctgory'] = $row_tags['TAG_SUBCATERGORY'];

                array_push($tags, $tag_array);
            }

//        print_r($tags);

            $jsArray = array();
            foreach ($tags as $array) {
                $jsArray[] = array($array['tag_name'], $array['tag_latitide'], $array['tag_longtitude'], $array['tag_description'], $array['tag_sbtagnme'], $array['tag_type'], $array['tag_sbtype'], $array['tag_ctgory'], $array['tag_sbctgory'], $array['tag_id']);
            }
            echo json_encode($jsArray);
        }
        ?>





        <script>

            var beaches = <?php echo json_encode($jsArray); ?>

            function initialize() {

                var myLatlng = new google.maps.LatLng(12.935192, 77.62415);
                var myLatlng1 = new google.maps.LatLng(12.935347, 77.624288);

                var mapOptions = {
                    zoom: 10,
                    center: myLatlng
                }
                var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

                setMarkers(map, beaches);

            }


            function setMarkers(map, locations) {
                var bounds = new google.maps.LatLngBounds();
                for (var i = 0; i < locations.length; i++)
                {
                    var beach = locations[i];
                    var coords = new google.maps.LatLng(beach[1], beach[2]);

                    var contentString = '<div class="marker-info-win">' +
                            '<div class="marker-inner-win"><span class="info-content">' +
                            '<h1 class="marker-heading">' + beach[0] + '</h1>' + beach[3] +
                            '<p><div class="marker-edit">' +
                            '<input type="hidden" name="tagid" class="tagid" value= ' + beach[9] + '>' +
                            '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<br /><br />' +
                            '<button id="offers" class="offers" name="offers" title="offers" style="margin-left:20px;" onclick="Offers(' + beach[9] + ',<?php echo $user_id; ?>)">Offers</button>' +
                            '&nbsp&nbsp&nbsp&nbsp' +
                            '<button id="billboards" class="billboards" name="billboards" title="billboards" style="margin-left:20px;" onclick="BillBoard(' + beach[9] + ')">Bill-Board</button>' +
                            '</div></p>' +
                            '</span>' +
                            '</div></div>';

                    var infowindow = new google.maps.InfoWindow({content: contentString});


                    //Find remove button in infoWindow
//                    var removeBtn = contentString.find('button.remove-marker')[0];
                    var marker = new google.maps.Marker({
                        position: coords,
                        map: map,
                        //                        icon: markerImage,
                        title: beach[0]
                                //                        zIndex: beach[3]
                                //                        draggable: true

                    });


                    google.maps.event.addListener(marker, 'click',
                            function(infowindow, marker) {
                                return function() {
                                    infowindow.open(map, marker);
                                };
                            }(infowindow, marker)
                            );



                    bounds.extend(coords);
                    map.fitBounds(bounds);
                }
            }

            function Offers(tag_id, usr_id) {

                window.open('../Grid/examples/BusinessOffers.php?tagid=' + tag_id + '&usrid=' + usr_id, 'targetWindow', 'toolbar=no,location=no,status=no,menubar=no,addressbar=no,scrollbars=no,resizable=yes,width=' + screen.width + ',height=' + screen.height);
            }

            function BillBoard(tag_id) {

                window.open('../Grid/examples/BillBoard.php?tagid=' + tag_id , 'targetWindow', 'toolbar=no,location=no,status=no,menubar=no,addressbar=no,scrollbars=no,resizable=yes,width=' + screen.width + ',height=' + screen.height);
            }


            google.maps.event.addDomListener(window, 'load', initialize);

        </script>
    </body>
</html>