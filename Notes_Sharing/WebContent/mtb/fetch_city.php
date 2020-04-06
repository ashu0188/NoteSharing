<?php
include("dbconnection.php");

if(isset($_POST['cid']) && !empty($_POST["cid"])) {
    $sql = "SELECT * FROM city WHERE stid =".mysqli_real_escape_string($con, $_POST['cid']);
    $res = mysqli_query($con, $sql);
     if(mysqli_num_rows($res) > 0) {
        ?>
        <label>Select City:
            <select name="city">
                <option value="">Select City</option>
                <?php foreach ($res as $res) { ?>
                    <option value="<?php echo $res["ctid"]; ?>"><?php echo $res["cname"]; ?></option>
                <?php } ?>
            </select>
        </label>
        <?php
    }
}
?>