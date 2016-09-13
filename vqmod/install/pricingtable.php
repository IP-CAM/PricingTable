<?php

        // Add database
        require('../../config.php');
        $con = mysqli_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD,DB_DATABASE);
        //mysqli_select_db(DB_DATABASE, $con);
        $SQL = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "pricetable` (
                            `pricetable_id` int(11) NOT NULL AUTO_INCREMENT,
                            `pricetable_name` varchar(225) COLLATE utf8_unicode_ci DEFAULT NULL,
                            `pricetable_url` varchar(225) COLLATE utf8_unicode_ci DEFAULT NULL,
                            `feature_list` text NOT NULL,
                            `data` text NOT NULL,
                            `email` varchar(225) COLLATE utf8_unicode_ci DEFAULT NULL,
                            `label` varchar(225) COLLATE utf8_unicode_ci DEFAULT NULL,
                            `date_added` int(11) NOT NULL,
                            `enabled` int(11) NOT NULL,
                            PRIMARY KEY (`pricetable_id`)
                            ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;";
        mysqli_query( $con,$SQL);

        $SQL = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "pricetable_product` (
                            `pricetable_product_id` int(11) NOT NULL AUTO_INCREMENT,
                            `pricetable_id` int(11) NOT NULL,
                            `product_id` int(11) NOT NULL,
                            `status_product` int(11) NOT NULL,
                            PRIMARY KEY (`pricetable_product_id`)
                            ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;";
        mysqli_query( $con,$SQL);

        die('Setup Successful !');
?>
