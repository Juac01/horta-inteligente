create schema horta;
use horta;
DROP TABLE fruta;

CREATE TABLE fruta(
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(35) NOT NULL,
    data_registro DATE NOT NULL,
    status_fruta VARCHAR(50)
);

select * from fruta;