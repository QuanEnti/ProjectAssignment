--tắt toàn bộ constraint cho tất cả bảng
ALTER TABLE dbo.AdminUser NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.Banner NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.BlogPost NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.CartItem NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.Category NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.ContactMessage NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.Coupon NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.Customer NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.NewsletterSubscriber NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.[Order] NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.OrderDetail NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.PaymentMethod NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.Product NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.ProductImage NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.ProductVariant NOCHECK CONSTRAINT ALL;
--Bật lại toàn bộ constraint sau khi import xong
ALTER TABLE dbo.AdminUser CHECK CONSTRAINT ALL;
ALTER TABLE dbo.Banner CHECK CONSTRAINT ALL;
ALTER TABLE dbo.BlogPost CHECK CONSTRAINT ALL;
ALTER TABLE dbo.CartItem CHECK CONSTRAINT ALL;
ALTER TABLE dbo.Category CHECK CONSTRAINT ALL;
ALTER TABLE dbo.ContactMessage CHECK CONSTRAINT ALL;
ALTER TABLE dbo.Coupon CHECK CONSTRAINT ALL;
ALTER TABLE dbo.Customer CHECK CONSTRAINT ALL;
ALTER TABLE dbo.NewsletterSubscriber CHECK CONSTRAINT ALL;
ALTER TABLE dbo.[Order] CHECK CONSTRAINT ALL;
ALTER TABLE dbo.OrderDetail CHECK CONSTRAINT ALL;
ALTER TABLE dbo.PaymentMethod CHECK CONSTRAINT ALL;
ALTER TABLE dbo.Product CHECK CONSTRAINT ALL;
ALTER TABLE dbo.ProductImage CHECK CONSTRAINT ALL;
ALTER TABLE dbo.ProductVariant CHECK CONSTRAINT ALL;


INSERT INTO dbo.Banner (title, image, link, position) VALUES
(N'Sale mùa hè', '/img/banner1.jpg', '/product/1', 1),
(N'Ưu đãi cuối tuần', '/img/banner2.jpg', '/category/2', 2),
(N'Sản phẩm mới', '/img/banner3.jpg', '/product/3', 3),
(N'Giảm giá 50%', '/img/banner4.jpg', '/promo/summer', 4),
(N'Mua 1 tặng 1', '/img/banner5.jpg', '/promo/buy1get1', 5);
INSERT INTO dbo.BlogPost (id, title, content, thumbnail, createdAt) VALUES
(1, N'5 Xu hướng thời trang hè 2025', N'Nội dung bài viết 1...', '/images/blog1.jpg', '2024-07-01'),
(2, N'Mẹo mix đồ cực cháy', N'Nội dung bài viết 2...', '/images/blog2.jpg', '2024-07-02'),
(3, N'Top sản phẩm bán chạy tháng 7', N'Nội dung bài viết 3...', '/images/blog3.jpg', '2024-07-03'),
(4, N'Bí kíp chọn váy đi biển', N'Nội dung bài viết 4...', '/images/blog4.jpg', '2024-07-04'),
(5, N'Gợi ý phối phụ kiện 2025', N'Nội dung bài viết 5...', '/images/blog5.jpg', '2024-07-05');
INSERT INTO dbo.Category (id, name) VALUES
(1, N'Áo nam'),
(2, N'Áo nữ'),
(3, N'Quần short'),
(4, N'Váy'),
(5, N'Phụ kiện'),
(6, N'Giày dép');
INSERT INTO dbo.Customer (id, name, email, password, phone, address) VALUES
(1, N'hoang', 'hoang@gmail.com', '123', '0999a', 'adL'),
(2, N'phuong', 'phuong123@email.com', 'pw456', '0988000002', N'123 Đường Láng'),
(3, N'minh', 'minh98@email.com', 'mkabc', '0977123456', N'456 Nguyễn Trãi'),
(4, N'tran', 'tranlove@email.com', 'pass999', '0909999999', N'789 Võ Văn Kiệt'),
(5, N'thuy', 'thuydoan@email.com', 'iloveyou', '0911234567', N'Quận 1, HCM');
INSERT INTO dbo.NewsletterSubscriber (id, email, subscribedAt) VALUES
(1, 'alice@email.com', '2024-07-10'),
(2, 'bob@email.com', '2024-07-11'),
(3, 'cathy@email.com', '2024-07-12'),
(4, 'david@email.com', '2024-07-13'),
(5, 'emily@email.com', '2024-07-14');
INSERT INTO dbo.Product (id, name, description, price, mainImage, categoryId) VALUES
INSERT INTO Product (id, name, description, price, mainImage, categoryId) VALUES
(1, N'Áo Cổ Rộng', N'Áo thun cổ rộng, form rộng cá tính', 130000, 'Ao/AoCoRong.png', 2),
(2, N'Áo Cổ Trơn', N'Áo thun cotton xám local brand', 170000, 'Ao/AoCotron.jpg', 1),
(3, N'Áo MLB Floral', N'Áo MLB trắng nữ mặt sau in hoa', 210000, 'Ao/AoFloralCroptop.jpg', 2),
(4, N'Áo MLB thêu NY', N'Áo MLB thêu NY hoa 4 cánh', 230000, 'HeartCroptop.jpg', 2),
(5, N'Áo Om', N'Áo crop cổ bèo style vintage', 179000, 'Ao/AoOm.png', 2),
(6, N'Áo Om Body', N'Áo thun trắng nữ basic, form suông', 120000, 'Ao/AoOmBody.png', 2),
(7, N'Áo Sọc', N'Áo thun sọc vàng trắng', 135000, 'Ao/AoSoc.png', 2),
(8, N'Áo MLB Stree Big', N'Áo MLB đen Yankees big logo', 255000, 'Ao/AoStreeBig.jpg', 1),
(9, N'Áo nỉ sweatshirt', N'Áo sweatshirt MLB xám cổ polo', 250000, 'Ao/AoSweatshirt.jpg', 1),
(10, N'Áo Unisex', N'Áo MLB đen NY Yankees basic', 240000, 'Ao/AoUnisex.jpg', 1),
(11, N'Áo MLB viền navy', N'Áo MLB trắng tay viền xanh navy', 225000, 'Ao/AoVarsityCroptop.jpg', 2),
(12, N'Áo MLB vintage', N'Áo MLB trắng thêu chữ Yankees', 230000, 'Ao/AoVintage.jpg', 1),

(13, N'Giày Puma', N'Giày Puma chính hãng', 690000, 'GiayPuma.png', 6),
(14, N'Giày DIncox', N'Giày DIncox thời trang', 590000, 'Giay/GiayDIncox.png', 6),

(15, N'Tui đeo', N'PhuKien/Tui đeo thời trang', 90000, 'PhuKien/Giỏ.png', 5),
(16, N'Túi Midori', N'Túi Midori cỡ nhỏ', 115000, 'PhuKien/TuiMidori.png', 5),
(17, N'Túi xách', N'Túi xách basic', 130000, 'PhuKien/TuiXach.png', 5),

(18, N'Quần Short Basic', N'Quần short nam nữ basic', 120000, 'Quan/QuanAa.png', 3),
(19, N'Quần Jogging', N'Quần jogging thể thAo/Ao', 170000, 'Quan/QuanJogging.png', 3),
(20, N'Quần Kaki', N'Quần kaki suông nam nữ', 200000, 'Quan/QuanKaki.png', 3),
(21, N'Quần Style', N'Quần style cá tính', 210000, 'Quan/QuanStyle.png', 3),
(22, N'Quần Tây', N'Quần tây basic', 190000, 'Quan/QuanTay.png', 3),

(23, N'Áo varsity MLB', N'Áo varsity MLB bản giới hạn', 290000, 'Ao/AovarsityMLB.jpg',1)
;
--ProductImage
-- Áo Om
INSERT INTO ProductImage (productId, imageUrl, imageUI)
VALUES (1, 'Ao/AoOm.png', 'front');

-- Áo Om Body
INSERT INTO ProductImage (productId, imageUrl, imageUI)
VALUES (2, 'Ao/AoOmBody.png', 'front');

-- Áo Cổ Rộng
INSERT INTO ProductImage (productId, imageUrl, imageUI)
VALUES (3, 'Ao/AoCoRong.png', 'front');

-- Áo Sọc
INSERT INTO ProductImage (productId, imageUrl, imageUI)
VALUES (4, 'Ao/AoSoc.png', 'front');

-- Áo Cotton
INSERT INTO ProductImage (productId, imageUrl, imageUI)
VALUES (5, 'Ao/AoCotron.jpg', 'front'),
       (5, 'Ao/CotronTruoc.jpg', 'front'),
       (5, 'Ao/Cotronsau.jpg', 'back');

-- Áo MLB hoa
INSERT INTO ProductImage (productId, imageUrl, imageUI)
VALUES (6, 'Ao/AoFloralCroptop.jpg', 'front'),
       (6, 'Ao/AoFloralCroptopsau.jpg', 'back');

-- Áo MLB thêu NY
INSERT INTO ProductImage (productId, imageUrl, imageUI)
VALUES (7, 'Ao/AoHeartCroptop.jpg', 'front'),
       (7, 'Ao/AoHeartCroptopsau.jpg', 'back');

-- Áo nỉ sweatshirt
INSERT INTO ProductImage (productId, imageUrl, imageUI)
VALUES (8, 'Ao/AoSweatshirt.jpg', 'front');

-- Áo MLB viền navy
INSERT INTO ProductImage (productId, imageUrl, imageUI)
VALUES (9, 'Ao/AoVarsityCroptop.jpg', 'front'),
       (9, 'Ao/AoVarsityCroptopsau.jpg', 'back');

-- Áo MLB vintage
INSERT INTO ProductImage (productId, imageUrl, imageUI)
VALUES (10, 'Ao/AoVintage.jpg', 'front'),
       (10, 'Ao/AoVintageSau.jpg', 'back');

-- Áo Unisex
INSERT INTO ProductImage (productId, imageUrl, imageUI)
VALUES (11, 'Ao/AoUnisex.jpg', 'front'),
       (11, 'Ao/AoUnisexsau.jpg', 'back');

-- Áo MLB Stree Big
INSERT INTO ProductImage (productId, imageUrl, imageUI)
VALUES (12, 'Ao/AoStreeBig.jpg', 'front'),
       (12, 'Ao/AoStreeBigSau.jpg', 'back');

       -- Quần Short (AaShort)
INSERT INTO ProductImage (productId, imageUrl, imageUI)
VALUES (13, 'Quan/QuanAaShort.png', 'front');

-- Quần Jogging các màu
INSERT INTO ProductImage (productId, imageUrl, imageUI)
VALUES (14, 'Quan/QuanJogging.png', 'front'),
       (14, 'Quan/QuanJoggingBe.png', 'front'),
       (14, 'Quan/QuanJoggingTrang.png', 'front');

-- Quần Kaki
INSERT INTO ProductImage (productId, imageUrl, imageUI)
VALUES (15, 'Quan/QuanKaki.png', 'front'),
       (15, 'Quan/QuanKakiNau.png', 'front'),
       (15, 'Quan/QuanKakiTrang.png', 'front');

-- Quần Style
INSERT INTO ProductImage (productId, imageUrl, imageUI)
VALUES (16, 'Quan/QuanStyle.png', 'front'),
       (16, 'Quan/QuanStyleKhoi.png', 'front'),
       (16, 'Quan/QuanStyleXanh.png', 'front');

-- Quần Tây
INSERT INTO ProductImage (productId, imageUrl, imageUI)
VALUES (17, 'Quan/QuanTay.png', 'front'),
       (17, 'Quan/QuanTayNau.png', 'front'),
       (17, 'Quan/QuanTayTrang.png', 'front');
INSERT INTO ProductImage (productId, imageUrl, imageUI)
VALUES (18, 'Giay/GiayPuma.png', 'front'),
       (19, 'Giay/GiayDIncox.png', 'front');
INSERT INTO ProductImage (productId, imageUrl, imageUI)
VALUES (20, 'PhuKien/Gio.png', 'front'),
       (21, 'PhuKien/GioDen.png', 'front'),
       (22, 'PhuKien/TuiMidori.png', 'front'),
       (23, 'PhuKien/TuiMidoriNau.png', 'front'),
       (24, 'PhuKien/TuiXach.png', 'front');
       --ProductVariant
       -- Áo Om (productId = 1)
INSERT INTO ProductVariant (productId, color, size, stock) VALUES
(1, N'Kem',  'M', 10),
(1, N'Kem',  'L', 10);

-- Áo Om Body (productId = 2)
INSERT INTO ProductVariant (productId, color, size, stock) VALUES
(2, N'Trắng',  'M', 8),
(2, N'Trắng',  'L', 6);

-- Áo Cổ Rộng (productId = 3)
INSERT INTO ProductVariant (productId, color, size, stock) VALUES
(3, N'Xanh', 'M', 5),
(3, N'Xanh', 'L', 5);

-- Áo Sọc (productId = 4)
INSERT INTO ProductVariant (productId, color, size, stock) VALUES
(4, N'Vàng Trắng', 'M', 7),
(4, N'Vàng Trắng', 'L', 7);

-- Áo Cotton (productId = 5)
INSERT INTO ProductVariant (productId, color, size, stock) VALUES
(5, N'Xám', 'M', 12),
(5, N'Xám', 'L', 10);

-- Áo Floral Croptop (productId = 6)
INSERT INTO ProductVariant (productId, color, size, stock) VALUES
(6, N'Trắng', 'M', 8),
(6, N'Trắng', 'L', 6);

-- Áo Heart Croptop (productId = 7)
INSERT INTO ProductVariant (productId, color, size, stock) VALUES
(7, N'Trắng', 'M', 7),
(7, N'Trắng', 'L', 5);

-- Áo Stree Big (productId = 8)
INSERT INTO ProductVariant (productId, color, size, stock) VALUES
(8, N'Đen', 'M', 6),
(8, N'Đen', 'L', 8);

-- Áo Unisex (productId = 9)
INSERT INTO ProductVariant (productId, color, size, stock) VALUES
(9, N'Đen', 'M', 8),
(9, N'Đen', 'L', 7);

-- Áo Varsity Croptop (productId = 10)
INSERT INTO ProductVariant (productId, color, size, stock) VALUES
(10, N'Trắng/Xanh', 'M', 5),
(10, N'Trắng/Xanh', 'L', 5);

-- Áo Vintage (productId = 11)
INSERT INTO ProductVariant (productId, color, size, stock) VALUES
(11, N'Trắng', 'M', 6),
(11, N'Trắng', 'L', 6);

-- Áo Sweatshirt (productId = 12)
INSERT INTO ProductVariant (productId, color, size, stock) VALUES
(12, N'Xám', 'M', 5),
(12, N'Xám', 'L', 5);

-- Quần Short (productId = 13)
INSERT INTO ProductVariant (productId, color, size, stock) VALUES
(13, N'Đen', 'M', 10),
(13, N'Đen', 'L', 10);

-- Quần Jogging (productId = 14)
INSERT INTO ProductVariant (productId, color, size, stock) VALUES
(14, N'Be', 'M', 6),
(14, N'Trắng', 'M', 6),
(14, N'Đen', 'L', 6);

-- Quần Kaki (productId = 15)
INSERT INTO ProductVariant (productId, color, size, stock) VALUES
(15, N'Be', 'M', 5),
(15, N'Nâu', 'L', 4),
(15, N'Trắng', 'M', 5);

-- Quần Style (productId = 16)
INSERT INTO ProductVariant (productId, color, size, stock) VALUES
(16, N'Xanh', 'M', 6),
(16, N'Khói', 'L', 5);

-- Quần Tây (productId = 17)
INSERT INTO ProductVariant (productId, color, size, stock) VALUES
(17, N'Nâu', 'M', 5),
(17, N'Trắng', 'L', 5);

-- Giày Puma (productId = 18)
INSERT INTO ProductVariant (productId, color, size, stock) VALUES
(18, N'Trắng/Xám', '41', 7),
(18, N'Trắng/Xám', '42', 7);

-- Giày DIncox (productId = 19)
INSERT INTO ProductVariant (productId, color, size, stock) VALUES
(19, N'Đen', '41', 5),
(19, N'Đen', '42', 5);

-- Phụ kiện các loại (Giỏ, Túi, v.v.)
INSERT INTO ProductVariant (productId, color, size, stock) VALUES
(20, N'Nâu', N'Free', 10),  -- Giỏ nâu
(21, N'Đen', N'Free', 10),  -- Giỏ đen
(22, N'Xanh', N'Free', 10), -- Tui Midori
(23, N'Nâu', N'Free', 10),  -- Tui Midori Nâu
(24, N'Đen', N'Free', 10);  -- Tui xách
