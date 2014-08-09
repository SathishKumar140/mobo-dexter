<?php
session_start();
//require_once 'sidebarmenu/index.html';
require_once '../conf/config.php';
require_once '../conf/verticalsidebar.php';

$user_id = $_SESSION['userid'];
$user_name = $_SESSION['username'];
echo '$user_id=', $user_id;
echo '$user_name=', $user_name;
?>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
        <meta charset="utf-8">
        <title>Business Tags</title>
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

        $showninterest = $_GET['shwnintrst'];
        $removeerror = $_GET['remerror'];
        if ($showninterest) {
            ?>

            <script>
                alert('Already shown interst on tag');
            </script>

            <?php
        }

        if ($removeerror == 3) {
            ?>
            <script>
                alert('Cannot Remove Tag from interest contact admin');
            </script>

            <?php
        } elseif ($removeerror == 2) {
            ?>
            <script>
                alert('Tag is not in the interest List');
            </script>

            <?php
        } elseif ($removeerror == 1) {
            ?>
            <script>
                alert('Tag is not in the interest List');
            </script>

            <?php
        }

        $sql_tags = "SELECT `tagMaster`.`TAG_ID`,
                    `tagMaster`.`TAG_NAME`,
                    `tagMaster`.`TAG_DESCRIPTION`,
                    `tagMaster`.`TAG_LATITUDE`,
                    `tagMaster`.`TAG_LATPLUS2`,
                    `tagMaster`.`TAG_LATMINUS2`,
                    `tagMaster`.`TAG_LONGITUDE`,
                    `tagMaster`.`TAG_LONGITUDE`,
                    `tagMaster`.`TAG_LONGPLUS2`,
                    `tagMaster`.`TAG_LONGMINUSS2`
                    FROM `tagMaster`
                    WHERE `tagMaster`.`CREATED_BY_BUSNSS` IS NOT NULL;";
        $result_tags = mysql_query($sql_tags);

        $count_tags = mysql_num_rows($result_tags);

        $tags = array();

        while ($row_tags = mysql_fetch_array($result_tags)) {
            $tag_array['tag_name'] = $row_tags['TAG_NAME'];
            $tag_array['tag_latitide'] = $row_tags['TAG_LATITUDE'];
            $tag_array['tag_longtitude'] = $row_tags['TAG_LONGITUDE'];
            $tag_array['tag_description'] = $row_tags['TAG_DESCRIPTION'];
            $tag_array['tag_id'] = $row_tags['TAG_ID'];

            array_push($tags, $tag_array);
        }

//        print_r($tags);

        $jsArray = array();
        foreach ($tags as $array) {
            $jsArray[] = array($array['tag_name'], $array['tag_latitide'], $array['tag_longtitude'], $array['tag_description'], $array['tag_id']);
        }
        echo json_encode($jsArray);
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
                            '</span>' +
                            '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<br /><br />' +
                            '<button id="concat_business" class="contact-business" name="contact-business" title="Contact-business" style="margin-left:20px;" onclick="ContactBusiness(' + beach[4] + ',<?php echo $user_id; ?>)">Contact Business</button>' +
                            '<button id="save_marker" class="save-marker" name="save-marker" title="Save Tag" style="margin-left:20px;" onclick="SaveMarker(' + beach[4] + ',<?php echo $user_id; ?>)">Save Tag</button>' +
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

            function ContactBusiness(tag_id, user_id) {

                //Contact Business
                var myData = {tagid: tag_id, userid: user_id}; //post variables
                $.ajax({
                    type: "POST",
                    url: "../ajax/ContactBusiness.php",
                    data: myData,
                    success: function(data) {
                        if (data == 'Success') {
                            alert('Thank You For The Interest Will Contact You Soon');
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError); //throw any errors
                    }
                });

            }

            function SaveMarker(tag_id, user_id) {
                //Contact Business 
                var myData = {tagid: tag_id, userid: user_id}; //post variables
                $.ajax({
                    type: "POST",
                    url: "../ajax/SaveTag.php",
                    data: myData,
                    success: function(data) {
                        alert(data);
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError); //throw any errors
                    }
                });

            }

            function RemoveMarker(tag_id, user_id) {

                var action = 'remove';
                window.location.href = "ajax/Cont_Save_Remove.php?tagid=" + tag_id + "&userid=" + user_id + "&action=" + action;

            }

            //############### Create Marker Function ##############
            //            function create_marker(MapPos, MapTitle, MapDesc, InfoOpenDefault, DragAble, Removable, map)
            //            {
            //                //new marker
            //                var marker = new google.maps.Marker({
            //                    position: MapPos,
            //                    map: map,
            //                    draggable: DragAble,
            //                    animation: google.maps.Animation.DROP,
            //                    title: "Hello World!",
            ////                    icon: iconPath
            //                });
            //                alert(MapPos);
            //                //Content structure of info Window for the Markers
            //                var contentString = $('<div class="marker-info-win">' +
            //                        '<div class="marker-inner-win"><span class="info-content">' +
            //                        '<h1 class="marker-heading">' + MapTitle + '</h1>' +
            //                        MapDesc +
            //                        '</span><button name="remove-marker" class="remove-marker" title="Remove Marker">Remove Marker</button>' +
            //                        '</div></div>');
            //
            //
            //                //Create an infoWindow
            //                var infowindow = new google.maps.InfoWindow();
            //                //set the content of infoWindow
            //                infowindow.setContent(contentString[0]);
            //
            //                //Find remove button in infoWindow
            //                var removeBtn = contentString.find('button.remove-marker')[0];
            //
            //                //Find save button in infoWindow
            //                var saveBtn = contentString.find('button.save-marker')[0];
            //
            //                //add click listner to remove marker button
            //                google.maps.event.addDomListener(removeBtn, "click", function(event) {
            //                    //call remove_marker function to remove the marker from the map
            //                    remove_marker(marker);
            //                });
            //
            //                if (typeof saveBtn !== 'undefined') //continue only when save button is present
            //                {
            //                    //add click listner to save marker button
            //                    google.maps.event.addDomListener(saveBtn, "click", function(event) {
            //                        var mReplace = contentString.find('span.info-content'); //html to be replaced after success
            //                        var mName = contentString.find('input.save-name')[0].value; //name input field value
            //                        var mDesc = contentString.find('textarea.save-desc')[0].value; //description input field value
            //                        var mType = contentString.find('select.save-type')[0].value; //type of marker
            //
            //                        if (mName == '' || mDesc == '')
            //                        {
            //                            alert("Please enter Name and Description!");
            //                        } else {
            //                            //call save_marker function and save the marker details
            //                            save_marker(marker, mName, mDesc, mType, mReplace);
            //                        }
            //                    });
            //                }
            //
            //                //add click listner to save marker button        
            //                google.maps.event.addListener(marker, 'click', function() {
            //                    infowindow.open(map, marker); // click on marker opens info window 
            //                });
            //
            //                if (InfoOpenDefault) //whether info window should be open by default
            //                {
            //                    infowindow.open(map, marker);
            //                }
            //            }

            google.maps.event.addDomListener(window, 'load', initialize);

        </script>
    </body>
</html>