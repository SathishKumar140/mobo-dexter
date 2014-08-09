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
        <title>Simple markers</title>
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
        $sql_tags = "SELECT `tagMaster`.`TAG_ID`,
                    `tagMaster`.`TAG_NAME`,
                    `tagMaster`.`TAG_LATITUDE`,
                    `tagMaster`.`TAG_LONGITUDE`,
                    `tagMaster`.`TAG_DESCRIPTION`,
                    `tagMaster`.`SUBTAG_NAME`,
                    `tagMaster`.`TAG_TYPE`,
                    `tagMaster`.`TAG_SUBTYPE`,
                    `tagMaster`.`TAG_CATEGORY`,
                    `tagMaster`.`TAG_SUBCATERGORY`
                    FROM `tagMaster`
                    WHERE `tagMaster`.`CREATED_BY` =  " . $user_id . ";";

        $result_tags = mysql_query($sql_tags);

//        echo '$sql_tags=', $sql_tags;

        $count_tags = mysql_num_rows($result_tags);

//        echo '$count_tags=', $count_tags;

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
//        echo json_encode($jsArray);
############################################## Get the Tap Type DD ###################################################################################

        $sql_tag_type = "SELECT `mdefalut_val`.`DEF_ID`,
                        `mdefalut_val`.`DEF_VAL`,
                        `mdefalut_val`.`DEF_VAL_DISP`
                        FROM `mdefalut_val`
                        WHERE `mdefalut_val`.`DEF_TYPE` = 'TagType';";

        $result_tag_type = mysql_query($sql_tag_type);
        $count_tag_type = mysql_num_rows($result_tag_type);
        if ($count_tag_type > 0) {
            $tag_type = array();

            $tag_type_select = '<select id="tagtype" class="save-tagtype" onchange="tagTypeChange()">';
            $tag_type_select = $tag_type_select . '<option value="">Select...</option>';
            while ($row_tag_type = mysql_fetch_array($result_tag_type)) {
                $tag_type_array['DEF_ID'] = $row_tag_type['DEF_ID'];
                $tag_type_array['DEF_VAL'] = $row_tag_type['DEF_VAL'];
                $tag_type_array['DEF_VAL_DISP'] = $row_tag_type['DEF_VAL_DISP'];

//                array_push($tag_type, $tag_type_array);

                $tag_type_select = $tag_type_select . '<option value="' . $tag_type_array['DEF_VAL'] . '">';
                $tag_type_select = $tag_type_select . $tag_type_array['DEF_VAL_DISP'];
                $tag_type_select = $tag_type_select . '</option>';
            }
            $tag_type_select = $tag_type_select . '</select>';
        }
#################################################################################################################################################  
############################################## Get the Category DD ###################################################################################

        $sql_category = "SELECT `mdefalut_val`.`DEF_ID`,
                        `mdefalut_val`.`DEF_VAL`,
                        `mdefalut_val`.`DEF_VAL_DISP`
                        FROM `mdefalut_val`
                        WHERE `mdefalut_val`.`DEF_TYPE` = 'TagCategory';";

        $result_category = mysql_query($sql_category);
        $count_category = mysql_num_rows($result_category);
        if ($count_category > 0) {
            $category = array();

            $category_select = '<select id="tagctgry" class="save-catgry" onchange="CategoryChange()">';
            $category_select = $category_select . '<option value="">Select...</option>';
            while ($row_category = mysql_fetch_array($result_category)) {
                $category_array['DEF_ID'] = $row_category['DEF_ID'];
                $category_array['DEF_VAL'] = $row_category['DEF_VAL'];
                $category_array['DEF_VAL_DISP'] = $row_category['DEF_VAL_DISP'];


                $category_select = $category_select . '<option value="' . $category_array['DEF_VAL'] . '">';
                $category_select = $category_select . $category_array['DEF_VAL_DISP'];
                $category_select = $category_select . '</option>';
            }
            $category_select = $category_select . '</select>';
        }
#################################################################################################################################################        
        ?>





        <script>//
//
            var beaches = <?php echo json_encode($jsArray); ?>;



            function initialize() {
                var user_id = <?php echo $user_id; ?>;

                var myLatlng = new google.maps.LatLng(12.935192, 77.62415);
                var myLatlng1 = new google.maps.LatLng(12.935347, 77.624288);

                var mapOptions = {
                    zoom: 10,
                    center: myLatlng
                }
                var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

                //drop a new marker on right click
                google.maps.event.addListener(map, 'click', function(event) {
                    //Edit form to be displayed with new marker
                    var EditForm = '<p><div class="marker-edit">' +
                            '<form action="ajax/SaveMarker.php" method="POST" name="SaveMarker" id="SaveMarker">' +
                            '<input type="hidden" name="latlng" value="' + event.latLng + '">' +
                            '<input type="hidden" name="business" class="save-business" value="">' +
                            '<label for="pName"><span>Place Name :</span><input type="text" name="pName" class="save-name" placeholder="Enter Tag Name" maxlength="40" /></label><br /><br />' +
                            '<label for="pDesc"><span>Description :</span><textarea name="pDesc" class="save-desc" placeholder="Enter Tag Description" maxlength="250"></textarea></label><br /><br />' +
                            '<label for="subtagnme"><span>Sub Tag Name :</span><input type="text" name="pName" class="save-subtag" placeholder="Enter Sub Tag Name" maxlength="40" /></label><br /><br />' +
                            '<label for="tagtype"><span>Tag Type :</span><?php echo $tag_type_select; ?></label><br /><br />' +
                            '<label for="tagsubtype"><span>Tag Sub Type :</span><select id="tagsubtype" class="save-subtagtype"><option value="">--select--</option></select></label><br /><br />' +
//                            '<label for="tagsubtype"><span>Tag Type :</span><select id="tagsubtype" class="save-subtagtype"><option value="Busineess">Busineess</option><option value="Non-Business">Non Business</option></select></label><br /><br />' +
                            '<label for="tagctgry"><span>Tag Category :</span><?php echo $category_select; ?></label><br /><br />' +
                            '<label for="tagsbctgry"><span>Tag Sub Category :</span><select id="tagsbctgry" class="save-subcatgry"><option value="">--select--</option></select></label><br /><br />' +
                            '<label for="uploadimg"><span>Uplaod Image :</span><input id="file" name="file[]" type="file" multiple=""/></label><br /><br />' +
                            '<a href="#" onclick="addmore();"><label class="add_more">Add More Files</label></a><br /><br />' +
                            '</div></p><button name="save-marker" class="save-marker">Save Marker Details</button>';


                    //call create_marker() function
                    create_marker(event.latLng, 'New Marker', EditForm, true, true, true, map, user_id);

                });


                setMarkers(map, beaches);

            }

            //############### Create Marker Function ##############
            function create_marker(MapPos, MapTitle, MapDesc, InfoOpenDefault, DragAble, Removable, map, user_id)
            {
                //new marker
                var marker = new google.maps.Marker({
                    position: MapPos,
                    map: map,
                    draggable: DragAble,
                    animation: google.maps.Animation.DROP,
                    title: "Mark Me",
//                    icon: iconPath
                });
                //Content structure of info Window for the Markers
                var contentString = $('<div class="marker-info-win">' +
                        '<div class="marker-inner-win"><span class="info-content">' +
                        '<h1 class="marker-heading">' + MapTitle + '</h1>' +
                        MapDesc +
                        '</span><button name="remove-marker" class="remove-marker" title="Remove Marker">Remove Marker</button>' +
                        '</div></div>');


                //Create an infoWindow
                var infowindow = new google.maps.InfoWindow();
                //set the content of infoWindow
                infowindow.setContent(contentString[0]);

                //Find remove button in infoWindow
                var removeBtn = contentString.find('button.remove-marker')[0];

                //Find save button in infoWindow
                var saveBtn = contentString.find('button.save-marker')[0];

                //add click listner to remove marker button
                google.maps.event.addDomListener(removeBtn, "click", function(event) {
                    //call remove_marker function to remove the marker from the map
                    remove_marker(marker);
                });

                if (typeof saveBtn !== 'undefined') //continue only when save button is present
                {
                    //add click listner to save marker button
                    google.maps.event.addDomListener(saveBtn, "click", function(event) {
                        var mReplace = contentString.find('span.info-content'); //html to be replaced after success
                        var mName = contentString.find('input.save-name')[0].value; //name input field value
                        var mDesc = contentString.find('textarea.save-desc')[0].value; //description input field value
                        var mSubtag = contentString.find('input.save-subtag')[0].value; //description input field value
                        var mSubtagtype = contentString.find('select.save-subtagtype')[0].value; //description input field value
                        var mTagtype = contentString.find('select.save-tagtype')[0].value; //description input field value
                        var mCtgry = contentString.find('select.save-catgry')[0].value; //description input field value
                        var mSubctgry = contentString.find('select.save-subcatgry')[0].value; //description input field value
                        var mbusiness = contentString.find('input.save-business')[0].value; //description input field value
//                        var mType = contentString.find('select.save-type')[0].value; //type of marker


                        if (mName == '' || mDesc == '')
                        {
                            alert("Please enter Name and Description!");
                        } else {
                            var mLatLang = marker.getPosition().toUrlValue();
                            var filedata = document.getElementById("file"),
                                    formdata = false;
//                                    alert(filedata);
                            if (window.FormData) {
                                formdata = new FormData();
                            }
                            var i = 0, len = filedata.files.length, img, reader, file;
//                            alert(len);
                            for (; i < len; i++) {
                                file = filedata.files[i];

//                                if (window.FileReader) {
//                                    reader = new FileReader();
//                                    reader.onloadend = function(e) {
//                                        showUploadedItem(e.target.result, file.fileName);
//                                    };
//                                    reader.readAsDataURL(file);
//                                }
//                                if (formdata) {
                                    formdata.append("file[]", file);
//                                }
                            }

                            formdata.append("pName", mName);
                            formdata.append("pDesc", mDesc);
                            formdata.append("latlng", mLatLang);
                            formdata.append("subtagnme", mSubtag);
                            formdata.append("tagsubtype", mSubtagtype);
                            formdata.append("tagtype", mSubtagtype);
                            formdata.append("tagsubtype", mTagtype);
                            formdata.append("tagctgry", mCtgry);
                            formdata.append("tagsbctgry", mSubctgry);
                            formdata.append("business", mbusiness);
                            formdata.append("userid", user_id);
//                            alert(JSON.stringify(formdata));
//                            if (formdata) {
//                                $.ajax({
//                                    url: "../ajax/uploadimg.php",
//                                    type: "POST",
//                                    data: formdata,
//                                    processData: false,
//                                    contentType: false,
//                                    success: function(res) {
//                                            alert(res);
//                                    },
//                                    error: function(res) {
//                                        alert('fail');
//                                    }
//                                });
//                            }


                            //call save_marker function and save the marker details

                            save_marker(formdata);
                        }
                    });
                }

                //add click listner to save marker button        
                google.maps.event.addListener(marker, 'click', function() {
                    infowindow.open(map, marker); // click on marker opens info window 
                });

                if (InfoOpenDefault) //whether info window should be open by default
                {
                    infowindow.open(map, marker);
                }
            }

            function setMarkers(map, locations) {
                var bounds = new google.maps.LatLngBounds();
                for (var i = 0; i < locations.length; i++)
                {
                    var beach = locations[i];
                    var coords = new google.maps.LatLng(beach[1], beach[2]);
//                    var contentString = '<div id="content">' +
//                            'Info Window Test:' + beach[0] +
//                            '</div>';
//                    var contentString = 'check';

//                    //Find save button in infowindow
//                    var saveBtn     = contentString.find('button.save-marker');        
//                    
//                    alert(saveBtn);
                    var html = $('<div class="marker-info-win">' +
                            '<div class="marker-inner-win"><span class="info-content">' +
                            '<h1 class="marker-heading">' + '' + '</h1>' +
                            '</span>' +
                            '<p><div class="marker-edit">' +
                            '<input type="hidden" name="tagid-upd" class="tagid-upd" value= ' + beach[9] + '>' +
                            '<input type="hidden" name="business" class="upd-business" value="business">' +
                            '<span>Place Name :</span> <input type="text" name="pName" class="save-name-edit" placeholder="Enter Tag Name" maxlength="40" value= ' + beach[0] + ' /><br /><br /> ' +
                            '<span>Description :</span> <textarea name="pDesc" class="save-desc-edit" placeholder="Enter Tag Description" maxlength="250">' + beach[3] + '</textarea><br /><br />  ' +
                            '<span>Sub Tag Name :</span> <input type="text" name="pName" class="save-subtag-edit" placeholder="Enter Sub Tag Name" maxlength="40" value= ' + beach[4] + ' /><br /><br />  ' +
                            '<span>Sub Tag Type :</span> <select id="tagsubtype" class="save-subtagtype-edit"><option value="" disabled="disabled" selected="selected">' + beach[5] + '</option><option value="Hotel">Hotel</option><option value="Restaurant">Restaurant</option></select><br /><br />  ' +
                            '<span>Tag Type :<select id="tagtype" class="save-tagtype-edit" ><option value="" disabled="disabled" selected="selected">' + beach[6] + '</option><option value="Busineess">Busineess</option><option value="Non Business">Non Business</option></select><br /><br />  ' +
                            '<span>Tag Category :</span> <select id="tagctgry" class="save-catgry-edit"><option value="" disabled="disabled" selected="selected">' + beach[7] + '</option><option value="volvo">Volvo</option><option value="saab">Saab</option><option value="mercedes">Mercedes</option></select><br /><br />  ' +
                            '<span>Tag Sub Type :</span> <select id="tagsbctgry" class="save-subcatgry-edit"><option value="" disabled="disabled" selected="selected">' + beach[8] + '</option><option value="volvo">Volvo</option><option value="saab">Saab</option><option value="mercedes">Mercedes</option></select><br /><br />  ' +
                            '<button name="save-marker" class="save-marker-edit">Update Tag</button>' +
                            '</div></p>' +
                            '</span>' +
                            '</div></div>');

//                    var infowindow = new google.maps.InfoWindow({
//                        content: html
//                    });

                    var infowindow = new google.maps.InfoWindow();
                    //set the content of infoWindow
                    infowindow.setContent(html[0]);

                    var updBtn = html.find('button.save-marker-edit')[0];

                    if (typeof updBtn !== 'undefined') //continue only when save button is present
                    {

                        //add click listner to save marker button
                        google.maps.event.addDomListener(updBtn, "click", function(event) {

                            var mReplace = html.find('span.info-content'); //html to be replaced after success

                            var mName = html.find('input.save-name-edit')[0].value; //name input field value
                            var mDesc = html.find('textarea.save-desc-edit')[0].value; //description input field value
                            var mSubtag = html.find('input.save-subtag-edit')[0].value; //description input field value
                            var mSubtagtype = html.find('select.save-subtagtype-edit')[0].value; //description input field value
                            var mTagtype = html.find('select.save-tagtype-edit')[0].value; //description input field value
                            var mCtgry = html.find('select.save-catgry-edit')[0].value; //description input field value
                            var mSubctgry = html.find('select.save-subcatgry-edit')[0].value; //description input field value
                            var mbusiness = html.find('input.upd-business')[0].value; //description input field value//                        
                            var mtagid = html.find('input.tagid-upd')[0].value; //description input field value//                        


                            if (mName == '' || mDesc == '')
                            {
                                alert("Please enter Name and Description!");
                            } else {
                                //call save_marker function and save the marker details
                                update_marker(marker, mName, mDesc, mSubtag, mSubtagtype, mTagtype, mCtgry, mSubctgry, mbusiness, mtagid, mReplace);
                                alert('clicked');
                            }
                        });
                    }

//                    var infowindow = new google.maps.InfoWindow({content: contentString});
//                    var markerImage = new google.maps.MarkerImage
//                            (
////                                    "http://www.alawar.com/games_img/games/sky-bubbles/sky-bubbles-deluxe-logosmall.gif",
//                                    new google.maps.Size(44, 44, "px", "px"),
//                                    new google.maps.Point(0, 0),
//                                    new google.maps.Point(0, 0),
//                                    new google.maps.Size(20, 20, "px", "px")
//                                    );
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

            //############### Save Marker Function ##############
            function save_marker(formdata)
            {
                $.ajax({
                    type: "POST",
                    url: "../ajax/CreateMarker.php",
                    data: formdata,
                    processData: false,
                    contentType: false,
                    success: function(data) {
                        alert(data);
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError); //throw any errors
                    }
                });
            }


            //############### Update Marker Function ##############
            function update_marker(Marker, mName, mDesc, mSubtag, mSubtagtype, mTagtype, mCtgry, mSubctgry, mbusiness, mtagid, replaceWin)
            {
                //Save new marker using jQuery Ajax
                var mLatLang = Marker.getPosition().toUrlValue(); //get marker position
                var myData = {pName: mName, pDesc: mDesc, latlng: mLatLang, subtagnme: mSubtag, tagsubtype: mSubtagtype, tagtype: mTagtype, tagctgry: mCtgry, tagsbctgry: mSubctgry, business: mbusiness, tag_id: mtagid}; //post variables
                console.log(replaceWin);
                $.ajax({
                    type: "POST",
                    url: "ajax/UpdateMarker.php",
                    data: myData,
                    success: function(data) {
                        replaceWin.html(data); //replace info window with new html
//                        Marker.setDraggable(false); //set marker to fixed
//                        Marker.setIcon('http://PATH-TO-YOUR-WEBSITE-ICON/icons/pin_blue.png'); //replace icon
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError); //throw any errors
                    }
                });
            }

            function tagTypeChange() {

                var tagtype = document.getElementById('tagtype').value;
//                alert(tagtype);
                var myData = {tag_type: tagtype, DDtype: "Changetagtype"}; //post variables

                $.ajax({
                    type: "POST",
                    url: "../ajax/SelectDDTag.php",
                    data: myData,
                    success: function(data) {

                        $("#tagsubtype").empty().append(data);

                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError); //throw any errors
                    }
                });
            }


            function CategoryChange() {

                var categorytype = document.getElementById('tagctgry').value;
//                alert(tagtype);
                var myData = {tag_type: categorytype, DDtype: "Changecategory"}; //post variables

                $.ajax({
                    type: "POST",
                    url: "../ajax/SelectDDTag.php",
                    data: myData,
                    success: function(data) {

                        $("#tagsbctgry").empty().append(data);

                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError); //throw any errors
                    }
                });
            }


            function addmore() {

                $(document).ready(function() {
                    $('.add_more').click(function(e) {
                        e.preventDefault();
                        $(this).before('<label for="uploadimg"><span>Uplaod Image :</span><input name="file[]" type="file" /></label><br /><br />');
                    });
                });
            }



            google.maps.event.addDomListener(window, 'load', initialize);

        </script>
    </body>
</html>