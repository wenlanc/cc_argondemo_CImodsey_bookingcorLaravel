<?php
define('BASEPATH', "/");
define('ENVIRONMENT', 'production');
require_once "application/config/database.php";
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
//set database credentials
$database = $db['default'];
$db_host = $database['hostname'];
$db_name = $database['database'];
$db_user = $database['username'];
$db_password = $database['password'];

/* Connect */
$connection = mysqli_connect($db_host, $db_user, $db_password, $db_name);
$connection->query("SET CHARACTER SET utf8");
$connection->query("SET NAMES utf8");
if (!$connection) {
    $error = "Connect failed! Please check your database credentials.";
}
if (isset($_POST["btn_submit"])) {
    update($connection);
    $success = 'The update has been successfully completed!';
}

function runQuery($sql)
{
    global $connection;
    return mysqli_query($connection, $sql);
}

if (isset($_POST["btn_submit"])) {
    update();
    $success = 'The update has been successfully completed! Please delete the "update_database.php" file.';
}

function updateCategories($parentId, $treeId, $level)
{
    if (!empty($parentId)) {
        $categories = runQuery("SELECT * FROM categories WHERE parent_id = " . $parentId);
        if (!empty($categories->num_rows)) {
            while ($category = mysqli_fetch_array($categories)) {
                runQuery("UPDATE `categories` SET `tree_id` = " . $treeId . ", `level` = " . $level . " WHERE id = " . $category['id']);
                updateCategories($category['id'], $treeId, $level + 1);
            }
        }
    }
}

function update()
{
    updateFrom19To20();
    sleep(1);
    updateFrom20To21();
    sleep(1);
    updateFrom21To22();
}

function updateFrom19To20()
{
    $tableCoupons = "CREATE TABLE `coupons` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `seller_id` int(11) DEFAULT NULL,
        `coupon_code` varchar(50) DEFAULT NULL,
        `discount_rate` smallint(6) DEFAULT NULL,
        `coupon_count` int(11) DEFAULT NULL,
        `minimum_order_amount` bigint(20) DEFAULT NULL,
        `currency` varchar(20) DEFAULT NULL,
        `usage_type` varchar(20) DEFAULT 'single',
        `category_ids` text DEFAULT NULL,
        `expiry_date` timestamp NULL DEFAULT NULL,
        `created_at` timestamp NULL DEFAULT NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;";

    $tableCouponsUsed = "CREATE TABLE `coupons_used` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `order_id` int(11) DEFAULT NULL,
        `user_id` int(11) DEFAULT NULL,
        `coupon_code` varchar(255) DEFAULT NULL,
        `created_at` timestamp NOT NULL DEFAULT current_timestamp()
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;";

    $tableCouponProducts = "CREATE TABLE `coupon_products` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `coupon_id` int(11) NOT NULL,
        `product_id` int(11) NOT NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;";


    $tableRolesPermissions = "CREATE TABLE `roles_permissions` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `role_name` text DEFAULT NULL,
        `permissions` text DEFAULT NULL,
        `is_super_admin` tinyint(1) DEFAULT 0,
        `is_default` tinyint(1) DEFAULT 0,
        `is_admin` tinyint(1) DEFAULT 0,
        `is_vendor` tinyint(1) DEFAULT 0,
        `is_member` tinyint(1) DEFAULT 0
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;";

    runQuery($tableCoupons);
    runQuery($tableCouponsUsed);
    runQuery($tableCouponProducts);
    runQuery($tableRolesPermissions);
    runQuery("ALTER TABLE orders ADD COLUMN `coupon_code` VARCHAR(255);");
    runQuery("ALTER TABLE orders ADD COLUMN `coupon_discount` bigint(20);");
    runQuery("ALTER TABLE orders ADD COLUMN `coupon_seller_id` INT;");
    runQuery("ALTER TABLE users ADD COLUMN `role_id` smallint(6) DEFAULT 3;");
    runQuery("ALTER TABLE users ADD COLUMN `has_active_shop` TINYINT(1) DEFAULT 0;");

    $languages = runQuery("SELECT * FROM languages;");
    $nameArrayAdmin = array();
    while ($language = mysqli_fetch_array($languages)) {
        $item = array(
            'lang_id' => $language['id'],
            'name' => "Super Admin"
        );
        array_push($nameArrayAdmin, $item);
    }
    $nameArrayAdmin = serialize($nameArrayAdmin);

    $languages = runQuery("SELECT * FROM languages;");
    $nameArrayVendor = array();
    while ($language = mysqli_fetch_array($languages)) {
        $item = array(
            'lang_id' => $language['id'],
            'name' => "Vendor"
        );
        array_push($nameArrayVendor, $item);
    }
    $nameArrayVendor = serialize($nameArrayVendor);

    $languages = runQuery("SELECT * FROM languages;");
    $nameArrayMember = array();
    while ($language = mysqli_fetch_array($languages)) {
        $item = array(
            'lang_id' => $language['id'],
            'name' => "Member"
        );
        array_push($nameArrayMember, $item);
    }
    $nameArrayMember = serialize($nameArrayMember);

    $sqlRole = "INSERT INTO `roles_permissions` (`id`, `role_name`, `permissions`, `is_super_admin`, `is_default`, `is_admin`, `is_vendor`, `is_member`) VALUES
                (1, '" . $nameArrayAdmin . "', 'all', 1, 1, 1, 0, 0),
                (2, '" . $nameArrayVendor . "', '2', 0, 1, 0, 1, 0),
                (3, '" . $nameArrayMember . "', '', 0, 1, 0, 0, 1);";
    runQuery($sqlRole);

    $users = runQuery("SELECT * FROM users;");
    if (!empty($users->num_rows)) {
        while ($user = mysqli_fetch_array($users)) {
            if (!empty($user) && !empty($user['role'])) {
                $hasActiveShop = 0;
                $roleId = 3;
                if ($user['role'] == "admin") {
                    $roleId = 1;
                    $hasActiveShop = 1;
                } elseif ($user['role'] == "vendor") {
                    $roleId = 2;
                    $hasActiveShop = 1;
                }
                $sql = "UPDATE `users` SET `role_id` = " . $roleId . ",`has_active_shop`=  " . $hasActiveShop . "  WHERE id = " . $user['id'];
                runQuery($sql);
            }
        }
    }
    runQuery("ALTER TABLE users DROP COLUMN `role`;");
    runQuery("INSERT INTO `routes` (`route_key`, `route`) VALUES ('coupons', 'coupons');");
    runQuery("INSERT INTO `routes` (`route_key`, `route`) VALUES ('add_coupon', 'add-coupon');");
    runQuery("INSERT INTO `routes` (`route_key`, `route`) VALUES ('edit_coupon', 'edit-coupon');");

    $p = array();
    $p["coupons"] = "Coupons";
    $p["add_coupon"] = "Add Coupon";
    $p["edit_coupon"] = "Edit Coupon";
    $p["coupon_code"] = "Coupon Code";
    $p["number_of_coupons"] = "Number of Coupons";
    $p["number_of_coupons_exp"] = "How many times a coupon can be used by all customers before being invalid";
    $p["coupon_minimum_cart_total_exp"] = "Minimum cart total needed to use the coupon";
    $p["coupon_usage_type"] = "Coupon Usage Type";
    $p["coupon_usage_type_1"] = "Each user can use it for only one order";
    $p["coupon_usage_type_2"] = "Each user can use it for multiple orders (Guests can use)";
    $p["expiry_date"] = "Expiry Date";
    $p["msg_coupon_code_added_before"] = "This coupon code has already been added before. Please add another coupon code.";
    $p["exp_special_characters"] = "Do not use special characters";
    $p["expired"] = "Expired";
    $p["roles_permissions"] = "Roles & Permissions";
    $p["add_role"] = "Add Role";
    $p["roles"] = "Roles";
    $p["role_name"] = "Role Name";
    $p["permissions"] = "Permissions";
    $p["edit_role"] = "Edit Role";
    $p["all_permissions"] = "All Permissions";
    $p["change_user_role"] = "Change User Role";
    $p["role"] = "Role";
    $p["add_user"] = "Add User";
    $p["close_seller_shop"] = "Close Seller's Shop";
    $p["apply"] = "Apply";
    $p["msg_invalid_coupon"] = "This coupon code is invalid or has expired!";
    $p["discount_coupon"] = "Discount Coupon";
    $p["coupon"] = "Coupon";
    $p["discount"] = "Discount";
    $p["msg_coupon_limit"] = "Coupon usage limit has been reached!";
    $p["msg_coupon_cart_total"] = "Your cart total is not enough to use this coupon. Minimum cart total:";
    $p["msg_coupon_auth"] = "This coupon is for registered members only!";
    $p["msg_coupon_used"] = "This coupon code has been used before!";
    addTranslations($p);
}

function updateFrom20To21()
{
    runQuery("ALTER TABLE categories ADD COLUMN `tree_id` INT;");
    runQuery("ALTER TABLE categories ADD COLUMN `level` INT;");
    runQuery("ALTER TABLE conversations ADD COLUMN `product_id` INT DEFAULT 0;");
    runQuery("ALTER TABLE users ADD COLUMN `cash_on_delivery` TINYINT(1) DEFAULT 0;");

    $columnExists = runQuery("SHOW COLUMNS FROM `orders` LIKE 'coupon_discount_rate';");
    if (!mysqli_num_rows($columnExists)) {
        runQuery("ALTER TABLE orders ADD COLUMN `coupon_discount_rate` smallint DEFAULT 0;");
    }

    $categories = runQuery("SELECT * FROM categories WHERE parent_id = 0;");
    if (!empty($categories->num_rows)) {
        while ($category = mysqli_fetch_array($categories)) {
            $treeId = $category['id'];
            $level = 1;
            runQuery("UPDATE `categories` SET `tree_id` = " . $treeId . ", `level` = " . $level . " WHERE id = " . $category['id']);
            updateCategories($category['id'], $treeId, $level + 1);
        }
    }

    runQuery("ALTER TABLE categories ADD INDEX idx_tree_id (tree_id);");
    runQuery("ALTER TABLE categories ADD INDEX idx_level (level);");
    runQuery("UPDATE general_settings SET version='2.1' WHERE id='1'");
    sleep(1);
    //add new translations
    $p = array();
    $p["cash_on_delivery_vendor_exp"] = "Sell your products with pay on delivery option";
    addTranslations($p);
}

function updateFrom21To22()
{
    runQuery("ALTER TABLE orders ADD COLUMN `coupon_products` TEXT;");
    runQuery("ALTER TABLE earnings CHANGE `price` `sale_amount` bigint(20)");
    runQuery("ALTER TABLE earnings ADD COLUMN `vat_rate` double");
    runQuery("ALTER TABLE earnings ADD COLUMN `vat_amount` bigint(20)");
    runQuery("ALTER TABLE earnings ADD COLUMN `commission` bigint(20)");
    runQuery("ALTER TABLE earnings ADD COLUMN `coupon_discount` bigint(20)");
    runQuery("ALTER TABLE general_settings ADD COLUMN `product_image_limit` smallint(6) DEFAULT 20");
    runQuery("UPDATE general_settings SET version='2.2' WHERE id='1'");
    sleep(1);
    //add new translations
    $p = array();
    $p["error_image_limit"] = "Image upload limit exceeded!";
    $p["product_image_upload_limit"] = "Product Image Upload Limit";
    $p["commission"] = "Commission";
    addTranslations($p);
}

function addTranslations($translations)
{
    $languages = runQuery("SELECT * FROM languages;");
    if (!empty($languages->num_rows)) {
        while ($language = mysqli_fetch_array($languages)) {
            foreach ($translations as $key => $value) {
                $trans = runQuery("SELECT * FROM language_translations WHERE label ='" . $key . "' AND lang_id = " . $language['id']);
                if (empty($trans->num_rows)) {
                    runQuery("INSERT INTO `language_translations` (`lang_id`, `label`, `translation`) VALUES (" . $language['id'] . ", '" . $key . "', '" . $value . "');");
                }
            }
        }
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Modesy - Update Wizard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,500,700" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet"/>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            color: #444 !important;
            font-size: 14px;
            background: #007991;
            background: -webkit-linear-gradient(to left, #007991, #6fe7c2);
            background: linear-gradient(to left, #007991, #6fe7c2);
        }

        .logo-cnt {
            text-align: center;
            color: #fff;
            padding: 60px 0 60px 0;
        }

        .logo-cnt .logo {
            font-size: 42px;
            line-height: 42px;
        }

        .logo-cnt p {
            font-size: 22px;
        }

        .install-box {
            width: 100%;
            padding: 30px;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            margin: auto;
            background-color: #fff;
            border-radius: 4px;
            display: block;
            float: left;
            margin-bottom: 100px;
        }

        .form-input {
            box-shadow: none !important;
            border: 1px solid #ddd;
            height: 44px;
            line-height: 44px;
            padding: 0 20px;
        }

        .form-input:focus {
            border-color: #239CA1 !important;
        }

        .btn-custom {
            background-color: #239CA1 !important;
            border-color: #239CA1 !important;
            border: 0 none;
            border-radius: 4px;
            box-shadow: none;
            color: #fff !important;
            font-size: 16px;
            font-weight: 300;
            height: 40px;
            line-height: 40px;
            margin: 0;
            min-width: 105px;
            padding: 0 20px;
            text-shadow: none;
            vertical-align: middle;
        }

        .btn-custom:hover, .btn-custom:active, .btn-custom:focus {
            background-color: #239CA1;
            border-color: #239CA1;
            opacity: .8;
        }

        .tab-content {
            width: 100%;
            float: left;
            display: block;
        }

        .tab-footer {
            width: 100%;
            float: left;
            display: block;
        }

        .buttons {
            display: block;
            float: left;
            width: 100%;
            margin-top: 30px;
        }

        .title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 10px;
            margin-top: 0;
            text-align: center;
        }

        .sub-title {
            font-size: 14px;
            font-weight: 400;
            margin-bottom: 30px;
            margin-top: 0;
            text-align: center;
        }

        .alert {
            text-align: center;
        }

        .alert strong {
            font-weight: 500 !important;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-8 col-sm-12 col-md-offset-2">
            <div class="row">
                <div class="col-sm-12 logo-cnt">
                    <h1>Modesy</h1>
                    <p>Welcome to the Update Wizard</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="install-box">
                        <h2 class="title">Update from v1.9.x to v2.2</h2>
                        <br><br>
                        <div class="messages">
                            <?php if (!empty($error)) { ?>
                                <div class="alert alert-danger">
                                    <strong><?= $error; ?></strong>
                                </div>
                            <?php } ?>
                            <?php if (!empty($success)) { ?>
                                <div class="alert alert-success">
                                    <strong><?= $success; ?></strong>
                                    <style>.alert-info {
                                            display: none;
                                        }</style>
                                </div>
                            <?php } ?>
                        </div>
                        <div class="step-contents">
                            <div class="tab-1">
                                <?php if (empty($success)): ?>
                                    <form action="<?= $_SERVER['PHP_SELF']; ?>" method="post">
                                        <div class="tab-footer text-center">
                                            <button type="submit" name="btn_submit" class="btn-custom">Update My Database</button>
                                        </div>
                                    </form>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
