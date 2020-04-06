<?php
include("dbconnection.php");

?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="icon" href="http://www.thesoftwareguy.in/favicon.ico" type="image/x-icon" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Multiple dropdown with jquery ajax and php">
        <meta name="keywords" content="Multiple dropdown with jquery ajax and php">
        <meta name="author" content="Shahrukh Khan">
        <title>Multiple dropdown with jquery ajax and php - thesoftwareguy</title>
        <link rel="stylesheet" href="bootstrap.css" type="text/css" />

    </head>
    <body>
        <center>
        	<table border="0">
                        <tr>
                            <td align="center" height="50">
                                <?php
                                $sql = "SELECT * FROM country";
                                $res = mysqli_query($con, $sql);
                                ?>
                                <label>Select Country:
                                    <select name="country" onChange="showState(this);">
                                        <option value="">Select Country</option>
                                        <?php if(mysqli_num_rows($res) > 0) {

											while($row = mysqli_fetch_object($res)) {
												echo "<option value='".$row->cnid."'>".$row->cnname."</option>";
											}
										} ?>
                                    </select>
                                </label>
                            </td>
                            </tr>
                            <tr>
                        <td align="center" height="50"><div id="output1"></div> </td>

                        </tr>
                        <tr>
                            <td align="center" height="50"><div id="output2"></div> </td>
                        </tr>
                    </table>
                    <div class="height10"></div>


                </article>
            </div>
        </div>
        <script src="jquery-1.9.0.min.js"></script>
        <script>
                    function showState(sel) {
                        var cid = sel.options[sel.selectedIndex].value;
                        $("#output1").html("");
                        $("#output2").html("");
                        if (cid.length > 0) {

                            $.ajax({
                                type: "POST",
                                url: "fetch_state.php",
                                data: "did=" + cid,
                                cache: false,
                                beforeSend: function() {
                                    $('#output1').html('<img src="loader.gif" alt="" width="24" height="24">');
                                },
                                success: function(html) {
                                    $("#output1").html(html);
                                }
                            });
                        }
                    }

                    function showCity(sel) {
                        var cid = sel.options[sel.selectedIndex].value;
                        if (cid.length > 0) {
                            $.ajax({
                                type: "POST",
                                url: "fetch_city.php",
                                data: "cid=" + cid,
                                cache: false,
                                beforeSend: function() {
                                    $('#output2').html('<img src="loader.gif" alt="" width="24" height="24">');
                                },
                                success: function(html) {
                                    $("#output2").html(html);
                                }
                            });
                        } else {
                            $("#output2").html("");
                        }
                    }
        </script>
    </body>
</html>
