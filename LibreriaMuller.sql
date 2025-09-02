CREATE DATABASE libreria;
USE libreria;

-- 2. Crear la tabla Autor
CREATE TABLE autor (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nombre_autor VARCHAR(50),
    apellido_autor VARCHAR(50)
);

-- 3. Crear la tabla Cliente
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre_cliente VARCHAR(50),
    apellido_cliente VARCHAR(50),
    email_cliente VARCHAR(100) UNIQUE,
    direccion_cliente VARCHAR(255),
    telefono_cliente VARCHAR(20)
);

-- 4. Crear la tabla Libro
CREATE TABLE libro (
    id_libro INT PRIMARY KEY AUTO_INCREMENT,
    titulo_libro VARCHAR(255),
    isbn VARCHAR(20) UNIQUE,
    precio DECIMAL(10, 2),
    stock INT,
    id_autor INT,
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
);

-- 5. Crear la tabla Pedido
CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    fecha_pedido DATE,
    estado_pedido VARCHAR(50),
    total_pedido DECIMAL(10, 2),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- 6. Crear la tabla intermedia Detalle_Pedido
CREATE TABLE detalle_pedido (
    id_detalle_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_libro INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_libro) REFERENCES libro(id_libro)
);
