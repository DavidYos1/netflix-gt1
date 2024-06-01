CREATE TABLE detalle (
                info_general VARCHAR(500) NOT NULL,
                reparto VARCHAR(150) NOT NULL,
                director VARCHAR(100) NULL,
                CONSTRAINT detalle_pk PRIMARY KEY (info_general)
);


CREATE TABLE suscripcion (
                metodo_pago VARCHAR(50) NOT NULL,
                precio_suscripcion INTEGER NOT NULL,
                duracion VARCHAR(25) NOT NULL,
                CONSTRAINT suscripcion_pk PRIMARY KEY (metodo_pago)
);


CREATE TABLE usuario (
                id_usuario INTEGER NOT NULL,
                nombre_usuario VARCHAR(50) NOT NULL,
                correo_usuario VARCHAR(100) NOT NULL,
                pin_usuario INTEGER NOT NULL,
                metodo_pago VARCHAR(50) NOT NULL,
                CONSTRAINT usuario_pk PRIMARY KEY (id_usuario),
                FOREIGN KEY (metodo_pago)
                REFERENCES suscripcion (metodo_pago)
                ON DELETE NO ACTION
                ON UPDATE NO ACTION
);


CREATE TABLE perfil (
                tipo_perfil VARCHAR(25) NOT NULL,
                nombre_perfil VARCHAR(30) NOT NULL,
                id_usuario INTEGER NOT NULL,
                CONSTRAINT perfil_pk PRIMARY KEY (tipo_perfil),
                FOREIGN KEY (id_usuario)
                REFERENCES usuario (id_usuario)
                ON DELETE NO ACTION
                ON UPDATE NO ACTION
);


CREATE TABLE serie (
                nombre_serie VARCHAR(100) NOT NULL,
                duracion_capitulo INTEGER NOT NULL,
                cantidad_capitulo INTEGER NOT NULL,
                fecha_serie INTEGER NOT NULL,
                tipo_perfil VARCHAR(25) NOT NULL,
                info_general VARCHAR(500) NOT NULL,
                CONSTRAINT serie_pk PRIMARY KEY (nombre_serie),
                FOREIGN KEY (info_general) 
                REFERENCES detalle (info_general),
                FOREIGN KEY (tipo_perfil)
                REFERENCES perfil (tipo_perfil)
                ON DELETE NO ACTION
                ON UPDATE NO ACTION
);


CREATE TABLE pelicula (
                nombre_pelicula VARCHAR(100) NOT NULL,
                duracion_pelicula INTEGER NOT NULL,
                fecha_pelicula INTEGER NOT NULL,
                tipo_perfil VARCHAR(25) NOT NULL,
                info_general VARCHAR(500) NOT NULL,
                CONSTRAINT pelicula_pk PRIMARY KEY (nombre_pelicula),
                FOREIGN KEY (info_general)
                REFERENCES detalle (info_general),
                FOREIGN KEY (tipo_perfil)
                REFERENCES perfil (tipo_perfil)
                ON DELETE NO ACTION
                ON UPDATE NO ACTION
);