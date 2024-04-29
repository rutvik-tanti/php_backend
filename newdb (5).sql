-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2024 at 06:21 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(10) NOT NULL,
  `name` text NOT NULL,
  `mono` text NOT NULL,
  `pincode` text NOT NULL,
  `state` text NOT NULL,
  `city` text NOT NULL,
  `street` text NOT NULL,
  `landmark` text NOT NULL,
  `uid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `name`, `mono`, `pincode`, `state`, `city`, `street`, `landmark`, `uid`) VALUES
(41, 'rutvik', '7283962184', '395010', 'Gujarat', 'Surat', '203,shantiniketan soc.', 'punagam', 100),
(44, 'Hello', '4258369752', '395006', 'Gujarat', 'Surat', 'Patel Nagar', 'Patel Nagar', 142);

--
-- Triggers `address`
--
DELIMITER $$
CREATE TRIGGER `address_trigger` BEFORE INSERT ON `address` FOR EACH ROW BEGIN 
    IF NEW.name = '' OR NEW.mono = '' OR NEW.pincode = '' OR NEW.state = '' OR NEW.city = '' OR NEW.street = '' OR NEW.landmark = '' OR NEW.uid = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot insert row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `address_update_trigger` BEFORE UPDATE ON `address` FOR EACH ROW BEGIN 
    IF NEW.name = '' OR NEW.mono = '' OR NEW.pincode = '' OR NEW.state = '' OR NEW.city = '' OR NEW.street = '' OR NEW.landmark = '' OR NEW.uid = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot update row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_pro`
--

CREATE TABLE `admin_pro` (
  `admin_email` text NOT NULL,
  `admin_pass` text NOT NULL,
  `id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_pro`
--

INSERT INTO `admin_pro` (`admin_email`, `admin_pass`, `id`) VALUES
('admin@gmail.com', 'admin123', 1);

--
-- Triggers `admin_pro`
--
DELIMITER $$
CREATE TRIGGER `admin_pro_trigger` BEFORE INSERT ON `admin_pro` FOR EACH ROW BEGIN 
    IF NEW.admin_email = '' OR NEW.admin_pass = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot insert row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `admin_pro_update_trigger` BEFORE UPDATE ON `admin_pro` FOR EACH ROW BEGIN 
    IF NEW.admin_email = '' OR NEW.admin_pass = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot update row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `imagename` text NOT NULL,
  `title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `imagename`, `title`) VALUES
(1, 'banner/bud.jpg', 'oneplus'),
(2, 'banner/airbuds.jpg', 'oneplus'),
(3, 'banner/buds.jpg', 'realme'),
(4, 'banner/headphone.jpg', 'jbl'),
(5, 'banner/iphone.jpg', 'Apple'),
(6, 'banner/mobile.jpg', 'oneplus'),
(7, 'banner/watch.jpg', 'realme');

-- --------------------------------------------------------

--
-- Table structure for table `cart_table`
--

CREATE TABLE `cart_table` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `current_user_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Triggers `cart_table`
--
DELIMITER $$
CREATE TRIGGER `cart_table_trigger` BEFORE INSERT ON `cart_table` FOR EACH ROW BEGIN 
    IF NEW.product_id = '' OR NEW.current_user_id = '' OR NEW.product_quantity = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot insert row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `cart_table_update_trigger` BEFORE UPDATE ON `cart_table` FOR EACH ROW BEGIN 
    IF NEW.product_id = '' OR NEW.current_user_id = '' OR NEW.product_quantity = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot update row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `favorite_table`
--

CREATE TABLE `favorite_table` (
  `fid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `pid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorite_table`
--

INSERT INTO `favorite_table` (`fid`, `uid`, `pid`) VALUES
(78, 118, 37),
(83, 100, 45),
(84, 100, 44);

--
-- Triggers `favorite_table`
--
DELIMITER $$
CREATE TRIGGER `favorite_table_trigger` BEFORE INSERT ON `favorite_table` FOR EACH ROW BEGIN 
    IF NEW.uid = '' OR NEW.pid = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot insert row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `favorite_table_update_trigger` BEFORE UPDATE ON `favorite_table` FOR EACH ROW BEGIN 
    IF NEW.uid = '' OR NEW.pid = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot update row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `p_quantity` int(10) NOT NULL,
  `o_id` bigint(10) NOT NULL,
  `uid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `p_id`, `p_quantity`, `o_id`, `uid`) VALUES
(97, 45, 1, 1712159634734, 100),
(98, 12, 1, 1712159764243, 100),
(99, 13, 1, 1712159764243, 100),
(100, 44, 1, 1712159970874, 100),
(101, 44, 1, 1712160466625, 100),
(102, 13, 1, 1712160620957, 100),
(103, 45, 1, 1712558141673, 142),
(104, 45, 1, 1712559668717, 142),
(105, 44, 2, 1712567774201, 100),
(106, 43, 2, 1712567774201, 100),
(107, 45, 4, 1712567774201, 100),
(108, 45, 1, 1712567803425, 100);

--
-- Triggers `order_items`
--
DELIMITER $$
CREATE TRIGGER `order_items_trigger` BEFORE INSERT ON `order_items` FOR EACH ROW BEGIN 
    IF NEW.p_id = '' OR NEW.p_quantity = '' OR NEW.o_id = '' OR NEW.uid = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot insert row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `order_items_update_trigger` BEFORE UPDATE ON `order_items` FOR EACH ROW BEGIN 
    IF NEW.p_id = '' OR NEW.p_quantity = '' OR NEW.o_id = '' OR NEW.uid = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot update row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(10) NOT NULL,
  `merchantTransactionId` bigint(10) NOT NULL,
  `transactionId` text NOT NULL,
  `payment_state` text NOT NULL,
  `payment_type` text NOT NULL,
  `pgTransactionId` text NOT NULL,
  `bankTransactionId` text NOT NULL,
  `pgAuthorizationCode` text NOT NULL,
  `bankId` text NOT NULL,
  `brn` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment2`
--

CREATE TABLE `payment2` (
  `pdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `id` int(11) NOT NULL,
  `o_id` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment2`
--

INSERT INTO `payment2` (`pdata`, `id`, `o_id`) VALUES
('{\"entity\":\"collection\",\"count\":1,\"items\":[{\"id\":\"pay_Nw22Rw3Ebb0bLi\",\"entity\":\"payment\",\"amount\":2890000,\"currency\":\"INR\",\"status\":\"captured\",\"order_id\":\"order_Nw20wDVDRnNa48\",\"invoice_id\":null,\"international\":false,\"method\":\"card\",\"amount_refunded\":0,\"refund_status\":null,\"captured\":true,\"description\":null,\"card_id\":\"card_Nw22S1Nhvwo6rJ\",\"card\":{\"id\":\"card_Nw22S1Nhvwo6rJ\",\"entity\":\"card\",\"name\":\"\",\"last4\":\"1111\",\"network\":\"Visa\",\"type\":\"debit\",\"issuer\":null,\"international\":false,\"emi\":false,\"sub_type\":\"consumer\",\"token_iin\":null},\"bank\":null,\"wallet\":null,\"vpa\":null,\"email\":\"hello@gmail.com\",\"contact\":\"+917283962184\",\"token_id\":\"token_Nw22SJElRTeD1x\",\"notes\":[],\"fee\":68204,\"tax\":10404,\"error_code\":null,\"error_description\":null,\"error_source\":null,\"error_step\":null,\"error_reason\":null,\"acquirer_data\":{\"auth_code\":\"327228\"},\"created_at\":1712558299}]}', 6, 1712558141673),
('{\"entity\":\"collection\",\"count\":1,\"items\":[{\"id\":\"pay_Nw4kI5u60c3Bps\",\"entity\":\"payment\",\"amount\":2890000,\"currency\":\"INR\",\"status\":\"captured\",\"order_id\":\"order_Nw4jo642mjfSfE\",\"invoice_id\":null,\"international\":false,\"method\":\"upi\",\"amount_refunded\":0,\"refund_status\":null,\"captured\":true,\"description\":null,\"card_id\":null,\"bank\":null,\"wallet\":null,\"vpa\":\"success@razorpay\",\"email\":\"rutvikpatel0q@gmail.com\",\"contact\":\"+917283962184\",\"notes\":[],\"fee\":68204,\"tax\":10404,\"error_code\":null,\"error_description\":null,\"error_source\":null,\"error_step\":null,\"error_reason\":null,\"acquirer_data\":{\"rrn\":\"804128789748\",\"upi_transaction_id\":\"29F5ABE862671C0F663C8E00A6BE559F\"},\"created_at\":1712567832,\"upi\":{\"vpa\":\"success@razorpay\"}}]}', 7, 1712567803425);

--
-- Triggers `payment2`
--
DELIMITER $$
CREATE TRIGGER `payment2_trigger` BEFORE INSERT ON `payment2` FOR EACH ROW BEGIN 
    IF NEW.pdata = '' OR NEW.o_id = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot insert row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `payment2_update_trigger` BEFORE UPDATE ON `payment2` FOR EACH ROW BEGIN 
    IF NEW.pdata = '' OR NEW.o_id = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot update row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `placeorder`
--

CREATE TABLE `placeorder` (
  `ounique_id` int(10) NOT NULL,
  `o_id` bigint(10) NOT NULL,
  `u_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`u_address`)),
  `uid` int(10) NOT NULL,
  `paymentid` text NOT NULL,
  `total_discounts` int(10) NOT NULL,
  `status` text NOT NULL,
  `date_of_delivery` text NOT NULL,
  `cancelReason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `placeorder`
--

INSERT INTO `placeorder` (`ounique_id`, `o_id`, `u_address`, `uid`, `paymentid`, `total_discounts`, `status`, `date_of_delivery`, `cancelReason`) VALUES
(133, 1712159634734, '{\"name\":\"rutvik\",\"mono\":\"7283962184\",\"pincode\":\"395010\",\"state\":\"Gujarat\",\"city\":\"Surat\",\"street\":\"203,shantiniketan soc.\",\"landmark\":\"punagam\",\"uid\":\"100\"}', 100, '0', 100, 'Confirmed', '1712764434734', ''),
(134, 1712159764243, '{\"name\":\"rutvik\",\"mono\":\"7283962184\",\"pincode\":\"395010\",\"state\":\"Gujarat\",\"city\":\"Surat\",\"street\":\"203,shantiniketan soc.\",\"landmark\":\"punagam\",\"uid\":\"100\"}', 100, '0', 200, 'Confirmed', '1712764564243', ''),
(135, 1712159970874, '{\"name\":\"rutvik\",\"mono\":\"7283962184\",\"pincode\":\"395010\",\"state\":\"Gujarat\",\"city\":\"Surat\",\"street\":\"203,shantiniketan soc.\",\"landmark\":\"punagam\",\"uid\":\"100\"}', 100, '0', 100, 'Confirmed', '1712764770874', ''),
(136, 1712160466625, '{\"name\":\"rutvik\",\"mono\":\"7283962184\",\"pincode\":\"395010\",\"state\":\"Gujarat\",\"city\":\"Surat\",\"street\":\"203,shantiniketan soc.\",\"landmark\":\"punagam\",\"uid\":\"100\"}', 100, '0', 100, 'Confirmed', '1712765266625', ''),
(137, 1712160620957, '{\"name\":\"rutvik\",\"mono\":\"7283962184\",\"pincode\":\"395010\",\"state\":\"Gujarat\",\"city\":\"Surat\",\"street\":\"203,shantiniketan soc.\",\"landmark\":\"punagam\",\"uid\":\"100\"}', 100, '0', 100, 'Confirmed', '1712765420957', ''),
(138, 1712558141673, '{\"name\":\"Hello\",\"mono\":\"4258369752\",\"pincode\":\"395006\",\"state\":\"Gujarat\",\"city\":\"Surat\",\"street\":\"Patel Nagar\",\"landmark\":\"Patel Nagar\",\"uid\":\"142\"}', 142, '1712558141673', 100, 'Deliver', '1712558912583', ''),
(139, 1712559668717, '{\"name\":\"Hello\",\"mono\":\"4258369752\",\"pincode\":\"395006\",\"state\":\"Gujarat\",\"city\":\"Surat\",\"street\":\"Patel Nagar\",\"landmark\":\"Patel Nagar\",\"uid\":\"142\"}', 142, '0', 100, 'Confirmed', '1713164468717', ''),
(140, 1712567774201, '{\"name\":\"rutvik\",\"mono\":\"7283962184\",\"pincode\":\"395010\",\"state\":\"Gujarat\",\"city\":\"Surat\",\"street\":\"203,shantiniketan soc.\",\"landmark\":\"punagam\",\"uid\":\"100\"}', 100, '0', 300, 'Deliver', '1712567793783', ''),
(141, 1712567803425, '{\"name\":\"rutvik\",\"mono\":\"7283962184\",\"pincode\":\"395010\",\"state\":\"Gujarat\",\"city\":\"Surat\",\"street\":\"203,shantiniketan soc.\",\"landmark\":\"punagam\",\"uid\":\"100\"}', 100, '1712567803425', 100, 'Confirmed', '1713172603425', '');

--
-- Triggers `placeorder`
--
DELIMITER $$
CREATE TRIGGER `placeorder_trigger` BEFORE INSERT ON `placeorder` FOR EACH ROW BEGIN 
    IF NEW.o_id = '' OR NEW.u_address = '' OR NEW.uid = '' OR NEW.paymentid = '' OR NEW.status = '' OR NEW.date_of_delivery = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot insert row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `placeorder_update_trigger` BEFORE UPDATE ON `placeorder` FOR EACH ROW BEGIN 
    IF NEW.o_id = '' OR NEW.u_address = '' OR NEW.uid = '' OR NEW.paymentid = '' OR NEW.status = '' OR NEW.date_of_delivery = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot update row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product_table`
--

CREATE TABLE `product_table` (
  `product_id` int(11) NOT NULL,
  `product_name` text NOT NULL,
  `product_title` text NOT NULL,
  `product_desc` text NOT NULL,
  `product_category` text NOT NULL,
  `product_price` text NOT NULL,
  `product_image` text NOT NULL,
  `product_mrp` int(10) NOT NULL,
  `product_stock` int(10) NOT NULL,
  `total_sell` int(10) NOT NULL,
  `product_brand` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product_table`
--

INSERT INTO `product_table` (`product_id`, `product_name`, `product_title`, `product_desc`, `product_category`, `product_price`, `product_image`, `product_mrp`, `product_stock`, `total_sell`, `product_brand`) VALUES
(11, 'SAMSUNG Galaxy S23 5G', 'SAMSUNG Galaxy S23 5G (8GB RAM, 256GB, Green)', '• Display: 6.1 inches (15.49 cm), Flat FHD+, 120 Hz Refresh Rate\n• Memory: 8GB RAM, 256GB ROM\n• Processor: Qualcomm Snapdragon 8 Gen 2, Octa-Core\n• Camera: 50MP + 10MP + 12MP Triple Rear & 12 MP Front Camera\n• Battery: 3900 mAh\n• USP: Fingerprint Sensor', 'Mobile', '78999', 'upload/5zf6c7a8.png', 999999, 10, 14, 'SAMSUNG'),
(12, 'Daikin Standard Series 0.8 Ton 3 Star Split AC', 'Daikin Standard Series 0.8 Ton 3 Star Split AC (Copper Condenser, PM 2.5 Filter, FTL28U)', '• 0.8 Ton, 3 Star Rating\n• Copper Condenser\n• 1 Year Comprehensive Warranty, 5 Years Compressor Warranty\n• For Rooms up to 90 sqft\n• Power Consumption: 709 Watts\n• Refrigerant: R32\n• Dust Filter, Self Diagnosis', 'AC', '36999', 'upload/dm3nwf6i.png', 37599, 7, 38, 'Daikin'),
(13, 'LG Single Door Refrigerator', 'LG 190 Litres 1 Star Direct Cool Single Door Refrigerator with Stabilizer Free Operation (GL-B199ORGB, Ruby Glow)', '• 190 Litres, 1 Star Rating\n• No. of Doors: 1\n• Ideal for 1-2 Family Size\n• Anti-Bacterial Gasket, Fast Ice Making Technology, Toughened Glass Shelves\n• 1 Year Warranty on Product, 10 Years Compressor Warranty', 'Refrigerator', '18999', 'upload/ftb8qixo.png', 19999, 3, 7, 'LG'),
(33, 'ASUS TUF Gaming Laptop', 'ASUS TUF Gaming F15 Intel Core i7 11th Gen Gaming Laptop (16GB, 512GB SSD, Windows 11 Home, 4GB Graphics, 15.6 inch 144 Hz Full HD IPS Display, NVIDIA GeForce RTX 3050 Ti, Graphite Black, 2.3 KG)', '• Display: 39.62 cms (15.6 inches), FHD Display\n• Memory: 16 GB DDR4 RAM, 512 GB SSD ROM\n• Processor: Intel Core i7-11800H, 11th Gen\n• OS: Windows 11 Home\n• Graphics: NVIDIA GeForce RTX 3050 Graphics\n• Warranty: 1 Year warranty', 'Laptop', '72999', 'upload/6vmhwabj.png', 97990, 6, 4, 'ASUS'),
(34, 'FIRE-BOLTT Wristphone', 'FIRE-BOLTT Dream Wi-Fi+4G SIM Android OS Wristphone (51.3mm HD Display, In-built GPS, Denim Dream Strap)', '• 5.13 cms (2.02 Inches) HD Display\n• Wi-Fi+4G nano SIM\n• Android OS\n• 2GB RAM, 16GB ROM\n• Cortex Quad Core CPU, Mali GPU\n• 800 mAh Battery\n• TWS connection via Bluetooth, Data Transfer, IP67 Water Resistant\n• 12 Months Warranty', 'Wearable', '9299', 'upload/bk4rhu41.png', 24999, 6, 4, 'FIRE-BOLTT'),
(35, 'ASUS Windows 11 Home Desktop', 'ASUS AiO A3 Series 21.45 Inch Full HD IPS Display Intel Core i3 12th Gen Windows 11 Home Desktop (8GB, 512GB SSD, Intel UHD)', '• Display: 54.48 cms (21.45 inches), FHD IPS\n• Memory: 8GB DDR4 RAM, 512GB SSD\n• Processor: Intel Core i3 12th Generation, 1.2 GHz, 6 Cores\n• OS: Windows 11 Home\n• Graphics: Intel UHD\n• Included Software: MS Office Home and Student 2021\n• Input Devices: Wireless Keyboard & Mouse\n• Speaker: In-Built, ?2 x 3 Watt\n• 1 Year Warranty', 'Computer', '59999', 'upload/iy1gx9ia.png', 63999, 7, 3, 'ASUS'),
(36, 'Apple iPad', 'Apple iPad 10th Generation Wi-Fi (10.9 Inch, 64GB, Blue, 2022 model)', '• 10.9 inches (27.69 cm) Liquid Retina True Tone Display\n• 64GB ROM\n• Apple A14 Bionic Chip, Hexa Core\n• iPadOS 17\n• Upto 10 Hours Battery Life\n• 12 MP Primary Camera, 12 MP Front Camera\n• Landscape Stereo Speakers, Dolby Atmos, Dolby Vision Support', 'Tablets', '37900', 'upload/jlpm50g1.png', 39900, 10, 0, 'Apple'),
(37, 'Canon Pixma Printer', 'Canon Pixma E4570 Wireless Color All-in-One Printer (Automatic 2 Sided Printing, 5073C018AA, Black)', '• Print | Scan | Copy | Fax\n• Ideal For: Home & Office\n• Inkjet Printer, Flat Bed Scanner\n• Color Print\n• Max Monthly Duty Cycle: 1,200 Pages\n• 12 Months Warranty', 'Printer', '8999', 'upload/lgu6y99d.png', 10999, 10, 10, 'Canon'),
(38, 'Nikon Camera', 'Nikon D7500 20.9MP DSLR Camera (18-140 mm Lens, 23.5 x 15.7 mm Sensor, Game Changing Resolution)', '• Effective Pixels: 20.9 MP\n• Video Resolution: 4K at 30 FPS\n• Sensor: CMOS Sensor, APS-C (23.5x15.7mm)\n• WiFi Available: Yes\n• Dimension & Weight: 720g, 135.5x72.5x104mm\n• 4K Ultra HD Video, 51 Point AF System, 180k-pixel RGB Sensor\n• 1 Year Product Warranty', 'Camera', '90999', 'upload/cql3c4nl.png', 94999, 9, 1, 'Nikon'),
(41, 'HP Windows 11 Home Desktop', 'HP 27-cb1345in 27 Inch Full HD IPS Display Intel Core i3 12th Gen Windows 11 Home Desktop (8GB, 512GB SSD, Intel UHD)', '• Display: 68.6 cms (27 inches), FHD IPS\n• Memory: 8GB DDR4 RAM, 512GB SSD\n• Processor: Intel Core i3 12th Generation, 1.2 GHz, 6 Cores\n• OS: Windows 11 Home\n• Graphics: Intel UHD, 6 Cores\n• Included Software: MS Office Home and Student 2021, McAfee LiveSafe\n• Input Devices: Wireless Keyboard & Mouse\n• Speaker: 2 Watt\n• 1 Year Warranty', 'Computer', '61500', 'upload/dxb3elmh.png', 62500, 10, 0, 'HP'),
(42, 'Croma Speaker', 'Croma 60 cm (24 inch) HD Ready LED TV with 16W Speaker', '• Display: HD Ready LED, 1366 x 768 pixels\n• Refresh Rate: 60 Hz\n• Connectivity: 2 HDMI | 2 USB\n• Sound: 16 W Speaker\n• USP: A+ Grade Panel\n• Warranty: 1 year Onsite Warranty', 'TV', '5900', 'upload/6k2a8fsf.png', 7000, 9, 1, 'Croma'),
(43, 'vivo Y28 5G', 'vivo Y28 5G (4GB RAM, 128GB, Glitter Aqua)', '• Display: 6.56 inches (16.66 cm), LCD, 90 Hz Refresh Rate\n• Memory: 4GB RAM, 128GB ROM, Memory Card upto 1TB\n• Processor: MediaTek Dimensity 6020, Octa Core, 2.2?GHz\n• Camera: 50?MP + 2?MP Dual Rear and 8?MP Front Camera\n• Battery: 5000?mAh\n• USP: Side-mounted Fingerprint Sensor, Capacitive Multi-touch Display', 'Mobile', '13999', 'upload/2mo86ofb.png', 14999, 7, 3, 'Vivo'),
(44, 'Nothing Mobile', 'Nothing Phone 2 5G (12GB RAM, 256GB, Dark Grey)', '• Display: 6.7 inches (17.02 cm), AMOLED, 120 Hz Refresh Rate\n• Memory: 12GB RAM, 256GB ROM\n• Processor: Snapdragon 8 Plus Gen 1, Octa Core, 3?GHz\n• Camera: 50?MP + 50 MP Dual Rear & 32?MP Front Camera\n• Battery: 4700?mAh with 45W Fast Charging\n• USP: In-display Fingerprint Sensor, Devised with Glyph Interface', 'Mobile', '40999', 'upload/kate6mhm.png', 54999, 5, 5, 'Nothing'),
(45, 'LLOYD AC', 'LLOYD 5 in 1 Convertible 1.25 Ton 3 Star Inverter Split AC with 4 way Swing (Copper Condenser, GLS15I3FWSEV)', '• 1.25 Ton Inverter Split AC, 3 Star Rating\n• Copper Condenser\n• 1 Year Comprehensive Warranty, 10 Years Compressor Warranty\n• For Rooms up to 150 sqft\n• Power Consumption: 854.42 kWh\n• Refrigerant: R32\n• 5 in 1 Convertible, Smart 4-way Swing', 'Ac', '29000', 'upload/fvoa5a0s.png', 31490, 0, 10, 'LLOYD');

--
-- Triggers `product_table`
--
DELIMITER $$
CREATE TRIGGER `product_table_trigger` BEFORE INSERT ON `product_table` FOR EACH ROW BEGIN 
    IF NEW.product_name = '' OR NEW.product_title = '' OR NEW.product_desc = '' OR NEW.product_category = '' OR NEW.product_price = '' OR NEW.product_image = '' OR NEW.product_mrp = '' OR NEW.product_stock = '' OR NEW.product_brand = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot insert row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `product_table_update_trigger` BEFORE UPDATE ON `product_table` FOR EACH ROW BEGIN
    IF NEW.product_name = '' OR NEW.product_title = '' OR NEW.product_desc = '' OR NEW.product_category = '' OR NEW.product_price = '' OR NEW.product_image = '' OR NEW.product_mrp = '' OR (NEW.product_stock = '' AND OLD.product_stock != '' AND NEW.total_sell = '' AND OLD.total_sell != '') OR NEW.product_brand = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot update row with blank value in columns';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `recent_view`
--

CREATE TABLE `recent_view` (
  `rid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `pid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recent_view`
--

INSERT INTO `recent_view` (`rid`, `uid`, `pid`) VALUES
(83, 100, 44),
(84, 100, 45),
(85, 100, 13),
(86, 100, 33),
(87, 100, 43),
(88, 100, 35),
(89, 142, 45),
(90, 100, 12);

--
-- Triggers `recent_view`
--
DELIMITER $$
CREATE TRIGGER `recent_view_trigger` BEFORE INSERT ON `recent_view` FOR EACH ROW BEGIN 
    IF NEW.uid = '' OR NEW.pid = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot insert row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `recent_view_update_trigger` BEFORE UPDATE ON `recent_view` FOR EACH ROW BEGIN 
    IF NEW.uid = '' OR NEW.pid = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot update row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `rid` int(10) NOT NULL,
  `pid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `rtitle` text NOT NULL,
  `rdes` text NOT NULL,
  `rimages` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `rating` double NOT NULL,
  `o_id` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`rid`, `pid`, `uid`, `rtitle`, `rdes`, `rimages`, `rating`, `o_id`) VALUES
(70, 45, 142, 'best', 'best', NULL, 5, 1712558141673),
(71, 44, 100, 'best', 'best', '[\"6613b64bdaa47.png\"]', 5, 1712567774201);

--
-- Triggers `review`
--
DELIMITER $$
CREATE TRIGGER `review_trigger` BEFORE INSERT ON `review` FOR EACH ROW BEGIN 
    IF NEW.pid = '' OR NEW.uid = '' OR NEW.rtitle = '' OR NEW.rdes = '' OR NEW.rating = '' OR NEW.o_id = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot insert row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `review_update_trigger` BEFORE UPDATE ON `review` FOR EACH ROW BEGIN 
    IF NEW.pid = '' OR NEW.uid = '' OR NEW.rtitle = '' OR NEW.rdes = '' OR NEW.rating = '' OR NEW.o_id = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot update row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `save_later`
--

CREATE TABLE `save_later` (
  `sid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `pid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `save_later`
--

INSERT INTO `save_later` (`sid`, `uid`, `pid`) VALUES
(85, 118, 34),
(86, 118, 13),
(93, 100, 12);

--
-- Triggers `save_later`
--
DELIMITER $$
CREATE TRIGGER `save_later_trigger` BEFORE INSERT ON `save_later` FOR EACH ROW BEGIN 
    IF NEW.uid = '' OR NEW.pid = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot insert row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `save_later_update_trigger` BEFORE UPDATE ON `save_later` FOR EACH ROW BEGIN 
    IF NEW.uid = '' OR NEW.pid = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot update row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ship`
--

CREATE TABLE `ship` (
  `id` int(10) NOT NULL,
  `tname` text NOT NULL,
  `tnumber` text NOT NULL,
  `tlink` text NOT NULL,
  `oid` bigint(10) NOT NULL,
  `ttime` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ship`
--

INSERT INTO `ship` (`id`, `tname`, `tnumber`, `tlink`, `oid`, `ttime`) VALUES
(18, 'jcjc', 'b bc', 'https://www.google.com', 1712558141673, '1712558907239'),
(19, 'current ', '123', 'https://Currie.com', 1712567774201, '1712567789013');

--
-- Triggers `ship`
--
DELIMITER $$
CREATE TRIGGER `ship_trigger` BEFORE INSERT ON `ship` FOR EACH ROW BEGIN 
    IF NEW.tname = '' OR NEW.tnumber = '' OR NEW.tlink = '' OR NEW.oid = '' OR NEW.ttime = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot insert row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ship_update_trigger` BEFORE UPDATE ON `ship` FOR EACH ROW BEGIN 
    IF NEW.tname = '' OR NEW.tnumber = '' OR NEW.tlink = '' OR NEW.oid = '' OR NEW.ttime = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot update row with blank value in columns'; 
    END IF; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_pro`
--

CREATE TABLE `user_pro` (
  `uid` int(20) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `uemail` varchar(30) NOT NULL,
  `upass` varchar(20) NOT NULL,
  `umono` varchar(20) NOT NULL,
  `uimage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_pro`
--

INSERT INTO `user_pro` (`uid`, `uname`, `uemail`, `upass`, `umono`, `uimage`) VALUES
(100, 'rutvik', 'rutvikpatel0q@gmail.com', '@@11Qazxsw', '7283962184', 'img/1000056595.jpg'),
(106, 'mahek', 'mahek@gmail.com', '@@11Mahek', '9966339966', NULL),
(109, 'Mahek Shobhasana', 'mahekshobhasana@yahoo.com', 'Mahek721@', '8849652719', NULL),
(118, 'ff', 'ff@gmail.com', '@@11Qazxsw', '9988774452', NULL),
(142, 'Hello', 'hello@gmail.com', 'Hello123@', '4258369752', 'img/download.jpg');

--
-- Triggers `user_pro`
--
DELIMITER $$
CREATE TRIGGER `user_pro_trigger` BEFORE INSERT ON `user_pro` FOR EACH ROW BEGIN
    IF NEW.uname = '' OR NEW.uemail = '' OR NEW.umono = '' OR NEW.upass = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot insert row with blank value in columns'; 
    ELSEIF NEW.uimage IS NOT NULL THEN
        IF NOT (NEW.uimage LIKE 'img/%' AND 
                (NEW.uimage LIKE '%.jpeg' OR NEW.uimage LIKE '%.jpg' OR NEW.uimage LIKE '%.png')) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Invalid image format or directory';
        END IF;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_pro_update_trigger` BEFORE UPDATE ON `user_pro` FOR EACH ROW BEGIN
    IF NEW.uname = '' OR NEW.uemail = '' OR NEW.umono = '' OR NEW.upass = '' THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Cannot insert row with blank value in columns'; 
    ELSEIF NEW.uimage IS NOT NULL THEN
        IF NOT (NEW.uimage LIKE 'img/%' AND 
                (NEW.uimage LIKE '%.jpeg' OR NEW.uimage LIKE '%.jpg' OR NEW.uimage LIKE '%.png')) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Invalid image format or directory';
        END IF;
    END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_uid` (`uid`);

--
-- Indexes for table `admin_pro`
--
ALTER TABLE `admin_pro`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_email` (`admin_email`) USING HASH;

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_table`
--
ALTER TABLE `cart_table`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_uid` (`current_user_id`),
  ADD KEY `cart_pid` (`product_id`);

--
-- Indexes for table `favorite_table`
--
ALTER TABLE `favorite_table`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `favorite_pid` (`pid`),
  ADD KEY `favorite_uid` (`uid`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_o_id` (`o_id`),
  ADD KEY `order_items_u_id` (`uid`),
  ADD KEY `order_items_p_id` (`p_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `payment_o_id` (`merchantTransactionId`);

--
-- Indexes for table `payment2`
--
ALTER TABLE `payment2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment2_o_id` (`o_id`);

--
-- Indexes for table `placeorder`
--
ALTER TABLE `placeorder`
  ADD PRIMARY KEY (`ounique_id`),
  ADD UNIQUE KEY `o_id` (`o_id`),
  ADD KEY `placeorder_u_id` (`uid`);

--
-- Indexes for table `product_table`
--
ALTER TABLE `product_table`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `recent_view`
--
ALTER TABLE `recent_view`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `recent_view_uid` (`uid`),
  ADD KEY `recent_view_pid` (`pid`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `review_oid` (`o_id`),
  ADD KEY `review_uid` (`uid`),
  ADD KEY `review_pid` (`pid`);

--
-- Indexes for table `save_later`
--
ALTER TABLE `save_later`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `save_later_pid` (`pid`),
  ADD KEY `save_later_uid` (`uid`);

--
-- Indexes for table `ship`
--
ALTER TABLE `ship`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ship_oid` (`oid`);

--
-- Indexes for table `user_pro`
--
ALTER TABLE `user_pro`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `admin_pro`
--
ALTER TABLE `admin_pro`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cart_table`
--
ALTER TABLE `cart_table`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=368;

--
-- AUTO_INCREMENT for table `favorite_table`
--
ALTER TABLE `favorite_table`
  MODIFY `fid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payment2`
--
ALTER TABLE `payment2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `placeorder`
--
ALTER TABLE `placeorder`
  MODIFY `ounique_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `product_table`
--
ALTER TABLE `product_table`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `recent_view`
--
ALTER TABLE `recent_view`
  MODIFY `rid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `rid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `save_later`
--
ALTER TABLE `save_later`
  MODIFY `sid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `ship`
--
ALTER TABLE `ship`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_pro`
--
ALTER TABLE `user_pro`
  MODIFY `uid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_uid` FOREIGN KEY (`uid`) REFERENCES `user_pro` (`uid`);

--
-- Constraints for table `cart_table`
--
ALTER TABLE `cart_table`
  ADD CONSTRAINT `cart_pid` FOREIGN KEY (`product_id`) REFERENCES `product_table` (`product_id`),
  ADD CONSTRAINT `cart_uid` FOREIGN KEY (`current_user_id`) REFERENCES `user_pro` (`uid`);

--
-- Constraints for table `favorite_table`
--
ALTER TABLE `favorite_table`
  ADD CONSTRAINT `favorite_pid` FOREIGN KEY (`pid`) REFERENCES `product_table` (`product_id`),
  ADD CONSTRAINT `favorite_uid` FOREIGN KEY (`uid`) REFERENCES `user_pro` (`uid`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_o_id` FOREIGN KEY (`o_id`) REFERENCES `placeorder` (`o_id`),
  ADD CONSTRAINT `order_items_p_id` FOREIGN KEY (`p_id`) REFERENCES `product_table` (`product_id`),
  ADD CONSTRAINT `order_items_u_id` FOREIGN KEY (`uid`) REFERENCES `user_pro` (`uid`);

--
-- Constraints for table `payment2`
--
ALTER TABLE `payment2`
  ADD CONSTRAINT `payment2_o_id` FOREIGN KEY (`o_id`) REFERENCES `placeorder` (`o_id`);

--
-- Constraints for table `placeorder`
--
ALTER TABLE `placeorder`
  ADD CONSTRAINT `placeorder_u_id` FOREIGN KEY (`uid`) REFERENCES `user_pro` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recent_view`
--
ALTER TABLE `recent_view`
  ADD CONSTRAINT `recent_view_pid` FOREIGN KEY (`pid`) REFERENCES `product_table` (`product_id`),
  ADD CONSTRAINT `recent_view_uid` FOREIGN KEY (`uid`) REFERENCES `user_pro` (`uid`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_oid` FOREIGN KEY (`o_id`) REFERENCES `placeorder` (`o_id`),
  ADD CONSTRAINT `review_pid` FOREIGN KEY (`pid`) REFERENCES `product_table` (`product_id`),
  ADD CONSTRAINT `review_uid` FOREIGN KEY (`uid`) REFERENCES `user_pro` (`uid`);

--
-- Constraints for table `save_later`
--
ALTER TABLE `save_later`
  ADD CONSTRAINT `save_later_pid` FOREIGN KEY (`pid`) REFERENCES `product_table` (`product_id`),
  ADD CONSTRAINT `save_later_uid` FOREIGN KEY (`uid`) REFERENCES `user_pro` (`uid`);

--
-- Constraints for table `ship`
--
ALTER TABLE `ship`
  ADD CONSTRAINT `ship_oid` FOREIGN KEY (`oid`) REFERENCES `placeorder` (`o_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
