-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th6 07, 2024 lúc 04:55 PM
-- Phiên bản máy phục vụ: 8.0.36
-- Phiên bản PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `cakeshopmanager`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `CART_ID` int NOT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `PRODUCT_ID` int DEFAULT NULL,
  `AMOUNT` int DEFAULT NULL,
  `PRICE` int DEFAULT NULL,
  `TOTAL_PRICE` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`CART_ID`, `USERNAME`, `PRODUCT_ID`, `AMOUNT`, `PRICE`, `TOTAL_PRICE`) VALUES
(41, 'lehoan2108', 13, 5, 40000, 200000),
(42, 'lehoan2108', 17, 4, 70000, 280000),
(58, 'hoancong', 13, 5, 40000, 200000),
(59, 'hoancong', 16, 1, 210000, 210000),
(60, 'hoancong', 17, 5, 70000, 350000),
(61, 'hoancong', 19, 5, 35000, 175000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `CATE_ID` int NOT NULL,
  `IMAGE` text,
  `NAME` text,
  `DESCRIPTION` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`CATE_ID`, `IMAGE`, `NAME`, `DESCRIPTION`) VALUES
(27, 'https://cdn-icons-png.flaticon.com/512/3585/3585596.png', 'Not Found', 'Not Found'),
(29, 'https://images.pexels.com/photos/1055272/pexels-photo-1055272.jpeg?auto=compress&cs=tinysrgb&w=600', 'Bánh kem', 'Bánh kem đa dạng với các loại hương vị tinh tế và thiết kế độc đáo. Tận hưởng sự hòa quyện của socola đắng, kem vani mịn và những lớp bánh mềm mịn, đem lại trải nghiệm thú vị cho mọi dịp.'),
(30, 'https://images.pexels.com/photos/302468/pexels-photo-302468.jpeg?auto=compress&cs=tinysrgb&w=600', 'Điểm tâm', 'Điểm Tâm đa dạng và tươi ngon, từ món ăn truyền thống đến sự kết hợp sáng tạo của ẩm thực quốc tế. Thưởng thức bữa sáng phong phú, bổ dưỡng để bắt đầu ngày mới.'),
(32, 'https://images.pexels.com/photos/1702373/pexels-photo-1702373.jpeg?auto=compress&cs=tinysrgb&w=600', 'Bánh sanh nhật', 'Bánh sinh nhật là biểu tượng của niềm vui và sự kỷ niệm. Với hương vị đa dạng và thiết kế tinh tế, mỗi chiếc bánh là điểm nhấn hoàn hảo cho bữa tiệc, tạo nên những khoảnh khắc đáng nhớ cho người yêu thưởng thức.'),
(33, 'https://images.pexels.com/photos/708587/pexels-photo-708587.jpeg?auto=compress&cs=tinysrgb&w=600', 'Pizza', 'Bánh Pizza - hương vị đa dạng từ những lớp nước sốt cà chua thơm phức đến phô mai béo ngậy, phủ trên lớp bột mềm mịn và những loại nguyên liệu tươi ngon. Một tác phẩm nghệ thuật ẩm thực Ý độc đáo, hấp dẫn mọi vị giác.'),
(34, 'https://images.pexels.com/photos/1199957/pexels-photo-1199957.jpeg?auto=compress&cs=tinysrgb&w=600', 'Burger và Sandwich', 'Burger và Sandwich - sự hòa quyện giữa lớp bánh mềm mịn, thịt thơm ngon, rau sống tươi mát và các loại sốt độc đáo. Tận hưởng hương vị độc đáo và cảm nhận sự ngon miệng trong từng miếng, một trải nghiệm ẩm thực đầy sáng tạo và bổ dưỡng'),
(35, 'https://images.pexels.com/photos/4109194/pexels-photo-4109194.jpeg?auto=compress&cs=tinysrgb&w=600', 'Đồ uống', 'Đồ uống - một thế giới phong phú của hương vị và trải nghiệm tuyệt vời. Tận hưởng sự hòa quyện của cà phê thơm, trà thảo mộc tinh tế, và các loại nước ép tươi ngon. Mỗi giọt là một chuyến phiêu lưu mới vào thế giới của hương vị.');

--
-- Bẫy `category`
--
DELIMITER $$
CREATE TRIGGER `after_delete_category` BEFORE DELETE ON `category` FOR EACH ROW BEGIN
    UPDATE PRODUCT
    SET CATE_ID = 27
    WHERE CATE_ID = OLD.CATE_ID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetail`
--

CREATE TABLE `orderdetail` (
  `ORDER_ID` int NOT NULL,
  `PRODUCT_ID` int NOT NULL,
  `QUANTITY` int DEFAULT NULL,
  `PRICE` int DEFAULT NULL,
  `DISCOUNT` int DEFAULT NULL,
  `TOTAL_PRICE` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `orderdetail`
--

INSERT INTO `orderdetail` (`ORDER_ID`, `PRODUCT_ID`, `QUANTITY`, `PRICE`, `DISCOUNT`, `TOTAL_PRICE`) VALUES
(13, 21, 1, 44000, 4840, 44000),
(13, 28, 1, 20000, 0, 20000),
(13, 55, 1, 156000, 9360, 156000),
(14, 20, 2, 56000, 7840, 112000),
(15, 52, 1, 205000, 0, 205000),
(15, 72, 6, 399000, 143640, 2394000),
(16, 16, 1, 210000, 10500, 210000),
(16, 17, 10, 70000, 42000, 700000),
(17, 18, 1, 33000, 2310, 33000),
(18, 16, 1, 210000, 10500, 210000),
(18, 19, 6, 35000, 14700, 210000),
(19, 13, 1, 40000, 1200, 40000),
(19, 30, 1, 30000, 600, 30000),
(20, 13, 1, 40000, 1200, 40000),
(21, 16, 1, 210000, 10500, 210000),
(22, 13, 5, 40000, 6000, 200000),
(22, 16, 1, 210000, 10500, 210000),
(23, 16, 2, 210000, 21000, 420000),
(23, 64, 3, 225000, 0, 225000),
(24, 72, 2, 399000, 47880, 399000),
(25, 13, 4, 40000, 4800, 40000),
(25, 19, 3, 35000, 7350, 105000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `ORDER_ID` int NOT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `ORDER_DATE` date DEFAULT NULL,
  `TOTAL_PRICE` int DEFAULT NULL,
  `PAYMENT_STATUS` text,
  `DELIVERY_STATUS` text,
  `DELIVERYINFO` varchar(255) DEFAULT 'DEFAULT',
  `NOTES` varchar(255) DEFAULT 'Không có ghi chú.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`ORDER_ID`, `USERNAME`, `ORDER_DATE`, `TOTAL_PRICE`, `PAYMENT_STATUS`, `DELIVERY_STATUS`, `DELIVERYINFO`, `NOTES`) VALUES
(13, 'conghoan1212', '2024-04-12', 205800, 'Đã thanh toán', 'Chờ giao hàng', 'DEFAULT', 'Không có ghi chú.'),
(14, 'vchien123', '2024-04-13', 104160, 'Đã thanh toán', 'Chờ giao hàng', 'DEFAULT', 'Không có ghi chú.'),
(15, 'vchien123', '2024-04-13', 2455360, 'Đã thanh toán', 'Chờ giao hàng', 'DEFAULT', 'Không có ghi chú.'),
(16, 'vchien123', '2024-04-13', 857500, 'Đã thanh toán', 'Đang duyệt đơn', 'DEFAULT', 'Không có ghi chú.'),
(17, 'conghoan1212', '2024-04-16', 30690, 'Chưa thanh toán', 'Chờ giao hàng', 'DEFAULT', 'Không có ghi chú.'),
(18, 'conghoan1212', '2024-04-17', 394800, 'Đã thanh toán', 'Đang duyệt đơn', 'DEFAULT', 'Không có ghi chú.'),
(19, 'lehoan2108', '2024-04-19', 68200, 'Chưa thanh toán', 'Đang duyệt đơn', 'DEFAULT', 'Không có ghi chú.'),
(20, 'conghoan1212', '2024-04-24', 38800, 'Đã thanh toán', 'Chờ giao hàng', 'DEFAULT', 'Không có ghi chú.'),
(21, 'conghoan1212', '2024-05-26', 199500, 'Đã thanh toán', 'Chờ giao hàng', '0369656502, TP. Sài Gòn', 'dsfdsfdsfds'),
(22, 'conghoan1212', '2024-05-27', 393500, 'Đã thanh toán', 'Đang duyệt đơn', '0111111111, TP. Sài Gòn', 'giao nhanh\r\n'),
(23, 'viduvidu123', '2024-05-28', 624000, 'Đã thanh toán', 'Đang duyệt đơn', '0123456789, Tân PHú TP HCM', 'giao sớm'),
(24, 'hoancong', '2024-05-28', 351120, 'Đã thanh toán', 'Chờ giao hàng', '0123456789, Sài Gòn', 'Giao sớm giúp mình'),
(25, 'hoancong', '2024-05-28', 132850, 'Đã thanh toán', 'Chờ giao hàng', '0123456789, Phú Yên', 'Giao hàng sớm giúp mình');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `PRODUCT_ID` int NOT NULL,
  `IMAGE` text,
  `PRO_NAME` text,
  `PRICE` int DEFAULT NULL,
  `DESCRIP` text,
  `CATE_ID` int DEFAULT NULL,
  `EVALUATE` int DEFAULT NULL,
  `DISCOUNT` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`PRODUCT_ID`, `IMAGE`, `PRO_NAME`, `PRICE`, `DESCRIP`, `CATE_ID`, `EVALUATE`, `DISCOUNT`) VALUES
(13, 'https://images.pexels.com/photos/140831/pexels-photo-140831.jpeg?auto=compress&cs=tinysrgb&w=600', 'Đường Phủ Caramel Crisp', 40000, 'Đường Phủ Caramel Crisp là sự kết hợp tinh tế giữa kem mịn và lớp bánh nhẹ, đa dạng về hương vị và thiết kế. Hòa quyện giữa sự ngọt ngào của socola, hương thơm của trái cây và sự bổ dưỡng từ hạt và ngũ cốc. Mỗi miếng bánh kem là một tác phẩm nghệ thuật ẩm thực, mang lại niềm vui và hạnh phúc cho mọi dịp đặc biệt và cuộc sống hàng ngày.', 29, 0, 3),
(15, 'https://cdn-icons-png.flaticon.com/512/3585/3585596.png', 'Not found', 1000, 'Not found', 27, 0, 0),
(16, 'https://images.pexels.com/photos/291528/pexels-photo-291528.jpeg?auto=compress&cs=tinysrgb&w=600', 'Nấm Meringue Mango', 210000, 'Nấm Meringue Mango là sự kết hợp tinh tế giữa kem mịn và lớp bánh nhẹ, đa dạng về hương vị và thiết kế. Hòa quyện giữa sự ngọt ngào của socola, hương thơm của trái cây và sự bổ dưỡng từ hạt và ngũ cốc. Mỗi miếng bánh kem là một tác phẩm nghệ thuật ẩm thực, mang lại niềm vui và hạnh phúc cho mọi dịp đặc biệt và cuộc sống hàng ngày.', 29, 0, 5),
(17, 'https://images.pexels.com/photos/2680603/pexels-photo-2680603.jpeg?auto=compress&cs=tinysrgb&w=600', 'Socola Truffle Tiramisu', 70000, 'Socola Truffle Tiramisu là sự kết hợp tinh tế giữa kem mịn và lớp bánh nhẹ, đa dạng về hương vị và thiết kế. Hòa quyện giữa sự ngọt ngào của socola, hương thơm của trái cây và sự bổ dưỡng từ hạt và ngũ cốc. Mỗi miếng bánh kem là một tác phẩm nghệ thuật ẩm thực, mang lại niềm vui và hạnh phúc cho mọi dịp đặc biệt và cuộc sống hàng ngày.', 29, 0, 6),
(18, 'https://images.pexels.com/photos/827516/pexels-photo-827516.jpeg?auto=compress&cs=tinysrgb&w=600', 'Kem Chuối Dừa Trái Dừa', 33000, 'Kem Chuối Dừa Trái Dừa là sự kết hợp tinh tế giữa kem mịn và lớp bánh nhẹ, đa dạng về hương vị và thiết kế. Hòa quyện giữa sự ngọt ngào của socola, hương thơm của trái cây và sự bổ dưỡng từ hạt và ngũ cốc. Mỗi miếng bánh kem là một tác phẩm nghệ thuật ẩm thực, mang lại niềm vui và hạnh phúc cho mọi dịp đặc biệt và cuộc sống hàng ngày.', 29, 0, 7),
(19, 'https://images.pexels.com/photos/934729/pexels-photo-934729.jpeg?auto=compress&cs=tinysrgb&w=600', 'Vị Chanh Dây Tươi Mát', 35000, 'Vị Chanh Dây Tươi Mát là sự kết hợp tinh tế giữa kem mịn và lớp bánh nhẹ, đa dạng về hương vị và thiết kế. Hòa quyện giữa sự ngọt ngào của socola, hương thơm của trái cây và sự bổ dưỡng từ hạt và ngũ cốc. Mỗi miếng bánh kem là một tác phẩm nghệ thuật ẩm thực, mang lại niềm vui và hạnh phúc cho mọi dịp đặc biệt và cuộc sống hàng ngày.', 29, 0, 7),
(20, 'https://images.pexels.com/photos/1998632/pexels-photo-1998632.jpeg?auto=compress&cs=tinysrgb&w=600', 'Dâu Tây Bơ Sữa', 56000, 'Dâu Tây Bơ Sữa là sự kết hợp tinh tế giữa kem mịn và lớp bánh nhẹ, đa dạng về hương vị và thiết kế. Hòa quyện giữa sự ngọt ngào của socola, hương thơm của trái cây và sự bổ dưỡng từ hạt và ngũ cốc. Mỗi miếng bánh kem là một tác phẩm nghệ thuật ẩm thực, mang lại niềm vui và hạnh phúc cho mọi dịp đặc biệt và cuộc sống hàng ngày.', 29, 0, 7),
(21, 'https://images.pexels.com/photos/1366710/pexels-photo-1366710.jpeg?auto=compress&cs=tinysrgb&w=600', 'Bánh Táo Caramel Crunch', 44000, 'Bánh Táo Caramel Crunch là sự kết hợp tinh tế giữa kem mịn và lớp bánh nhẹ, đa dạng về hương vị và thiết kế. Hòa quyện giữa sự ngọt ngào của socola, hương thơm của trái cây và sự bổ dưỡng từ hạt và ngũ cốc. Mỗi miếng bánh kem là một tác phẩm nghệ thuật ẩm thực, mang lại niềm vui và hạnh phúc cho mọi dịp đặc biệt và cuộc sống hàng ngày.', 29, 0, 11),
(22, 'https://images.pexels.com/photos/1543800/pexels-photo-1543800.jpeg?auto=compress&cs=tinysrgb&w=600', 'Hoa Hồng Raspberry Ripple', 120000, 'Hoa Hồng Raspberry Ripple là sự kết hợp tinh tế giữa kem mịn và lớp bánh nhẹ, đa dạng về hương vị và thiết kế. Hòa quyện giữa sự ngọt ngào của socola, hương thơm của trái cây và sự bổ dưỡng từ hạt và ngũ cốc. Mỗi miếng bánh kem là một tác phẩm nghệ thuật ẩm thực, mang lại niềm vui và hạnh phúc cho mọi dịp đặc biệt và cuộc sống hàng ngày.', 29, 0, 0),
(23, 'https://images.pexels.com/photos/1247670/pexels-photo-1247670.jpeg?auto=compress&cs=tinysrgb&w=600', 'Hạnh Phúc Cốt Dừa Lúa Mạch', 122000, 'Hạnh Phúc Cốt Dừa Lúa Mạch là sự kết hợp tinh tế giữa kem mịn và lớp bánh nhẹ, đa dạng về hương vị và thiết kế. Hòa quyện giữa sự ngọt ngào của socola, hương thơm của trái cây và sự bổ dưỡng từ hạt và ngũ cốc. Mỗi miếng bánh kem là một tác phẩm nghệ thuật ẩm thực, mang lại niềm vui và hạnh phúc cho mọi dịp đặc biệt và cuộc sống hàng ngày.', 29, 0, 0),
(24, 'https://images.pexels.com/photos/3026803/pexels-photo-3026803.jpeg?auto=compress&cs=tinysrgb&w=600', 'Bánh Mật Ong Lavender Lemon', 99000, 'Hạnh Phúc Cốt Dừa Lúa Mạch là sự kết hợp tinh tế giữa kem mịn và lớp bánh nhẹ, đa dạng về hương vị và thiết kế. Hòa quyện giữa sự ngọt ngào của socola, hương thơm của trái cây và sự bổ dưỡng từ hạt và ngũ cốc. Mỗi miếng bánh kem là một tác phẩm nghệ thuật ẩm thực, mang lại niềm vui và hạnh phúc cho mọi dịp đặc biệt và cuộc sống hàng ngày.', 29, 0, 4),
(25, 'https://images.pexels.com/photos/221068/pexels-photo-221068.jpeg?auto=compress&cs=tinysrgb&w=600', 'Hạnh Nhân Pistachio Panna Cotta', 87000, 'Hạnh Nhân Pistachio Panna Cotta là sự kết hợp tinh tế giữa kem mịn và lớp bánh nhẹ, đa dạng về hương vị và thiết kế. Hòa quyện giữa sự ngọt ngào của socola, hương thơm của trái cây và sự bổ dưỡng từ hạt và ngũ cốc. Mỗi miếng bánh kem là một tác phẩm nghệ thuật ẩm thực, mang lại niềm vui và hạnh phúc cho mọi dịp đặc biệt và cuộc sống hàng ngày.', 29, 0, 0),
(26, 'https://images.pexels.com/photos/1346218/pexels-photo-1346218.jpeg?auto=compress&cs=tinysrgb&w=600', 'Ngọc Trai Matcha Mochi', 70000, 'Ngọc Trai Matcha Mochi là sự kết hợp tinh tế giữa kem mịn và lớp bánh nhẹ, đa dạng về hương vị và thiết kế. Hòa quyện giữa sự ngọt ngào của socola, hương thơm của trái cây và sự bổ dưỡng từ hạt và ngũ cốc. Mỗi miếng bánh kem là một tác phẩm nghệ thuật ẩm thực, mang lại niềm vui và hạnh phúc cho mọi dịp đặc biệt và cuộc sống hàng ngày.', 29, 0, 2),
(27, 'https://images.pexels.com/photos/1907223/pexels-photo-1907223.jpeg?auto=compress&cs=tinysrgb&w=600', 'Hương Vị Choco Mint Chip', 66000, 'Hương Vị Choco Mint Chip là sự kết hợp tinh tế giữa kem mịn và lớp bánh nhẹ, đa dạng về hương vị và thiết kế. Hòa quyện giữa sự ngọt ngào của socola, hương thơm của trái cây và sự bổ dưỡng từ hạt và ngũ cốc. Mỗi miếng bánh kem là một tác phẩm nghệ thuật ẩm thực, mang lại niềm vui và hạnh phúc cho mọi dịp đặc biệt và cuộc sống hàng ngày.', 29, 0, 2),
(28, 'https://images.pexels.com/photos/4959715/pexels-photo-4959715.jpeg?auto=compress&cs=tinysrgb&w=600', 'Kem Vanila Almond Swirl', 20000, 'Kem Vanila Almond Swirl là sự kết hợp tinh tế giữa kem mịn và lớp bánh nhẹ, đa dạng về hương vị và thiết kế. Hòa quyện giữa sự ngọt ngào của socola, hương thơm của trái cây và sự bổ dưỡng từ hạt và ngũ cốc. Mỗi miếng bánh kem là một tác phẩm nghệ thuật ẩm thực, mang lại niềm vui và hạnh phúc cho mọi dịp đặc biệt và cuộc sống hàng ngày.', 29, 0, 0),
(30, 'https://images.pexels.com/photos/103124/pexels-photo-103124.jpeg?auto=compress&cs=tinysrgb&w=600', 'Rộn Ràng Bánh Mỳ Đặc Biệt', 30000, '\"Rộn Ràng Bánh Mỳ Đặc Biệt\" là một sự kết hợp hoàn hảo giữa vị ngon của bánh mỳ tươi mềm mịn và hương vị đa dạng từ các loại nhân độc đáo. Mỗi miếng bánh mỳ là một cuộc phiêu lưu đầy sáng tạo, từ những lớp thịt thơm ngon đến sự tươi mát của rau sống và sự kích thích từ các loại sốt đặc biệt. Rộn Ràng Bánh Mỳ Đặc Biệt không chỉ là một bữa sáng ngon lành mà còn là trải nghiệm ẩm thực độc đáo, làm hài lòng mọi thực khách.', 30, 0, 2),
(31, 'https://images.pexels.com/photos/4021887/pexels-photo-4021887.jpeg?auto=compress&cs=tinysrgb&w=600', 'Sảng Khoái Món Nước Trái Cây', 30000, '\"Sảng Khoái Món Nước Trái Cây\" là một phần của thiên đường hương vị, nơi bạn có thể tận hưởng sự tươi mát và sức sống từ các loại trái cây tươi ngon nhất. Hương thơm của cam, dâu, và xoài kết hợp hoàn hảo trong một ly nước trái cây sảng khoái, mang lại cảm giác tươi mới và đầy năng lượng. Mỗi ngụm là một trải nghiệm hòa quyện giữa hương vị và sức khỏe, đem đến sự hài lòng cho mọi thực khách.', 30, 0, 2),
(32, 'https://images.pexels.com/photos/2662875/pexels-photo-2662875.jpeg?auto=compress&cs=tinysrgb&w=600', 'Combo Bánh Mì Sốt Trứng Ngon', 35000, '\"Combo Bánh Mì Sốt Trứng Ngon\" là một sự kết hợp hoàn hảo giữa vị ngon của bánh mỳ tươi mềm mịn và hương vị đa dạng từ các loại nhân độc đáo. Mỗi miếng bánh mỳ là một cuộc phiêu lưu đầy sáng tạo, từ những lớp thịt thơm ngon đến sự tươi mát của rau sống và sự kích thích từ các loại sốt đặc biệt. Rộn Ràng Bánh Mỳ Đặc Biệt không chỉ là một bữa sáng ngon lành mà còn là trải nghiệm ẩm thực độc đáo, làm hài lòng mọi thực khách.', 30, 0, 2),
(33, 'https://images.pexels.com/photos/101533/pexels-photo-101533.jpeg?auto=compress&cs=tinysrgb&w=600', 'Điểm Tâm Hấp Dẫn với Pancake', 38000, '\"Điểm Tâm Hấp Dẫn với Pancake\" là một sự kết hợp hoàn hảo giữa vị ngon của bánh mỳ tươi mềm mịn và hương vị đa dạng từ các loại nhân độc đáo. Mỗi miếng bánh mỳ là một cuộc phiêu lưu đầy sáng tạo, từ những lớp thịt thơm ngon đến sự tươi mát của rau sống và sự kích thích từ các loại sốt đặc biệt. Rộn Ràng Bánh Mỳ Đặc Biệt không chỉ là một bữa sáng ngon lành mà còn là trải nghiệm ẩm thực độc đáo, làm hài lòng mọi thực khách.', 30, 0, 2),
(34, 'https://images.pexels.com/photos/2105104/pexels-photo-2105104.jpeg?auto=compress&cs=tinysrgb&w=600', 'Phô Mai và Mứt - Điểm Tâm Huyền Thoại', 45000, '\"Phô Mai và Mứt - Điểm Tâm Huyền Thoại\" là một sự kết hợp hoàn hảo giữa vị ngon của bánh mỳ tươi mềm mịn và hương vị đa dạng từ các loại nhân độc đáo. Mỗi miếng bánh mỳ là một cuộc phiêu lưu đầy sáng tạo, từ những lớp thịt thơm ngon đến sự tươi mát của rau sống và sự kích thích từ các loại sốt đặc biệt. Rộn Ràng Bánh Mỳ Đặc Biệt không chỉ là một bữa sáng ngon lành mà còn là trải nghiệm ẩm thực độc đáo, làm hài lòng mọi thực khách.', 30, 0, 5),
(35, 'https://images.pexels.com/photos/916925/pexels-photo-916925.jpeg?auto=compress&cs=tinysrgb&w=600', 'Bữa Sáng Mỹ Với Waffles Socola', 50000, '\"Bữa Sáng Mỹ Với Waffles Socola\" là một sự kết hợp hoàn hảo giữa vị ngon của bánh mỳ tươi mềm mịn và hương vị đa dạng từ các loại nhân độc đáo. Mỗi miếng bánh mỳ là một cuộc phiêu lưu đầy sáng tạo, từ những lớp thịt thơm ngon đến sự tươi mát của rau sống và sự kích thích từ các loại sốt đặc biệt. Rộn Ràng Bánh Mỳ Đặc Biệt không chỉ là một bữa sáng ngon lành mà còn là trải nghiệm ẩm thực độc đáo, làm hài lòng mọi thực khách.', 30, 0, 5),
(36, 'https://images.pexels.com/photos/2351275/pexels-photo-2351275.jpeg?auto=compress&cs=tinysrgb&w=600', 'Combo Bánh Quy và Trà Sữa Matcha', 41000, '\"Combo Bánh Quy và Trà Sữa Matcha\" là một sự kết hợp hoàn hảo giữa vị ngon của bánh mỳ tươi mềm mịn và hương vị đa dạng từ các loại nhân độc đáo. Mỗi miếng bánh mỳ là một cuộc phiêu lưu đầy sáng tạo, từ những lớp thịt thơm ngon đến sự tươi mát của rau sống và sự kích thích từ các loại sốt đặc biệt. Rộn Ràng Bánh Mỳ Đặc Biệt không chỉ là một bữa sáng ngon lành mà còn là trải nghiệm ẩm thực độc đáo, làm hài lòng mọi thực khách.', 30, 0, 0),
(37, 'https://images.pexels.com/photos/2635307/pexels-photo-2635307.jpeg?auto=compress&cs=tinysrgb&w=600', 'Bữa Sáng Ăn Chay Với Tofu Scramble', 34000, '\"Bữa Sáng Ăn Chay Với Tofu Scramble\" là một sự kết hợp hoàn hảo giữa vị ngon của bánh mỳ tươi mềm mịn và hương vị đa dạng từ các loại nhân độc đáo. Mỗi miếng bánh mỳ là một cuộc phiêu lưu đầy sáng tạo, từ những lớp thịt thơm ngon đến sự tươi mát của rau sống và sự kích thích từ các loại sốt đặc biệt. Rộn Ràng Bánh Mỳ Đặc Biệt không chỉ là một bữa sáng ngon lành mà còn là trải nghiệm ẩm thực độc đáo, làm hài lòng mọi thực khách.', 30, 0, 0),
(38, 'https://images.pexels.com/photos/793785/pexels-photo-793785.jpeg?auto=compress&cs=tinysrgb&w=600', 'Bánh Mì Kẹp Trứng Sốt Cà Chua', 30000, '\"Bánh Mì Kẹp Trứng Sốt Cà Chua\" là một sự kết hợp hoàn hảo giữa vị ngon của bánh mỳ tươi mềm mịn và hương vị đa dạng từ các loại nhân độc đáo. Mỗi miếng bánh mỳ là một cuộc phiêu lưu đầy sáng tạo, từ những lớp thịt thơm ngon đến sự tươi mát của rau sống và sự kích thích từ các loại sốt đặc biệt. Rộn Ràng Bánh Mỳ Đặc Biệt không chỉ là một bữa sáng ngon lành mà còn là trải nghiệm ẩm thực độc đáo, làm hài lòng mọi thực khách.', 30, 0, 0),
(39, 'https://images.pexels.com/photos/253419/pexels-photo-253419.jpeg?auto=compress&cs=tinysrgb&w=600', 'Phong Cách Hàn Quốc - Bữa Sáng Kimchi', 36000, '\"Phong Cách Hàn Quốc - Bữa Sáng Kimchi\" là một sự kết hợp hoàn hảo giữa vị ngon của bánh mỳ tươi mềm mịn và hương vị đa dạng từ các loại nhân độc đáo. Mỗi miếng bánh mỳ là một cuộc phiêu lưu đầy sáng tạo, từ những lớp thịt thơm ngon đến sự tươi mát của rau sống và sự kích thích từ các loại sốt đặc biệt. Rộn Ràng Bánh Mỳ Đặc Biệt không chỉ là một bữa sáng ngon lành mà còn là trải nghiệm ẩm thực độc đáo, làm hài lòng mọi thực khách.', 30, 0, 0),
(40, 'https://images.pexels.com/photos/2433868/pexels-photo-2433868.jpeg?auto=compress&cs=tinysrgb&w=600', 'Bữa Sáng Hoa Mỹ - Bagel và Sốt Lox', 46000, '\"Bữa Sáng Hoa Mỹ - Bagel và Sốt Lox\" là một sự kết hợp hoàn hảo giữa vị ngon của bánh mỳ tươi mềm mịn và hương vị đa dạng từ các loại nhân độc đáo. Mỗi miếng bánh mỳ là một cuộc phiêu lưu đầy sáng tạo, từ những lớp thịt thơm ngon đến sự tươi mát của rau sống và sự kích thích từ các loại sốt đặc biệt. Rộn Ràng Bánh Mỳ Đặc Biệt không chỉ là một bữa sáng ngon lành mà còn là trải nghiệm ẩm thực độc đáo, làm hài lòng mọi thực khách.', 30, 0, 0),
(41, 'https://images.pexels.com/photos/5591663/pexels-photo-5591663.jpeg?auto=compress&cs=tinysrgb&w=600', 'Combo Bánh Mì Gà Và Cà Phê Nóng', 43000, '\"Bữa Sáng Hoa Mỹ - Bagel và Sốt Lox\" là một sự kết hợp hoàn hảo giữa vị ngon của bánh mỳ tươi mềm mịn và hương vị đa dạng từ các loại nhân độc đáo. Mỗi miếng bánh mỳ là một cuộc phiêu lưu đầy sáng tạo, từ những lớp thịt thơm ngon đến sự tươi mát của rau sống và sự kích thích từ các loại sốt đặc biệt. Rộn Ràng Bánh Mỳ Đặc Biệt không chỉ là một bữa sáng ngon lành mà còn là trải nghiệm ẩm thực độc đáo, làm hài lòng mọi thực khách.', 30, 0, 0),
(42, 'https://images.pexels.com/photos/2205270/pexels-photo-2205270.jpeg?auto=compress&cs=tinysrgb&w=600', 'Bữa Sáng Đầy Energi - Acai Bowl', 47000, '\"Bữa Sáng Đầy Energi - Acai Bowl\" là một sự kết hợp hoàn hảo giữa vị ngon của bánh mỳ tươi mềm mịn và hương vị đa dạng từ các loại nhân độc đáo. Mỗi miếng bánh mỳ là một cuộc phiêu lưu đầy sáng tạo, từ những lớp thịt thơm ngon đến sự tươi mát của rau sống và sự kích thích từ các loại sốt đặc biệt. Rộn Ràng Bánh Mỳ Đặc Biệt không chỉ là một bữa sáng ngon lành mà còn là trải nghiệm ẩm thực độc đáo, làm hài lòng mọi thực khách.', 30, 0, 0),
(43, 'https://images.pexels.com/photos/414262/pexels-photo-414262.jpeg?auto=compress&cs=tinysrgb&w=600', 'Sự Hòa Quyện Vị Mỹ - French Toast', 39000, '\"Sự Hòa Quyện Vị Mỹ - French Toast\" là một sự kết hợp hoàn hảo giữa vị ngon của bánh mỳ tươi mềm mịn và hương vị đa dạng từ các loại nhân độc đáo. Mỗi miếng bánh mỳ là một cuộc phiêu lưu đầy sáng tạo, từ những lớp thịt thơm ngon đến sự tươi mát của rau sống và sự kích thích từ các loại sốt đặc biệt. Rộn Ràng Bánh Mỳ Đặc Biệt không chỉ là một bữa sáng ngon lành mà còn là trải nghiệm ẩm thực độc đáo, làm hài lòng mọi thực khách.', 30, 0, 0),
(44, 'https://images.pexels.com/photos/2351274/pexels-photo-2351274.jpeg?auto=compress&cs=tinysrgb&w=600', 'Bữa Sáng Thế Giới - Dim Sum Trung Hoa', 31000, '\"Sự Hòa Quyện Vị Mỹ - French Toast\" là một sự kết hợp hoàn hảo giữa vị ngon của bánh mỳ tươi mềm mịn và hương vị đa dạng từ các loại nhân độc đáo. Mỗi miếng bánh mỳ là một cuộc phiêu lưu đầy sáng tạo, từ những lớp thịt thơm ngon đến sự tươi mát của rau sống và sự kích thích từ các loại sốt đặc biệt. Rộn Ràng Bánh Mỳ Đặc Biệt không chỉ là một bữa sáng ngon lành mà còn là trải nghiệm ẩm thực độc đáo, làm hài lòng mọi thực khách.', 30, 0, 0),
(45, 'https://images.pexels.com/photos/5805090/pexels-photo-5805090.jpeg?auto=compress&cs=tinysrgb&w=600', 'Hạnh Phúc Bánh Sinh Nhật Vanilla Dream', 100000, '\"Hạnh Phúc Bánh Sinh Nhật Vanilla Dream\" là sự kết hợp tuyệt vời giữa vị ngọt dịu của vani và hương thơm đặc trưng của bánh sinh nhật. Lớp kem mousse vani mịn màng, phủ trên lớp bánh mềm mịn, tạo nên một trải nghiệm đầy hấp dẫn và ngọt ngào. Mỗi miếng bánh là một giấc mơ ngọt ngào, đem lại niềm vui và hạnh phúc cho mọi kỷ niệm đặc biệt.', 32, 0, 7),
(46, 'https://images.pexels.com/photos/5365902/pexels-photo-5365902.jpeg?auto=compress&cs=tinysrgb&w=600', 'Nụ Cười Bánh Sinh Nhật Chocolate Bliss', 130000, '\"Nụ Cười Bánh Sinh Nhật Chocolate Bliss\" là sự kết hợp tuyệt vời giữa vị ngọt dịu của vani và hương thơm đặc trưng của bánh sinh nhật. Lớp kem mousse vani mịn màng, phủ trên lớp bánh mềm mịn, tạo nên một trải nghiệm đầy hấp dẫn và ngọt ngào. Mỗi miếng bánh là một giấc mơ ngọt ngào, đem lại niềm vui và hạnh phúc cho mọi kỷ niệm đặc biệt.', 32, 0, 6),
(47, 'https://images.pexels.com/photos/15472008/pexels-photo-15472008/free-photo-of-birthday-cake-with-strawberries-on-tray.jpeg?auto=compress&cs=tinysrgb&w=600', 'Bản Hòa Bánh Sinh Nhật Strawberry Delight', 155000, '\"Bản Hòa Bánh Sinh Nhật Strawberry Delight\" là sự kết hợp tuyệt vời giữa vị ngọt dịu của vani và hương thơm đặc trưng của bánh sinh nhật. Lớp kem mousse vani mịn màng, phủ trên lớp bánh mềm mịn, tạo nên một trải nghiệm đầy hấp dẫn và ngọt ngào. Mỗi miếng bánh là một giấc mơ ngọt ngào, đem lại niềm vui và hạnh phúc cho mọi kỷ niệm đặc biệt.', 32, 0, 0),
(48, 'https://images.pexels.com/photos/14800686/pexels-photo-14800686.jpeg?auto=compress&cs=tinysrgb&w=600', 'Lời Chúc Bánh Sinh Nhật Caramel Elegance', 175000, '\"Lời Chúc Bánh Sinh Nhật Caramel Elegance\" là sự kết hợp tuyệt vời giữa vị ngọt dịu của vani và hương thơm đặc trưng của bánh sinh nhật. Lớp kem mousse vani mịn màng, phủ trên lớp bánh mềm mịn, tạo nên một trải nghiệm đầy hấp dẫn và ngọt ngào. Mỗi miếng bánh là một giấc mơ ngọt ngào, đem lại niềm vui và hạnh phúc cho mọi kỷ niệm đặc biệt.', 32, 0, 4),
(49, 'https://images.pexels.com/photos/5716598/pexels-photo-5716598.jpeg?auto=compress&cs=tinysrgb&w=600', 'Vui Mừng Bánh Sinh Nhật Lemon Zest', 200000, '\"Vui Mừng Bánh Sinh Nhật Lemon Zest\" là sự kết hợp tuyệt vời giữa vị ngọt dịu của vani và hương thơm đặc trưng của bánh sinh nhật. Lớp kem mousse vani mịn màng, phủ trên lớp bánh mềm mịn, tạo nên một trải nghiệm đầy hấp dẫn và ngọt ngào. Mỗi miếng bánh là một giấc mơ ngọt ngào, đem lại niềm vui và hạnh phúc cho mọi kỷ niệm đặc biệt.', 32, 0, 8),
(50, 'https://images.pexels.com/photos/7525182/pexels-photo-7525182.jpeg?auto=compress&cs=tinysrgb&w=600', 'Kỷ Niệm Bánh Sinh Nhật Almond Joy', 186000, '\"Kỷ Niệm Bánh Sinh Nhật Almond Joy\" là sự kết hợp tuyệt vời giữa vị ngọt dịu của vani và hương thơm đặc trưng của bánh sinh nhật. Lớp kem mousse vani mịn màng, phủ trên lớp bánh mềm mịn, tạo nên một trải nghiệm đầy hấp dẫn và ngọt ngào. Mỗi miếng bánh là một giấc mơ ngọt ngào, đem lại niềm vui và hạnh phúc cho mọi kỷ niệm đặc biệt.', 32, 0, 4),
(51, 'https://images.pexels.com/photos/9598195/pexels-photo-9598195.jpeg?auto=compress&cs=tinysrgb&w=600', 'Sắc Màu Bánh Sinh Nhật Rainbow Fantasy', 199000, '\"Sắc Màu Bánh Sinh Nhật Rainbow Fantasy\" là sự kết hợp tuyệt vời giữa vị ngọt dịu của vani và hương thơm đặc trưng của bánh sinh nhật. Lớp kem mousse vani mịn màng, phủ trên lớp bánh mềm mịn, tạo nên một trải nghiệm đầy hấp dẫn và ngọt ngào. Mỗi miếng bánh là một giấc mơ ngọt ngào, đem lại niềm vui và hạnh phúc cho mọi kỷ niệm đặc biệt.', 32, 0, 0),
(52, 'https://images.pexels.com/photos/9405268/pexels-photo-9405268.jpeg?auto=compress&cs=tinysrgb&w=600', 'Bí Mật Bánh Sinh Nhật Red Velvet Surprise', 205000, '\"Bí Mật Bánh Sinh Nhật Red Velvet Surprise\" là sự kết hợp tuyệt vời giữa vị ngọt dịu của vani và hương thơm đặc trưng của bánh sinh nhật. Lớp kem mousse vani mịn màng, phủ trên lớp bánh mềm mịn, tạo nên một trải nghiệm đầy hấp dẫn và ngọt ngào. Mỗi miếng bánh là một giấc mơ ngọt ngào, đem lại niềm vui và hạnh phúc cho mọi kỷ niệm đặc biệt.', 32, 0, 0),
(53, 'https://images.pexels.com/photos/8245039/pexels-photo-8245039.jpeg?auto=compress&cs=tinysrgb&w=600', 'Hồng Hạnh Phúc Bánh Sinh Nhật Raspberry Bliss', 225000, '\"Hồng Hạnh Phúc Bánh Sinh Nhật Raspberry Bliss\" là sự kết hợp tuyệt vời giữa vị ngọt dịu của vani và hương thơm đặc trưng của bánh sinh nhật. Lớp kem mousse vani mịn màng, phủ trên lớp bánh mềm mịn, tạo nên một trải nghiệm đầy hấp dẫn và ngọt ngào. Mỗi miếng bánh là một giấc mơ ngọt ngào, đem lại niềm vui và hạnh phúc cho mọi kỷ niệm đặc biệt.', 32, 0, 3),
(54, 'https://images.pexels.com/photos/8014699/pexels-photo-8014699.jpeg?auto=compress&cs=tinysrgb&w=600', 'Lấp Lánh Bánh Sinh Nhật Sparkling Celebration', 256000, '\"Lấp Lánh Bánh Sinh Nhật Sparkling Celebration\" là sự kết hợp tuyệt vời giữa vị ngọt dịu của vani và hương thơm đặc trưng của bánh sinh nhật. Lớp kem mousse vani mịn màng, phủ trên lớp bánh mềm mịn, tạo nên một trải nghiệm đầy hấp dẫn và ngọt ngào. Mỗi miếng bánh là một giấc mơ ngọt ngào, đem lại niềm vui và hạnh phúc cho mọi kỷ niệm đặc biệt.', 32, 0, 5),
(55, 'https://images.pexels.com/photos/8478058/pexels-photo-8478058.jpeg?auto=compress&cs=tinysrgb&w=600', 'Thiên Đường Bánh Sinh Nhật Blueberry Heaven', 156000, '\"Thiên Đường Bánh Sinh Nhật Blueberry Heaven\" là sự kết hợp tuyệt vời giữa vị ngọt dịu của vani và hương thơm đặc trưng của bánh sinh nhật. Lớp kem mousse vani mịn màng, phủ trên lớp bánh mềm mịn, tạo nên một trải nghiệm đầy hấp dẫn và ngọt ngào. Mỗi miếng bánh là một giấc mơ ngọt ngào, đem lại niềm vui và hạnh phúc cho mọi kỷ niệm đặc biệt.', 32, 0, 6),
(56, 'https://images.pexels.com/photos/15718103/pexels-photo-15718103/free-photo-of-burning-candles-on-birthday-cake.jpeg?auto=compress&cs=tinysrgb&w=600', 'Nắng Ấm Bánh Sinh Nhật Orange Sunshine', 179000, '\"Nắng Ấm Bánh Sinh Nhật Orange Sunshine\" là sự kết hợp tuyệt vời giữa vị ngọt dịu của vani và hương thơm đặc trưng của bánh sinh nhật. Lớp kem mousse vani mịn màng, phủ trên lớp bánh mềm mịn, tạo nên một trải nghiệm đầy hấp dẫn và ngọt ngào. Mỗi miếng bánh là một giấc mơ ngọt ngào, đem lại niềm vui và hạnh phúc cho mọi kỷ niệm đặc biệt.', 32, 0, 6),
(57, 'https://images.pexels.com/photos/4406799/pexels-photo-4406799.jpeg?auto=compress&cs=tinysrgb&w=600', 'Hoạt Hình Bánh Sinh Nhật Cartoon Adventure', 300000, '\"Nắng Ấm Bánh Sinh Nhật Orange Sunshine\" là sự kết hợp tuyệt vời giữa vị ngọt dịu của vani và hương thơm đặc trưng của bánh sinh nhật. Lớp kem mousse vani mịn màng, phủ trên lớp bánh mềm mịn, tạo nên một trải nghiệm đầy hấp dẫn và ngọt ngào. Mỗi miếng bánh là một giấc mơ ngọt ngào, đem lại niềm vui và hạnh phúc cho mọi kỷ niệm đặc biệt.', 32, 0, 7),
(58, 'https://images.pexels.com/photos/10033212/pexels-photo-10033212.jpeg?auto=compress&cs=tinysrgb&w=600', 'Bản Quyền Bánh Sinh Nhật Cookie Craze', 234000, '\"Bản Quyền Bánh Sinh Nhật Cookie Craze\" là sự kết hợp tuyệt vời giữa vị ngọt dịu của vani và hương thơm đặc trưng của bánh sinh nhật. Lớp kem mousse vani mịn màng, phủ trên lớp bánh mềm mịn, tạo nên một trải nghiệm đầy hấp dẫn và ngọt ngào. Mỗi miếng bánh là một giấc mơ ngọt ngào, đem lại niềm vui và hạnh phúc cho mọi kỷ niệm đặc biệt.', 32, 0, 7),
(59, 'https://images.pexels.com/photos/11782120/pexels-photo-11782120.jpeg?auto=compress&cs=tinysrgb&w=600', 'Kỷ Vật Bánh Sinh Nhật Memory Lane', 198000, '\"Kỷ Vật Bánh Sinh Nhật Memory Lane\" là sự kết hợp tuyệt vời giữa vị ngọt dịu của vani và hương thơm đặc trưng của bánh sinh nhật. Lớp kem mousse vani mịn màng, phủ trên lớp bánh mềm mịn, tạo nên một trải nghiệm đầy hấp dẫn và ngọt ngào. Mỗi miếng bánh là một giấc mơ ngọt ngào, đem lại niềm vui và hạnh phúc cho mọi kỷ niệm đặc biệt.', 32, 0, 0),
(60, 'https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg?auto=compress&cs=tinysrgb&w=600', 'Vương Miện Pizza Supreme', 200000, '\"Vương Miện Pizza Supreme\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 33, 0, 4),
(61, 'https://images.pexels.com/photos/905847/pexels-photo-905847.jpeg?auto=compress&cs=tinysrgb&w=600', 'Hương Vị Nước Ý Margherita', 205000, '\"Hương Vị Nước Ý Margherita\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 33, 0, 4),
(62, 'https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg?auto=compress&cs=tinysrgb&w=600', 'Pizza Sốt Cà Chua Tươi Tẻ', 215000, '\"Pizza Sốt Cà Chua Tươi Tẻ\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 33, 0, 0),
(63, 'https://images.pexels.com/photos/1566837/pexels-photo-1566837.jpeg?auto=compress&cs=tinysrgb&w=600', 'Pizza Hành Tỏi Đậm Đà', 220000, '\"Pizza Hành Tỏi Đậm Đà\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 33, 0, 0),
(64, 'https://images.pexels.com/photos/842519/pexels-photo-842519.jpeg?auto=compress&cs=tinysrgb&w=600', 'Pizza Pepperoni Sốt BBQ', 225000, '\"Pizza Pepperoni Sốt BBQ\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 33, 0, 0),
(65, 'https://images.pexels.com/photos/2619970/pexels-photo-2619970.jpeg?auto=compress&cs=tinysrgb&w=600', 'Pizza Hải Sản Biển Xanh', 230000, '\"Pizza Hải Sản Biển Xanh\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 33, 0, 0),
(66, 'https://images.pexels.com/photos/2762942/pexels-photo-2762942.jpeg?auto=compress&cs=tinysrgb&w=600', 'Pizza Nấm Tươi Trắng', 235000, '\"Pizza Nấm Tươi Trắng\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 33, 0, 0),
(67, 'https://images.pexels.com/photos/1552635/pexels-photo-1552635.jpeg?auto=compress&cs=tinysrgb&w=600', 'Pizza Thịt Bò Steakhouse', 290000, '\"Pizza Thịt Bò Steakhouse\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 33, 0, 5),
(68, 'https://media.istockphoto.com/id/938742222/photo/cheesy-pepperoni-pizza.jpg?b=1&s=612x612&w=0&k=20&c=ZcLXrogjpyc5froC5ZIP-0uepbhldATwmCbt3mzViGQ=', 'Pizza Rau Cải Sống Động', 275000, '\"Pizza Rau Cải Sống Động\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 33, 0, 10),
(69, 'https://images.pexels.com/photos/2471171/pexels-photo-2471171.jpeg?auto=compress&cs=tinysrgb&w=600', 'Pizza Sốt Sữa Mỡ và Nấm', 266000, '\"Pizza Sốt Sữa Mỡ và Nấm\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 33, 0, 7),
(70, 'https://images.pexels.com/photos/845802/pexels-photo-845802.jpeg?auto=compress&cs=tinysrgb&w=600', 'Pizza Gà Cay Sả Ướt', 255000, '\"Pizza Gà Cay Sả Ướt\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 33, 0, 3),
(71, 'https://images.pexels.com/photos/1435903/pexels-photo-1435903.jpeg?auto=compress&cs=tinysrgb&w=600', 'Pizza Hạt Dẻ Cười và Feta', 264000, '\"Pizza Hạt Dẻ Cười và Feta\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 33, 0, 3),
(72, 'https://images.pexels.com/photos/3915857/pexels-photo-3915857.jpeg?auto=compress&cs=tinysrgb&w=600', 'Pizza Lúa Mạch và Rau Mùi', 399000, '\"Pizza Lúa Mạch và Rau Mùi\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 33, 0, 6),
(73, 'https://images.pexels.com/photos/3343626/pexels-photo-3343626.jpeg?auto=compress&cs=tinysrgb&w=600', 'Pizza Cà Rốt và Cải Ngọt', 199000, '\"Pizza Cà Rốt và Cải Ngọt\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 33, 0, 0),
(74, 'https://images.pexels.com/photos/3682837/pexels-photo-3682837.jpeg?auto=compress&cs=tinysrgb&w=600', 'Pizza Trứng Bắc Cực và Sốt Kimchi', 283000, '\"Pizza Trứng Bắc Cực và Sốt Kimchi\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 33, 0, 15),
(75, 'https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg?auto=compress&cs=tinysrgb&w=600', 'Hương Vị Hải Sản', 60000, '\"Hương Vị Hải Sản\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 34, 0, 3),
(76, 'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg?auto=compress&cs=tinysrgb&w=600', 'Burger Bò Sốt Sả Ướt', 44000, '\"Burger Bò Sốt Sả Ướt\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 34, 0, 4),
(77, 'https://images.pexels.com/photos/1199957/pexels-photo-1199957.jpeg?auto=compress&cs=tinysrgb&w=600', 'Burger Cải Ngọt Vegan', 45000, '\"Burger Cải Ngọt Vegan\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 34, 0, 2),
(78, 'https://images.pexels.com/photos/1251198/pexels-photo-1251198.jpeg?auto=compress&cs=tinysrgb&w=600', 'Burger Gà Cay Tỏi', 45000, '\"Burger Gà Cay Tỏi\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 34, 0, 3),
(79, 'https://images.pexels.com/photos/580612/pexels-photo-580612.jpeg?auto=compress&cs=tinysrgb&w=600', 'Burger Nấm Nướng', 55000, '\"Burger Nấm Nướng\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 34, 0, 0),
(80, 'https://images.pexels.com/photos/2702674/pexels-photo-2702674.jpeg?auto=compress&cs=tinysrgb&w=600', 'Burger Thịt Bò Kobe', 550000, '\"Burger Thịt Bò Kobe\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 34, 0, 9),
(81, 'https://images.pexels.com/photos/1600727/pexels-photo-1600727.jpeg?auto=compress&cs=tinysrgb&w=600', 'Burger Rau Cải Sống Động', 52000, '\"Burger Rau Cải Sống Động\" là một biểu tượng của hương vị đậm đà và sự kích thích. Với lớp bánh mỏng mịn được phủ đầy sốt cay nồng, thịt gà thơm béo và sả ươt tinh tế, mỗi miếng pizza là một cuộc phiêu lưu ngon miệng đầy nồng nàn. Sự hòa quyện giữa vị cay cay, thơm ngon và độ mềm mịn của bánh tạo nên một trải nghiệm ẩm thực đặc biệt, hấp dẫn và không thể quên.', 34, 0, 2),
(82, 'https://images.pexels.com/photos/2402503/pexels-photo-2402503.jpeg?auto=compress&cs=tinysrgb&w=600', 'Sandwich Thịt Bò Philly Cheesesteak', 30000, 'Sandwich Thịt Bò Philly Cheesesteak là một lựa chọn bữa ăn nhanh, nhưng không kém phần ngon miệng và đa dạng. Với lớp bánh mềm mịn hoặc giòn rụm, sandwich kết hợp giữa các loại thực phẩm như thịt, rau cải, phô mai và sốt, tạo nên một trải nghiệm ẩm thực đa dạng và bổ dưỡng cho mọi khẩu vị.', 34, 0, 2),
(83, 'https://images.pexels.com/photos/5692286/pexels-photo-5692286.jpeg?auto=compress&cs=tinysrgb&w=600', 'Sandwich Tôm Hấp Phô Mai', 35000, '\"Sandwich Tôm Hấp Phô Mai\" là một lựa chọn bữa ăn nhanh, nhưng không kém phần ngon miệng và đa dạng. Với lớp bánh mềm mịn hoặc giòn rụm, sandwich kết hợp giữa các loại thực phẩm như thịt, rau cải, phô mai và sốt, tạo nên một trải nghiệm ẩm thực đa dạng và bổ dưỡng cho mọi khẩu vị.', 34, 0, 2),
(84, 'https://images.pexels.com/photos/5292918/pexels-photo-5292918.jpeg?auto=compress&cs=tinysrgb&w=600', 'Sandwich Bánh Mì Bò Kho', 35000, '\"Sandwich Bánh Mì Bò Kho\" là một lựa chọn bữa ăn nhanh, nhưng không kém phần ngon miệng và đa dạng. Với lớp bánh mềm mịn hoặc giòn rụm, sandwich kết hợp giữa các loại thực phẩm như thịt, rau cải, phô mai và sốt, tạo nên một trải nghiệm ẩm thực đa dạng và bổ dưỡng cho mọi khẩu vị.', 34, 0, 0),
(85, 'https://images.pexels.com/photos/1647163/pexels-photo-1647163.jpeg?auto=compress&cs=tinysrgb&w=600', 'Sandwich Gà Cay Hành Tỏi', 40000, '\"Sandwich Gà Cay Hành Tỏi\" là một lựa chọn bữa ăn nhanh, nhưng không kém phần ngon miệng và đa dạng. Với lớp bánh mềm mịn hoặc giòn rụm, sandwich kết hợp giữa các loại thực phẩm như thịt, rau cải, phô mai và sốt, tạo nên một trải nghiệm ẩm thực đa dạng và bổ dưỡng cho mọi khẩu vị.', 34, 0, 0),
(86, 'https://images.pexels.com/photos/1209029/pexels-photo-1209029.jpeg?auto=compress&cs=tinysrgb&w=600', 'Sandwich Rau Cải Tươi Mát', 43000, '\"Sandwich Rau Cải Tươi Mát\" là một lựa chọn bữa ăn nhanh, nhưng không kém phần ngon miệng và đa dạng. Với lớp bánh mềm mịn hoặc giòn rụm, sandwich kết hợp giữa các loại thực phẩm như thịt, rau cải, phô mai và sốt, tạo nên một trải nghiệm ẩm thực đa dạng và bổ dưỡng cho mọi khẩu vị.', 34, 0, 0),
(87, 'https://images.pexels.com/photos/1603898/pexels-photo-1603898.jpeg?auto=compress&cs=tinysrgb&w=600', 'Sandwich Salmon Đậu Hà Lan', 56000, '\"Sandwich Salmon Đậu Hà Lan\" là một lựa chọn bữa ăn nhanh, nhưng không kém phần ngon miệng và đa dạng. Với lớp bánh mềm mịn hoặc giòn rụm, sandwich kết hợp giữa các loại thực phẩm như thịt, rau cải, phô mai và sốt, tạo nên một trải nghiệm ẩm thực đa dạng và bổ dưỡng cho mọi khẩu vị.', 34, 0, 0),
(88, 'https://images.pexels.com/photos/2955819/pexels-photo-2955819.jpeg?auto=compress&cs=tinysrgb&w=600', 'Sandwich Bò Hầm Nấm', 50000, '\"Sandwich Bò Hầm Nấm\" là một lựa chọn bữa ăn nhanh, nhưng không kém phần ngon miệng và đa dạng. Với lớp bánh mềm mịn hoặc giòn rụm, sandwich kết hợp giữa các loại thực phẩm như thịt, rau cải, phô mai và sốt, tạo nên một trải nghiệm ẩm thực đa dạng và bổ dưỡng cho mọi khẩu vị.', 34, 0, 7),
(89, 'https://images.pexels.com/photos/7390/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=600', 'Sandwich Đậu Phộng Sốt Sate', 63000, '\"Sandwich Đậu Phộng Sốt Sate\" là một lựa chọn bữa ăn nhanh, nhưng không kém phần ngon miệng và đa dạng. Với lớp bánh mềm mịn hoặc giòn rụm, sandwich kết hợp giữa các loại thực phẩm như thịt, rau cải, phô mai và sốt, tạo nên một trải nghiệm ẩm thực đa dạng và bổ dưỡng cho mọi khẩu vị.', 34, 0, 5),
(90, 'https://images.pexels.com/photos/5947071/pexels-photo-5947071.jpeg?auto=compress&cs=tinysrgb&w=600', 'Ngọt Ngào Cam Tươi', 25000, '\"Ngọt Ngào Cam Tươi\" là một tổng hòa của hương vị tươi mới từ trái cây tươi ngon nhất. Từ ngọt ngào của cam, chua chát của chanh, đến hương thơm của dâu và dưa hấu, mỗi giọt nước trái cây là một trải nghiệm tinh tế và bổ dưỡng. Thưởng thức nước trái cây là cách tuyệt vời để làm dịu cơn khát và nạp năng lượng cho cơ thể.', 35, 0, 5),
(91, 'https://images.pexels.com/photos/14265425/pexels-photo-14265425.jpeg?auto=compress&cs=tinysrgb&w=600', 'Hương Vị Dâu Tươi Mát', 35000, '\"Hương Vị Dâu Tươi Mát\" là một tổng hòa của hương vị tươi mới từ trái cây tươi ngon nhất. Từ ngọt ngào của cam, chua chát của chanh, đến hương thơm của dâu và dưa hấu, mỗi giọt nước trái cây là một trải nghiệm tinh tế và bổ dưỡng. Thưởng thức nước trái cây là cách tuyệt vời để làm dịu cơn khát và nạp năng lượng cho cơ thể.', 35, 0, 0),
(92, 'https://images.pexels.com/photos/18479498/pexels-photo-18479498/free-photo-of-cocktail-u-ng-snack-n-c-ep.png?auto=compress&cs=tinysrgb&w=600', 'Đào Nước Mát Lạnh', 40000, '\"Đào Nước Mát Lạnh\" là một tổng hòa của hương vị tươi mới từ trái cây tươi ngon nhất. Từ ngọt ngào của cam, chua chát của chanh, đến hương thơm của dâu và dưa hấu, mỗi giọt nước trái cây là một trải nghiệm tinh tế và bổ dưỡng. Thưởng thức nước trái cây là cách tuyệt vời để làm dịu cơn khát và nạp năng lượng cho cơ thể.', 35, 0, 0),
(93, 'https://images.pexels.com/photos/18477616/pexels-photo-18477616/free-photo-of-cocktail-u-ng-ly-c-c.jpeg?auto=compress&cs=tinysrgb&w=600', 'Sả Chanh Lẻn Sương', 25000, '\"Sả Chanh Lẻn Sương\" là một tổng hòa của hương vị tươi mới từ trái cây tươi ngon nhất. Từ ngọt ngào của cam, chua chát của chanh, đến hương thơm của dâu và dưa hấu, mỗi giọt nước trái cây là một trải nghiệm tinh tế và bổ dưỡng. Thưởng thức nước trái cây là cách tuyệt vời để làm dịu cơn khát và nạp năng lượng cho cơ thể.', 35, 0, 2),
(94, 'https://images.pexels.com/photos/5945669/pexels-photo-5945669.jpeg?auto=compress&cs=tinysrgb&w=600', 'Dưa Hấu Tươi Làm Mát', 26000, '\"Dưa Hấu Tươi Làm Mát\" là một tổng hòa của hương vị tươi mới từ trái cây tươi ngon nhất. Từ ngọt ngào của cam, chua chát của chanh, đến hương thơm của dâu và dưa hấu, mỗi giọt nước trái cây là một trải nghiệm tinh tế và bổ dưỡng. Thưởng thức nước trái cây là cách tuyệt vời để làm dịu cơn khát và nạp năng lượng cho cơ thể.', 35, 0, 0),
(95, 'https://images.pexels.com/photos/338713/pexels-photo-338713.jpeg?auto=compress&cs=tinysrgb&w=600', 'Chanh Xanh Ngọt Mát', 25000, '\"Chanh Xanh Ngọt Mát\" là một tổng hòa của hương vị tươi mới từ trái cây tươi ngon nhất. Từ ngọt ngào của cam, chua chát của chanh, đến hương thơm của dâu và dưa hấu, mỗi giọt nước trái cây là một trải nghiệm tinh tế và bổ dưỡng. Thưởng thức nước trái cây là cách tuyệt vời để làm dịu cơn khát và nạp năng lượng cho cơ thể.', 35, 0, 0),
(96, 'https://images.pexels.com/photos/4819717/pexels-photo-4819717.jpeg?auto=compress&cs=tinysrgb&w=600', 'Bưởi Đỏ Thơm Nồng', 25000, '\"Bưởi Đỏ Thơm Nồng\" là một tổng hòa của hương vị tươi mới từ trái cây tươi ngon nhất. Từ ngọt ngào của cam, chua chát của chanh, đến hương thơm của dâu và dưa hấu, mỗi giọt nước trái cây là một trải nghiệm tinh tế và bổ dưỡng. Thưởng thức nước trái cây là cách tuyệt vời để làm dịu cơn khát và nạp năng lượng cho cơ thể.', 35, 0, 0),
(97, 'https://images.pexels.com/photos/4846242/pexels-photo-4846242.jpeg?auto=compress&cs=tinysrgb&w=600', 'Xoài Mận Nước Ép', 25000, '\"Xoài Mận Nước Ép\" là một tổng hòa của hương vị tươi mới từ trái cây tươi ngon nhất. Từ ngọt ngào của cam, chua chát của chanh, đến hương thơm của dâu và dưa hấu, mỗi giọt nước trái cây là một trải nghiệm tinh tế và bổ dưỡng. Thưởng thức nước trái cây là cách tuyệt vời để làm dịu cơn khát và nạp năng lượng cho cơ thể.', 35, 0, 2),
(98, 'https://images.pexels.com/photos/7376915/pexels-photo-7376915.jpeg?auto=compress&cs=tinysrgb&w=600', 'Nho Xanh Mát Lạnh', 25000, '\"Nho Xanh Mát Lạnh\" là một tổng hòa của hương vị tươi mới từ trái cây tươi ngon nhất. Từ ngọt ngào của cam, chua chát của chanh, đến hương thơm của dâu và dưa hấu, mỗi giọt nước trái cây là một trải nghiệm tinh tế và bổ dưỡng. Thưởng thức nước trái cây là cách tuyệt vời để làm dịu cơn khát và nạp năng lượng cho cơ thể.', 35, 0, 2),
(99, 'https://images.pexels.com/photos/5946588/pexels-photo-5946588.jpeg?auto=compress&cs=tinysrgb&w=600', 'Dừa Đặc Biệt Cà Rốt', 25000, '\"Dừa Đặc Biệt Cà Rốt\" là một tổng hòa của hương vị tươi mới từ trái cây tươi ngon nhất. Từ ngọt ngào của cam, chua chát của chanh, đến hương thơm của dâu và dưa hấu, mỗi giọt nước trái cây là một trải nghiệm tinh tế và bổ dưỡng. Thưởng thức nước trái cây là cách tuyệt vời để làm dịu cơn khát và nạp năng lượng cho cơ thể.', 35, 0, 0),
(100, 'https://images.pexels.com/photos/1484678/pexels-photo-1484678.jpeg?auto=compress&cs=tinysrgb&w=600', 'Hỗn Hợp Hoa Quả Tươi', 25000, '\"Hỗn Hợp Hoa Quả Tươi\" là một tổng hòa của hương vị tươi mới từ trái cây tươi ngon nhất. Từ ngọt ngào của cam, chua chát của chanh, đến hương thơm của dâu và dưa hấu, mỗi giọt nước trái cây là một trải nghiệm tinh tế và bổ dưỡng. Thưởng thức nước trái cây là cách tuyệt vời để làm dịu cơn khát và nạp năng lượng cho cơ thể.', 35, 0, 0),
(101, 'https://images.pexels.com/photos/161440/smoothie-fruit-vegetables-salad-beetroot-carrots-161440.jpeg?auto=compress&cs=tinysrgb&w=600', 'Cherry Ngọt Dịu', 25000, '\"Cherry Ngọt Dịu\" là một tổng hòa của hương vị tươi mới từ trái cây tươi ngon nhất. Từ ngọt ngào của cam, chua chát của chanh, đến hương thơm của dâu và dưa hấu, mỗi giọt nước trái cây là một trải nghiệm tinh tế và bổ dưỡng. Thưởng thức nước trái cây là cách tuyệt vời để làm dịu cơn khát và nạp năng lượng cho cơ thể.', 35, 0, 0),
(102, 'https://images.pexels.com/photos/110472/pexels-photo-110472.jpeg?auto=compress&cs=tinysrgb&w=600', 'Kiwi Pha Lê Lạnh', 40000, '\"Kiwi Pha Lê Lạnh\" là một tổng hòa của hương vị tươi mới từ trái cây tươi ngon nhất. Từ ngọt ngào của cam, chua chát của chanh, đến hương thơm của dâu và dưa hấu, mỗi giọt nước trái cây là một trải nghiệm tinh tế và bổ dưỡng. Thưởng thức nước trái cây là cách tuyệt vời để làm dịu cơn khát và nạp năng lượng cho cơ thể.', 35, 0, 0),
(103, 'https://images.pexels.com/photos/4819700/pexels-photo-4819700.jpeg?auto=compress&cs=tinysrgb&w=600', 'Táo Xanh Làm Mát', 35000, '\"Táo Xanh Làm Mát\" là một tổng hòa của hương vị tươi mới từ trái cây tươi ngon nhất. Từ ngọt ngào của cam, chua chát của chanh, đến hương thơm của dâu và dưa hấu, mỗi giọt nước trái cây là một trải nghiệm tinh tế và bổ dưỡng. Thưởng thức nước trái cây là cách tuyệt vời để làm dịu cơn khát và nạp năng lượng cho cơ thể.', 35, 0, 0),
(104, 'https://images.pexels.com/photos/5946624/pexels-photo-5946624.jpeg?auto=compress&cs=tinysrgb&w=600', 'Lựu Và Dâu Mâm Xôi', 32000, '\"Lựu Và Dâu Mâm Xôi\" là một tổng hòa của hương vị tươi mới từ trái cây tươi ngon nhất. Từ ngọt ngào của cam, chua chát của chanh, đến hương thơm của dâu và dưa hấu, mỗi giọt nước trái cây là một trải nghiệm tinh tế và bổ dưỡng. Thưởng thức nước trái cây là cách tuyệt vời để làm dịu cơn khát và nạp năng lượng cho cơ thể.', 35, 0, 0),
(105, 'https://images.pexels.com/photos/1235706/pexels-photo-1235706.jpeg?auto=compress&cs=tinysrgb&w=600', 'Cà phê', 25000, '\"Cà phê\" là một tổng hòa của hương vị tươi mới từ trái cây tươi ngon nhất. Từ ngọt ngào của cam, chua chát của chanh, đến hương thơm của dâu và dưa hấu, mỗi giọt nước trái cây là một trải nghiệm tinh tế và bổ dưỡng. Thưởng thức nước trái cây là cách tuyệt vời để làm dịu cơn khát và nạp năng lượng cho cơ thể.', 35, 0, 0),
(107, 'https://product.hstatic.net/200000411281/product/1_f00d4d4df0d44f3f9ff3835cc2039490_grande.png', 'Bánh ngọt', 100000, 'Không có mô tả', 33, 0, 3);

--
-- Bẫy `product`
--
DELIMITER $$
CREATE TRIGGER `after_delete_product` BEFORE DELETE ON `product` FOR EACH ROW BEGIN
    UPDATE ORDERDETAIL
    SET PRODUCT_ID = 15
    WHERE PRODUCT_ID = OLD.PRODUCT_ID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD_HASH` text,
  `FULL_NAME` text,
  `PHONE` char(10) DEFAULT NULL,
  `ADDRESS` text,
  `ROLE_USER` char(10) DEFAULT NULL,
  `EMAIL` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`USERNAME`, `PASSWORD_HASH`, `FULL_NAME`, `PHONE`, `ADDRESS`, `ROLE_USER`, `EMAIL`) VALUES
('admin', '$2y$10$Cp4AVDdM7NNrqatNfvAbFOGATcbwul4q9kYCs/0xen/Kh7ockpnhG', 'Adminnnn', '0123456789', 'Phú Yên', 'Manager', 'hoan39800@gmail.com'),
('conghoan1212', '$2y$10$.rkthe00okjT4am/ohmbye3Si3JQiFpyurKMXf7CLTJVUyyoAv5T.', 'Lê Nguyễn Công Hoangg', '0111111111', 'TP. Sài Gòn', 'Customer', 'hoan39800@gmail.com'),
('hoancong', '$2y$10$lgOSQy8EtkR64pI8zNCBT.p9l3IW4ymsYRpLm88nCr4XG/9jN3Nhm', 'Lê Hoan', '0111111111', 'Phú Yên', 'Customer', 'lhoan2822@gmail.com'),
('lehoan2108', '$2y$10$xk0DRgxk/EQ/gL6P/rC7v.e8Cba13cI845dql1y2QVZLo7dUQBy8e', 'Lê Nguyễn Công Hoan', '0369656502', 'Phú Yên', 'Customer', 'lhoan2822@gmail.com'),
('lnchoan2108', '$2y$10$pHukzZBTAZxgmFfGf6d6yuUpA1S/CXNSCzIBbQEyloU0Dh6t3JZ4C', 'Lê Nguyễn Công Hoan', '0369656502', 'Phú Yên', 'Customer', 'lhoan2822@gmail.com'),
('usernamee', '$2y$10$rv6/DYtgyiMEXuDDeysdLOuPYd7ZQJmQu8I7stGdIkU0FNayCnXJq', 'Lê Hoan', '0369656502', 'Hoan', 'Customer', NULL),
('vchien123', '$2y$10$kWlku2OPAsg5CLqpZ2PvFeTXxcTgRsIfdJL3HXQJevUibY3Qk6z.G', 'Hoàn Văn Chiến', '0369656502', 'Bình Chánh', 'Customer', 'chienvan1203@gmail.com'),
('viduvidu123', '$2y$10$jxOpI0iq4iyLPmSXMOytDOZHm9bJlj55wYgRNXfTpl4S359AA5PNa', 'Ví Dụ', '0111111111', 'TP. Sài Gòn', 'Customer', 'hoan39800@gmail.com');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`CART_ID`),
  ADD KEY `USERNAME` (`USERNAME`),
  ADD KEY `PRODUCT_ID` (`PRODUCT_ID`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CATE_ID`);

--
-- Chỉ mục cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`ORDER_ID`,`PRODUCT_ID`),
  ADD KEY `PRODUCT_ID` (`PRODUCT_ID`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ORDER_ID`),
  ADD KEY `USERNAME` (`USERNAME`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`PRODUCT_ID`),
  ADD KEY `CATE_ID` (`CATE_ID`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`USERNAME`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `CART_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `CATE_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `ORDER_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `PRODUCT_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`USERNAME`) REFERENCES `user` (`USERNAME`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`);

--
-- Các ràng buộc cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `FK_ORDERDETAIL_ORDERS` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`),
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`USERNAME`) REFERENCES `user` (`USERNAME`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CATE_ID`) REFERENCES `category` (`CATE_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
