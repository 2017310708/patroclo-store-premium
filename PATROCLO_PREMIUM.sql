CREATE DATABASE IF NOT EXISTS patroclo_store_premium;
USE patroclo_store_premium;

CREATE TABLE `categorias` (
  `id_categoria` int PRIMARY KEY,
  `nombre` varchar(255),
  `imagen_url` TEXT,
  `estado_auditoria` char,
  `fecha_creacion_auditoria` timestamp
);

CREATE TABLE `subcategorias` (
  `id_subcategoria` int,
  `id_categoria` int,
  `nombre` varchar(255),
  `imagen_url` TEXT,
  `estado_auditoria` char,
  `fecha_creacion_auditoria` timestamp
);

CREATE TABLE `productos` (
  `id_producto` int PRIMARY KEY,
  `id_subcategoria` int,
  `id_marca` int,
  `id_proveedor` int,
  `codigo` varchar(255),
  `nombre` varchar(255),
  `descripcion` varchar(255),
  `especificaciones` varchar(255),
  `precio_dolares` float,
  `stock` int,
  `imagen_url` TEXT,
  `informacion_fabricante_url` varchar(255),
  `estado_auditoria` char,
  `fecha_creacion_auditoria` timestamp
);

CREATE TABLE `proveedores` (
  `id_proveedor` int PRIMARY KEY,
  `nombre_comercial` varchar(255),
  `tipo_documento` char,
  `numero_documento` varchar(255),
  `estado_auditoria` char,
  `fecha_creacion_auditoria` timestamp
);

CREATE TABLE `proveedor_contactos` (
  `id_proveedor_contacto` int PRIMARY KEY,
  `id_proveedor` numbr,
  `nombre` varchar(255),
  `apellido_paterno` varchar(255),
  `apellido_materno` varchar(255),
  `tipo_documento` char,
  `numero_documento` varchar(255),
  `telefono` varchar(255),
  `correo` varchar(255),
  `estado_auditoria` char,
  `fecha_creacion_auditoria` timestamp
);

CREATE TABLE `producto_imagenes` (
  `id_producto_imagen` int PRIMARY KEY,
  `id_producto` int,
  `imagen_url` TEXT,
  `estado_auditoria` char,
  `fecha_creacion_auditoria` timestamp
);

CREATE TABLE `marcas` (
  `id_marca` int PRIMARY KEY,
  `nombre` varchar(255),
  `codigo_pais` varchar(255),
  `logo_url` varchar(255),
  `estado_auditoria` char,
  `fecha_creacion_auditoria` timestamp
);

CREATE TABLE `usuarios` (
  `id_usuario` int PRIMARY KEY,
  `id_rol` int,
  `username` varchar(255),
  `password` varchar(255),
  `nombre` varchar(255),
  `apellido_paterno` varchar(255),
  `apellido_materno` varchar(255),
  `tipo_documento` char,
  `numero_documento` varchar(255),
  `correo` varchar(255),
  `direccion` varchar(255),
  `telefono` varchar(255),
  `estado_auditoria` char,
  `fecha_creacion_auditoria` timestamp
);

CREATE TABLE `roles` (
  `id_rol` int PRIMARY KEY,
  `nombre` varchar(255),
  `estado_auditoria` char,
  `fecha_creacion_auditoria` timestamp
);

CREATE TABLE `pedidos` (
  `id_pedido` int PRIMARY KEY,
  `codigo` varchar(255),
  `id_usuario_cliente` int,
  `id_usuario_vendedor` int,
  `fecha_entrega` timestamp,
  `fecha_pago` timestamp,
  `fecha_anulado` timestamp,
  `estado_pedido` char,
  `motivo_anulado` varchar(255),
  `precio_total` int,
  `moneda` char,
  `metodo_pago` char,
  `codigo_envio` varchar(255),
  `observacion` varchar(255),
  `estado_auditoria` char,
  `fecha_creacion_auditoria` timestamp
);

CREATE TABLE `pedido_detalles` (
  `id_pedido_detalle` int PRIMARY KEY,
  `id_pedido` int,
  `id_producto` int,
  `cantidad` int,
  `precio_unitario` decimal,
  `porcentaje_descuento` decimal,
  `estado_auditoria` char,
  `fecha_creacion_auditoria` timestamp
);

ALTER TABLE `subcategorias` ADD FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

ALTER TABLE `productos` ADD FOREIGN KEY (`id_subcategoria`) REFERENCES `subcategorias` (`id_subcategoria`);

ALTER TABLE `productos` ADD FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`);

ALTER TABLE `productos` ADD FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);

ALTER TABLE `proveedor_contactos` ADD FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);

ALTER TABLE `producto_imagenes` ADD FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

ALTER TABLE `usuarios` ADD FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

ALTER TABLE `pedidos` ADD FOREIGN KEY (`id_usuario_cliente`) REFERENCES `usuarios` (`id_usuario`);

ALTER TABLE `pedidos` ADD FOREIGN KEY (`id_usuario_vendedor`) REFERENCES `usuarios` (`id_usuario`);

ALTER TABLE `pedido_detalles` ADD FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`);

ALTER TABLE `pedido_detalles` ADD FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

INSERT INTO categorias (id_categoria, nombre, imagen_url, estado_auditoria, fecha_creacion_auditoria)
VALUES (1, 'Computadoras', 'https://imgs.search.brave.com/RzunXGHZGbSRvP-A4DKt0HFooRdcEssMe--o0y2j-vk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9waXNj/ZXMuYmJ5c3RhdGlj/LmNvbS9pbWFnZTIv/QmVzdEJ1eV9VUy9k/YW0vcG9sLVNPTC0x/MDc2ODEtTXVsdGlW/ZW5kb3JDYW1wYWln/bi1CdXlpbmdHdWlk/ZV9ERVItNGMwYmMz/YjYtMDFlNC00OTc4/LWFlOGUtMzhlODU0/OGQwMmEzLmpwZztt/YXhIZWlnaHQ9NDgz/O21heFdpZHRoPTcx/MT9mb3JtYXQ9d2Vi/cA', 'A', CURRENT_TIMESTAMP),
       (2, 'Componentes', 'https://imgs.search.brave.com/p8K68NshC3G93rccbA8ZvV7S5WpXVz89HABouuy4iNE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzA0LzYzLzk5LzM5/LzM2MF9GXzQ2Mzk5/MzkwMF9Tc3d6aVNJ/Z2czUFZZZVhCTlMx/SXBWUkgwZUxJTmli/Yi5qcGc', 'A', CURRENT_TIMESTAMP),
       (3, 'Perifericos', 'https://imgs.search.brave.com/OHmb8QY9TOop1_Vs-7HaedaJ0TuI7Er2AQCff8gGHKM/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9hc3Nl/dHMyLnJhemVyem9u/ZS5jb20vaW1hZ2Vz/L3BueC5hc3NldHMv/ODEyN2RmMGRmODQz/M2FkYTI5NmE3MzJi/MjNmM2I5YjQvcGMt/Y2F0ZWdvcnktaGVh/ZHNldC1rcmFrZW4t/djQtcHJvLTUwMHg1/MDAud2VicA', 'A', CURRENT_TIMESTAMP),
       (4, 'Software', 'https://i5.walmartimages.com/seo/Microsoft-Office-Home-Business-2024-1-User-License-Product-Key-Code-Software-Key-Card_df498121-499c-4939-8f3a-f15854f2a173.dd6a30e2a0a78b2a22afeb919a63aecb.png?odnHeight=640&odnWidth=640&odnBg=FFFFFF', 'A', CURRENT_TIMESTAMP);

-- Insertar marcas
INSERT INTO marcas (id_marca, nombre, codigo_pais, logo_url, estado_auditoria, fecha_creacion_auditoria)
VALUES 
(1, 'ASUS', 'TW', 'https://dlcdnimgs.asus.com/websites/global/Sno/79183.jpg', 'A', CURRENT_TIMESTAMP),
(2, 'MSI', 'TW', 'https://1000logos.net/wp-content/uploads/2018/10/MSI-Logo-768x432.png', 'A', CURRENT_TIMESTAMP),
(3, 'Logitech', 'CH', 'https://logos-world.net/wp-content/uploads/2020/11/Logitech-Logo.png', 'A', CURRENT_TIMESTAMP),
(4, 'Microsoft', 'US', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Microsoft_logo_%282012%29.svg/2560px-Microsoft_logo_%282012%29.svg.png', 'A', CURRENT_TIMESTAMP),
(5, 'AMD', 'US', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/AMD_Logo.svg/2560px-AMD_Logo.svg.png', 'A', CURRENT_TIMESTAMP),
(6, 'Adobe', 'US', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Adobe_Corporate_Logo.png/2560px-Adobe_Corporate_Logo.png', 'A', CURRENT_TIMESTAMP);

-- Insertar subcategorías
INSERT INTO subcategorias (id_subcategoria, id_categoria, nombre, imagen_url, estado_auditoria, fecha_creacion_auditoria)
VALUES 
(1, 1, 'Laptops', 'https://www.asus.com/media/Odin/Websites/global/Series/12.png', 'A', CURRENT_TIMESTAMP),
(2, 1, 'PCs de Escritorio', 'https://m.media-amazon.com/images/I/71p7alDhefL.jpg', 'A', CURRENT_TIMESTAMP),
(3, 2, 'Tarjetas Gráficas', 'https://compumasperu.com/cdn/shop/files/1024_4.png?v=1740066860', 'A', CURRENT_TIMESTAMP),
(4, 2, 'Procesadores', 'https://compumasperu.com/cdn/shop/files/616656-amd-ryzen-5-5000-series-PIB-fan-1260x709_b3823d5d-d216-491c-a1f5-a32abc19027d.jpg?v=1698710219', 'A', CURRENT_TIMESTAMP),
(5, 3, 'Teclados', 'https://resource.logitechg.com/w_1600,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/gaming/en/products/pro-x-keyboard/pro-x-keyboard-gallery-1.png?v=1', 'A', CURRENT_TIMESTAMP),
(6, 3, 'Mouse', 'https://resource.logitechg.com/w_1800,h_1800,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/
content/dam/gaming/en/products/pro-wireless-gaming-mouse/pro-wireless-carbon-gallery-1.png', 'A', CURRENT_TIMESTAMP),
(7, 4, 'Software de Oficina', 'https://media.licdn.com/dms/image/v2/D4D12AQFrl3TCgFVdZw/article-cover_image-shrink_600_2000/article-cover_image-shrink_600_2000/0/1698419443364?e=2147483647&v=beta&t=WQiUB2zoMQ3f8fJ_IiG6o2wNhgcjCjHmeUeSsAwkTgo', 'A', CURRENT_TIMESTAMP),
(8, 4, 'Software de Diseño', 'https://www.adobe.com/content/dam/cc/icons/photoshop.svg', 'A', CURRENT_TIMESTAMP);

-- Insertar productos
INSERT INTO productos (id_producto, id_subcategoria, id_marca, id_proveedor, codigo, nombre, descripcion, especificaciones, precio_dolares, stock, imagen_url, informacion_fabricante_url, estado_auditoria, fecha_creacion_auditoria)
VALUES 
(1, 1, 1, null, 'ROG-STRIX-G15', 'ASUS ROG Strix G15', 'Laptop gaming de alto rendimiento', 'AMD Ryzen 9 5900HX, RTX 3080, 32GB RAM, 1TB SSD', 1999.99, 10, 'https://m.media-amazon.com/images/I/81fZmxBbQgL._AC_SL1500_.jpg', 'https://rog.asus.com/laptops/rog-strix/rog-strix-g15-series/', 'A', CURRENT_TIMESTAMP),
(2, 3, 2, null, 'RTX4090-GAMING-X-TRIO', 'MSI GeForce RTX 4090 GAMING X TRIO', 'Tarjeta gráfica de última generación', 'NVIDIA GeForce RTX 4090, 24GB GDDR6X, PCIe 4.0', 1599.99, 5, 'https://m.media-amazon.com/images/I/81KR0fO8WgL.__AC_SX300_SY300_QL70_ML2_.jpg', 'https://www.msi.com/Graphics-Card/GeForce-RTX-4090-GAMING-X-TRIO-24G', 'A', CURRENT_TIMESTAMP),
(3, 5, 3, null, 'PRO-X', 'Logitech G Pro X Mechanical Gaming Keyboard', 'Teclado mecánico profesional para gaming', 'Switches GX Blue Clicky, RGB, Diseño TKL', 129.99, 20, 'https://resource.logitechg.com/w_1600,c_limit,
q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/gaming/en/products/pro-x-keyboard/pro-x-keyboard-gallery-1.
png?v=1', 'https://www.logitechg.com/en-us/products/gaming-keyboards/pro-x-gaming-keyboard.html', 'A', CURRENT_TIMESTAMP),
(4, 2, 1, null, 'ROG-STRIX-GT35', 'ASUS ROG Strix GT35', 'PC Gaming de alto rendimiento', 'Intel Core i9-13900K, RTX 4090, 64GB RAM, 2TB NVMe SSD', 3999.99, 5, 'https://dlcdnwebimgs.asus.com/gain/4B59F70A-32D0-4D99-BF87-9ED19AD0C1FA', 'https://rog.asus.com/desktop-pcs/rog-strix/rog-strix-gt35-series/', 'A', CURRENT_TIMESTAMP),
(5, 6, 3, null, 'G502-HERO', 'Logitech G502 HERO', 'Mouse gaming de alto rendimiento', 'Sensor HERO 25K, 11 botones programables, RGB, Pesos ajustables', 79.99, 30, 'https://resource.logitechg.com/w_692,c_limit,q_auto,f_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g502-hero/g502-hero-gallery-1.png', 'https://www.logitechg.com/en-us/products/gaming-mice/g502-hero-gaming-mouse.html', 'A', CURRENT_TIMESTAMP),
(6, 7, 4, null, 'O365-HOME', 'Microsoft 365 Family', 'Suite ofimática completa para toda la familia', '6 usuarios, Word, Excel, PowerPoint, 1TB OneDrive por usuario', 99.99, 100, 'https://oechsle.vteximg.com.br/arquivos/ids/17506128-1000-1000/imageUrl_1.jpg?v=638506072976500000', 'https://www.microsoft.com/microsoft-365/p/microsoft-365-family/cfq7ttc0k5dm', 'A', CURRENT_TIMESTAMP),
(7, 4, 5, null, 'RYZEN-7800X3D', 'AMD Ryzen 7 7800X3D', 'Procesador gaming de alto rendimiento con tecnología 3D V-Cache', 'AMD Zen 4, 8 núcleos/16 hilos, 5.0GHz Max Boost, 104MB Cache Total, Socket AM5', 449.99, 15, 'https://www.sercoplus.com/56782-large_default/procesador-amd-ryzen-7-7800x3d.jpg', 'https://www.amd.com/en/products/cpu/amd-ryzen-7-7800x3d', 'A', CURRENT_TIMESTAMP),
(8, 8, 6, null, 'PHOTOSHOP-2024', 'Adobe Photoshop 2024', 'Software profesional de edición de imágenes', 'Licencia anual, Soporte para IA generativa, Herramientas avanzadas de selección, Compatible con Windows y Mac', 239.88, 999, 'https://cdn.pixabay.com/photo/2015/11/27/10/55/photoshop-1065296_960_720.jpg', 'https://www.adobe.com/products/photoshop.html', 'A', CURRENT_TIMESTAMP);

-- Insertar imágenes de productos
INSERT INTO producto_imagenes (id_producto_imagen, id_producto, imagen_url, estado_auditoria, fecha_creacion_auditoria)
VALUES 
(1, 1, 'https://m.media-amazon.com/images/I/81fZmxBbQgL._AC_SL1500_.jpg', 'A', CURRENT_TIMESTAMP),
(2, 1, 'https://m.media-amazon.com/images/I/71iORGjNL3L._AC_SL1500_.jpg', 'A', CURRENT_TIMESTAMP),
(3, 1, 'https://m.media-amazon.com/images/I/81Be5Y27lZL._AC_SL1500_.jpg', 'A', CURRENT_TIMESTAMP),
(4, 2, 'https://m.media-amazon.com/images/I/81KR0fO8WgL.__AC_SX300_SY300_QL70_ML2_.jpg', 'A', CURRENT_TIMESTAMP),
(5, 2, 'https://m.media-amazon.com/images/I/81Gg4M95vmL._AC_SY355_.jpg', 'A', CURRENT_TIMESTAMP),
(6, 2, 'https://m.media-amazon.com/images/I/81c03RIYWRL._AC_SY355_.jpg', 'A', CURRENT_TIMESTAMP),
(7, 3, 'https://resource.logitechg.com/w_1600,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/gaming/en/products/pro-x-keyboard/pro-x-keyboard-gallery-1.png?v=1', 'A', CURRENT_TIMESTAMP),
(8, 3, 'https://resource.logitechg.com/w_1600,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/gaming/en/products/pro-x-keyboard/pro-x-keyboard-gallery-3.png?v=1', 'A', CURRENT_TIMESTAMP),
(9, 3, 'https://resource.logitechg.com/w_1600,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/
gaming/en/products/pro-x-keyboard/pro-x-keyboard-gallery-2.png?v=1', 'A', CURRENT_TIMESTAMP),
(10, 4, 'https://dlcdnwebimgs.asus.com/gain/4B59F70A-32D0-4D99-BF87-9ED19AD0C1FA', 'A', CURRENT_TIMESTAMP),
(11, 4, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUDcI0SH34Dt5S5_62lOYi0JNmnYoBnRiqHg&s', 'A', CURRENT_TIMESTAMP),
(12, 4, 'https://dlcdnwebimgs.asus.com/files/media/E6B9B94F-F16B-47C2-81B3-02E598DD6FEB/v4//images/video/thermal_1x.jpg', 'A', CURRENT_TIMESTAMP),
(13, 5, 'https://resource.logitechg.com/w_692,c_limit,q_auto,f_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g502-hero/g502-hero-gallery-1.png', 'A', CURRENT_TIMESTAMP),
(14, 5, 'https://resource.logitechg.com/w_692,c_limit,q_auto,f_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g502-hero/g502-hero-gallery-2.png', 'A', CURRENT_TIMESTAMP),
(15, 5, 'https://resource.logitechg.com/w_692,c_limit,q_auto,f_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g502-hero/g502-hero-gallery-3.png', 'A', CURRENT_TIMESTAMP),
(16, 6, 'https://oechsle.vteximg.com.br/arquivos/ids/17506128-1000-1000/imageUrl_1.jpg?v=638506072976500000', 'A', CURRENT_TIMESTAMP),
(17, 6, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq1alDeGFCfVx2YHvrFBVPUMuUUTAo51ITLQ&s', 'A', CURRENT_TIMESTAMP),
(18, 6, 'https://imagedelivery.net/4fYuQyy-r8_rpBpcY7lH_A/falabellaPE/128505937_01/w=800,h=800,fit=pad', 'A', CURRENT_TIMESTAMP),
(19, 7, 'https://www.sercoplus.com/56782-large_default/procesador-amd-ryzen-7-7800x3d.jpg', 'A', CURRENT_TIMESTAMP),
(20, 7, 'https://cgs-computer.pe/public_html/public/img/productos/qEaidW0nJ5QANLNvINhSINrOXcQEJjanyOHsYInplFDy7VVZbytCZKerCgNAj2HqLPZ13H7fbZH5VelK.jpg', 'A', CURRENT_TIMESTAMP),
(21, 7, 'https://cdn.mos.cms.futurecdn.net/V8jM5TCahc4LNw8cUBiZeY.jpg', 'A', CURRENT_TIMESTAMP),
(22, 8, 'https://cdn.pixabay.com/photo/2015/11/27/10/55/photoshop-1065296_960_720.jpg', 'A', CURRENT_TIMESTAMP),
(23, 8, 'https://fotoformacion.com/wp-content/uploads/2023/09/Photoshop-2024-Novedades-y-requisitos.jpg', 'A', CURRENT_TIMESTAMP),
(24, 8, 'https://creativepro.com/wp-content/uploads/2024/07/photoshop-july-2024-new-features-f.jpg', 'A', CURRENT_TIMESTAMP);


