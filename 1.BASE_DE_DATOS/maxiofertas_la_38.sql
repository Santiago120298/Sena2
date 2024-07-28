-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MAXIOFERTAS_LA_38
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MAXIOFERTAS_LA_38
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MAXIOFERTAS_LA_38` DEFAULT CHARACTER SET utf8 ;
USE `MAXIOFERTAS_LA_38` ;

-- -----------------------------------------------------
-- Table `MAXIOFERTAS_LA_38`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MAXIOFERTAS_LA_38`.`usuarios` (
  `numero_doc` INT NOT NULL,
  `tipo_doc` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` INT NULL,
  `rol` VARCHAR(45) NULL,
  `fecha_nacimiento` DATE NULL,
  `correo` VARCHAR(45) NULL,
  `contraseña` int (45) null,
  `contraseña_confirmada` int (45) null,
  PRIMARY KEY (`numero_doc`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MAXIOFERTAS_LA_38`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MAXIOFERTAS_LA_38`.`categoria` (
  `id_categoria` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MAXIOFERTAS_LA_38`.`sub_categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MAXIOFERTAS_LA_38`.`sub_categorias` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `categoria_id_categoria` INT NOT NULL,
  PRIMARY KEY (`id`, `categoria_id_categoria`),
  INDEX `fk_sub_categorias_categoria1_idx` (`categoria_id_categoria` ASC),
  CONSTRAINT `fk_sub_categorias_categoria1`
    FOREIGN KEY (`categoria_id_categoria`)
    REFERENCES `MAXIOFERTAS_LA_38`.`categoria` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MAXIOFERTAS_LA_38`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MAXIOFERTAS_LA_38`.`producto` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `lote` VARCHAR(45) NULL,
  `tamaño` VARCHAR(45) NULL,
  `precio` VARCHAR(45) NULL,
    `disponibilidad` INT NULL,
  `caracteristicas` VARCHAR(45) NULL,
  `sub_categorias_id` INT NOT NULL,
  `sub_categorias_categoria_id_categoria` INT NOT NULL,
  PRIMARY KEY (`id`, `sub_categorias_id`, `sub_categorias_categoria_id_categoria`),
  INDEX `fk_producto_sub_categorias1_idx` (`sub_categorias_id` ASC, `sub_categorias_categoria_id_categoria` ASC),
  CONSTRAINT `fk_producto_sub_categorias1`
    FOREIGN KEY (`sub_categorias_id` , `sub_categorias_categoria_id_categoria`)
    REFERENCES `MAXIOFERTAS_LA_38`.`sub_categorias` (`id` , `categoria_id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `MAXIOFERTAS_LA_38`.`servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MAXIOFERTAS_LA_38`.`servicios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo_servicio` VARCHAR(45) NULL,
  `caracteristicas_servicio` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MAXIOFERTAS_LA_38`.`carrito de compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MAXIOFERTAS_LA_38`.`carrito de compras` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha_compra` DATE NULL,
  `cantidad_productos` VARCHAR(45) NULL,
  `valor_producto` VARCHAR(45) NULL,
  `valor_total` VARCHAR(45) NULL,
  `metodos_pago` VARCHAR(45) NULL,
  `servicios_id` INT NOT NULL,
  `usuarios_numero_doc` INT NOT NULL,
  `producto_id` INT NOT NULL,
  `producto_sub_categorias_id` INT NOT NULL,
  `producto_sub_categorias_categoria_id_categoria` INT NOT NULL,
  PRIMARY KEY (`id`, `servicios_id`, `producto_id`, `producto_sub_categorias_id`, `producto_sub_categorias_categoria_id_categoria`, `usuarios_numero_doc`),
  INDEX `fk_carrito de compras_servicios1_idx` (`servicios_id` ASC),
  INDEX `fk_carrito de compras_usuarios1_idx` (`usuarios_numero_doc` ASC),
  INDEX `fk_carrito de compras_producto1_idx` (`producto_id` ASC, `producto_sub_categorias_id` ASC, `producto_sub_categorias_categoria_id_categoria` ASC),
  CONSTRAINT `fk_carrito de compras_servicios1`
    FOREIGN KEY (`servicios_id`)
    REFERENCES `MAXIOFERTAS_LA_38`.`servicios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carrito de compras_usuarios1`
    FOREIGN KEY (`usuarios_numero_doc`)
    REFERENCES `MAXIOFERTAS_LA_38`.`usuarios` (`numero_doc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carrito de compras_producto1`
    FOREIGN KEY (`producto_id` , `producto_sub_categorias_id` , `producto_sub_categorias_categoria_id_categoria`)
    REFERENCES `MAXIOFERTAS_LA_38`.`producto` (`id` , `sub_categorias_id` , `sub_categorias_categoria_id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- Insertar 10 registros de ejemplo
-- Insertar 10 registros de ejemplo
INSERT INTO usuarios (numero_doc, tipo_doc, nombre, apellidos, direccion, telefono, rol, fecha_nacimiento, correo)
VALUES
(111222333, 'Cedula de Ciudadania', 'Carlos', 'Gomez', 'Calle 1, Bogota', '12345678', 2, '1995-03-20', 'carlos.gomez@email.com'),
(222333444, 'Cedula de Ciudadania', 'Ana', 'Martinez', 'Carrera 2, Bogota', '23456781', 2, '1980-12-10', 'ana.martinez@email.com'),
(333444555, 'Cedula de Ciudadania', 'Pedro', 'Rodriguez', 'Avenida 3, Bogota', '34567012', 2, '1992-06-05', 'pedro.rodriguez@email.com'),
(444555666, 'Cedula de Ciudadania', 'Laura', 'Hernandez', 'Calle 4, Bogota', '45670123', 2, '1988-09-15', 'laura.hernandez@email.com'),
(555666777, 'Cedula de Ciudadania', 'Sergio', 'Lopez', 'Carrera 5, Bogota', '56781234', 2, '1997-02-25', 'sergio.lopez@email.com'),
(666777888, 'Cedula de Ciudadania', 'Isabel', 'Gutierrez', 'Avenida 6, Bogota', '67892345', 2, '1983-07-30', 'isabel.gutierrez@email.com'),
(777888999, 'Cedula de Ciudadania', 'Juan', 'Ramirez', 'Calle 7, Bogota', '78901256', 2, '1990-11-08', 'juan.ramirez@email.com'),
(888999000, 'Cedula de Ciudadania', 'Elena', 'Diaz', 'Carrera 8, Bogota', '89012567', 2, '1985-04-18', 'elena.diaz@email.com'),
(999000111, 'Cedula de Ciudadania', 'Miguel', 'Fernandez', 'Avenida 9, Bogota', '92345678', 2, '1994-08-22', 'miguel.fernandez@email.com'),
(123456789, 'Cedula de Ciudadania', 'Julia', 'Lopez', 'Calle 10, Bogota', '98765210', 2, '1987-01-12', 'julia.lopez@email.com');

INSERT INTO categoria (id_categoria, nombre) VALUES (1, 'Frutas y Verduras');
INSERT INTO categoria (id_categoria, nombre) VALUES (2, 'Productos lácteos');
INSERT INTO categoria (id_categoria, nombre) VALUES (3, 'Carnes y Aves');
INSERT INTO categoria (id_categoria, nombre) VALUES (4, 'Productos de limpieza');
INSERT INTO categoria (id_categoria, nombre) VALUES (5, 'Bebidas y Refrescos');

INSERT INTO sub_categorias (id, nombre, categoria_id_categoria) VALUES
  (1, 'Manzanas', 1),
  (2, 'Zanahorias', 1),
  (3, 'Leche', 2),
  (4, 'Queso', 2),
  (5, 'Pollo', 3),
  (6, 'Res', 3),
  (7, 'Detergente', 4),
  (8, 'Limpiadores multiusos', 4),
  (9, 'Agua', 5),
  (10, 'Soda', 5);


-- Agregar 20 registros adicionales
INSERT INTO producto (id, nombre, lote, tamaño, precio, disponibilidad, caracteristicas, sub_categorias_id, sub_categorias_categoria_id_categoria)
VALUES
  (21, 'Manzanas', 'L001', 'Mediano', '1250', 100, 'Frescas y jugosas', 1, 1),
  (22, 'Leche Entera', 'L002', '1 Litro', '1800', 50, 'Rica en calcio', 2, 2),
  (23, 'Pollo Fresco', 'L003', '1 Kg', '5000', 30, 'Calidad premium', 3, 3),
  (24, 'Detergente', 'L004', '500 ml', '3500', 80, 'Elimina manchas difíciles', 4, 4),
  (25, 'Refresco Cola', 'L005', '2 Litros', '1990', 120, 'Burbujeante y refrescante', 5, 5),
  (26, 'Peras', 'L006', 'Pequeño', '3000', 90, 'Dulces y nutritivas', 1, 1),
  (27, 'Queso Cheddar', 'L007', '200 g', '4500', 40, 'Ideal para sandwiches', 2, 2),
  (28, 'Carne Molida', 'L008', '500 g', '6500', 25, 'Para preparar hamburguesas', 3, 3),
  (29, 'Limpiavidrios', 'L009', '750 ml', '2990', 70, 'Cristales relucientes', 4, 4),
  (30, 'Agua Mineral', 'L010', '1.5 Litros', '990', 150, 'Pura y sin gas', 5, 5),
  -- Agrega aquí los 10 registros restantes según tus necesidades
  (31, 'Fresas', 'L011', 'Pequeño', '4500', 80, 'Dulces y antioxidantes', 1, 1),
  (32, 'Yogur Natural', 'L012', '150 g', '1200', 60, 'Fermentado y saludable', 2, 2),
  (33, 'Costillas de Cerdo', 'L013', '1 Kg', '8990', 35, 'Perfectas para asar', 3, 3),
  (34, 'Jabón en Barra', 'L014', '100 g', '1500', 90, 'Agradable fragancia', 4, 4),
  (35, 'Jugo de Naranja', 'L015', '1 Litro', '2250', 110, '100% natural', 5, 5),
  (36, 'Uvas', 'L016', 'Mediano', '5990', 75, 'Dulces y jugosas', 1, 1),
  (37, 'Yogur de Frutas', 'L017', '200 g', '1500', 55, 'Con trozos de frutas', 2, 2),
  (38, 'Filete de Salmón', 'L018', '300 g', '10990', 28, 'Rico en omega-3', 3, 3),
  (39, 'Limpiador Multiusos', 'L019', '500 ml', '4000', 65, 'Desinfecta y perfuma', 4, 4),
  (40, 'Gaseosa de Naranja', 'L020', '2 Litros', '1750', 130, 'Sabor frutal', 5, 5);

INSERT INTO servicios (id,tipo_servicio, caracteristicas_servicio)
VALUES
  ('Envío a Domicilio', 'Entrega rápida y segura.'),
  ('Recoger en Tienda', 'productos directamente en la tienda.');
  

 INSERT INTO `MAXIOFERTAS_LA_38`.`carrito de compras` (
  `fecha_compra`, `cantidad_productos`, `valor_producto`, `valor_total`,
  `metodos_pago`, `servicios_id`, `usuarios_numero_doc`,
  `producto_id`, `producto_sub_categorias_id`, `producto_sub_categorias_categoria_id_categoria`
) VALUES
-- Registro 1
('2024-03-01', '3', '4000', '12000', 'Tarjeta de crédito', 1, 111222333, 21, 1, 1),
-- Registro 2
('2024-03-02', '2', '1800', '3600', 'Efectivo', 2, 222333444, 22, 3, 2),
-- Registro 3
('2024-03-03', '1', '5000', '5000', 'Transferencia bancaria', 1, 333444555, 23, 5, 3),
-- Registro 4
('2024-03-04', '4', '6500', '26000', 'Tarjeta de débito', 2, 444555666, 24, 7, 4),
-- Registro 5
('2024-03-05', '2', '1990', '3980', 'Efectivo', 1, 555666777, 25, 9, 5),
-- Registro 6
('2024-03-06', '3', '3000', '9000', 'Transferencia bancaria', 2, 666777888, 26, 1, 1),
-- Registro 7
('2024-03-07', '1', '4500', '4500', 'Tarjeta de crédito', 1, 777888999, 27, 3, 2),
-- Registro 8
('2024-03-08', '5', '1200', '6000', 'Efectivo', 2, 888999000, 28, 5, 3),
-- Registro 9
('2024-03-09', '2', '2990', '5980', 'Tarjeta de débito', 1, 999000111, 29, 7, 4),
-- Registro 10
('2024-03-10', '1', '1750', '1750', 'Transferencia bancaria', 2, 123456789, 30, 9, 5),
-- Registros adicionales (11 al 25)
-- ... (Agrega los registros restantes según tus necesidades)
-- Registro 11
('2024-03-11', '4', '4500', '18000', 'Tarjeta de crédito', 1, 111222333, 31, 1, 1),
-- Registro 12
('2024-03-12', '2', '1200', '2400', 'Efectivo', 2, 222333444, 32, 3, 2),
-- Registro 13
('2024-03-13', '3', '8990', '26970', 'Transferencia bancaria', 1, 333444555, 33, 5, 3),
-- Registro 14
('2024-03-14', '1', '1500', '1500', 'Tarjeta de débito', 2, 444555666, 34, 7, 4),
-- Registro 15
('2024-03-15', '5', '2250', '11250', 'Efectivo', 1, 555666777, 35, 9, 5),
-- Registro 16
('2024-03-16', '2', '5990', '11980', 'Transferencia bancaria', 2, 666777888, 36, 1, 1),
-- Registro 17
('2024-03-17', '3', '1500', '4500', 'Tarjeta de crédito', 1, 777888999, 37, 3, 2),
-- Registro 18
('2024-03-18', '1', '10990', '10990', 'Efectivo', 2, 888999000, 38, 5, 3),
-- Registro 19
('2024-03-19', '4', '4000', '16000', 'Tarjeta de débito', 1, 999000111, 39, 7, 4),
-- Registro 20
('2024-03-20', '2', '1750', '3500', 'Transferencia bancaria', 2, 123456789, 40, 9, 5),
-- Registro 21
('2024-03-21', '1', '4500', '4500', 'Tarjeta de crédito', 1, 111222333, 21, 1, 1),
-- Registro 22
('2024-03-22', '5', '1200', '6000', 'Efectivo', 2, 222333444, 22, 3, 2),
-- Registro 23
('2024-03-23', '2', '2990', '5980', 'Tarjeta de débito', 1, 333444555, 23, 5, 3),
-- Registro 24
('2024-03-24', '1', '1750', '1750', 'Transferencia bancaria', 2, 444555666, 24, 7, 4),
-- Registro 25
('2024-03-25', '4', '4500', '18000', 'Efectivo', 1, 555666777, 25, 9, 5);

select * from `carrito de compras`;
select * from `categoria`;
select * from `producto`;
select * from `sub_categorias`;
select * from `usuarios`;
select * from `servicios`;

-- -----------------------------------------FUNCIONES------------------------------------------
-- 1---------------------------------------------------------
DELIMITER //
CREATE FUNCTION concatenar_con_separador(nombre VARCHAR(255), apellido VARCHAR(255))
RETURNS VARCHAR(520)
deterministic
BEGIN
  DECLARE concatenar_nombre_apellido VARCHAR(520);
  SET concatenar_nombre_apellido = CONCAT(nombre,'  ', apellido);
  RETURN concatenar_nombre_apellido;
END //
DELIMITER ;

-- 2-------------------------------------------------------------------

DELIMITER //
CREATE FUNCTION calcular_multiplicacion_por_id(producto_id INT)
RETURNS INT(11)
deterministic
BEGIN
  DECLARE resultado INT(11);

  SELECT precio * disponibilidad INTO resultado
  FROM producto
  WHERE id = producto_id;

  RETURN resultado;
END //
DELIMITER ;
-- 3----------------------------------------------------------------------------
DELIMITER //

CREATE FUNCTION UPPER_DEF(nombre VARCHAR(255))
RETURNS VARCHAR(255)
deterministic
BEGIN
  DECLARE resultado VARCHAR(255);
  
  SET resultado = UPPER(nombre);
  
  RETURN resultado;
END //

DELIMITER ;
SELECT UPPER_DEF('nombre') AS TextoMayusculas from producto;
-- 4--------------------------------------------------------------------------
DELIMITER //

CREATE FUNCTION lower_DEF(nombre VARCHAR(255))
RETURNS VARCHAR(255)
deterministic
BEGIN
  DECLARE resultado VARCHAR(255);
  
  SET resultado = lower(nombre);
  
  RETURN resultado;
END //
DELIMITER ;


UPDATE producto
SET nombre = lower_DEF(nombre);
SELECT * FROM producto;
SET SQL_SAFE_UPDATES = 0;
drop function calcular_multiplicacion_por_id;
SELECT id, calcular_multiplicacion_por_id(id) AS resultado
FROM producto;
SELECT concatenar_con_separador (id,nombre) AS cadena_concatenada from producto;
   -- ---------------------------------------triggers-------------------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER before_usuarios_update BEFORE UPDATE ON usuarios
FOR EACH ROW
BEGIN
    INSERT INTO cambios_usua (Nombre, Direccion, Telefono, Correo)
    VALUES (OLD.Nombre, OLD.Direccion, OLD.Telefono, OLD.Correo);
END; // DELIMITER ;

DELIMITER //
CREATE TRIGGER after_usuarios_update
AFTER UPDATE ON usuarios
FOR EACH ROW
BEGIN
        INSERT INTO cambios_usua (Nombre, Direccion, Telefono, Correo)
        VALUES (OLD.Nombre, OLD.Direccion, OLD.Telefono, OLD.Correo);
END; // 
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_categoria_update
BEFORE update ON categoria
FOR EACH ROW
BEGIN
    INSERT INTO cambios_cat (Id_Categoria, Nombre)
    VALUES (NEW.Id_Categoria, NEW.Nombre);
END; // 
DELIMITER ;

DELIMITER //
CREATE TRIGGER after_categoria_update
AFTER UPDATE ON categoria
FOR EACH ROW
BEGIN
    INSERT INTO cambios_cat (Id_Categoria, Nombre)
    VALUES (OLD.Id_Categoria, OLD.Nombre);
END; // 
DELIMITER ;

-- -----------------------------------------Procedimientos---------------------------------------------------------------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE agregar_usuario (
    IN numero_doc INT,
    IN tipo_doc VARCHAR(45),
    IN nombre VARCHAR(45),
    IN apellidos VARCHAR(45),
    IN direccion VARCHAR(45),
    IN telefono INT,
    IN rol VARCHAR (45),
    IN fecha_nacimiento DATE,
    IN correo VARCHAR(45)
)
BEGIN
    INSERT INTO usuarios (numero_doc, tipo_doc, nombre, apellidos, direccion, telefono, rol, fecha_nacimiento, correo)
    VALUES (numero_doc, tipo_doc, nombre, apellidos, direccion, telefono, rol, fecha_nacimiento, correo);
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE agregar_producto (
    IN nombre VARCHAR(45),
    IN tamaño VARCHAR(45),
    IN precio DECIMAL(10,2),
    IN disponibilidad INT,
    IN caracteristicas VARCHAR(255),
    IN subcategoria_id INT
)
BEGIN
    INSERT INTO producto (nombre, tamaño, precio, disponibilidad, caracteristicas, sub_categorias_id)
    VALUES (nombre, tamaño, precio, disponibilidad, caracteristicas, subcategoria_id);
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE eliminar_producto (
    IN producto_id INT
)
BEGIN
    DELETE FROM producto WHERE id = producto_id;
END //

DELIMITER ;
-- ---------------------------------Vistas---------------------------------------------------------
-- Productos disponibles
CREATE VIEW vista_productos_disponibles AS
SELECT * FROM producto
WHERE disponibilidad <= 15;
-- -----------------------------------------
-- Ofertas
CREATE VIEW vista_productos_economicos AS
SELECT * FROM producto WHERE precio <= 3000;
-- ------------------------------------------


-- -------------------------------UTILIDADES DE LA BASE DE DATOS ----------------------------------------------------------------------
drop view vista_productos_economicos;
-- ----------------------------------------
-- Desactivar llaves foraneas
SET foreign_key_checks = 0;
-- Activar llaves foráneas
SET foreign_key_checks = 1;
-- --------------------------------------------------------------------------------
-- Eliminar restricciones de clave externa existentes
ALTER TABLE `carrito de compras`
DROP FOREIGN KEY fk_carrito_de_compras_usuarios1;

-- Agregar nuevas restricciones con ON DELETE CASCADE
ALTER TABLE `carrito de compras`
ADD CONSTRAINT fk_carrito_de_compras_usuarios1 FOREIGN KEY (usuarios_numero_doc)
REFERENCES usuarios (numero_doc) ON DELETE CASCADE;

select * from vista_productos_disponibles;







