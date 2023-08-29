
DROP DATABASE IF EXISTS ecommerce;
CREATE DATABASE ecommerce;
USE ecommerce;

-- Adicionado tipo de cliente para atender a questão "Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;"
CREATE TABLE clients(
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    cName VARCHAR(100) NOT NULL,
    typeClient ENUM('Pessoa física', 'Pessoa jurídica') NOT NULL,
    cpfCnpj VARCHAR(15) NOT NULL,
    cAddress VARCHAR(255) NOT NULL,
    CONSTRAINT unique_cpfcnpj_client UNIQUE(cpfCnpj)
);

CREATE TABLE product(
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(25)NOT NULL,
    category ENUM('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos','Móveis') NOT NULL,
    rating FLOAT DEFAULT 0,
    Pdescription varchar(100),
    Pvalue FLOAT NOT NULL,
    size VARCHAR(10)
);

CREATE TABLE orders(
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    orderStatus ENUM('Cancelado', 'Confirmado','Em processamento', 'Enviado', 'Entregue', 'Aguardando pagamento') DEFAULT 'Em processamento',
    orderDescrption VARCHAR(255),
    sendValue FLOAT DEFAULT 10,
    paymentCash BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_orders_client FOREIGN KEY(idOrderClient) REFERENCES clients(idClient)
);

-- Adicionada uma tabela referente a entrega para atender a questão "Entrega – Possui status e código de rastreio;"
CREATE TABLE delivery(
    idDelivery INT AUTO_INCREMENT PRIMARY KEY,
    iddOrder INT,
    deliveryStatus ENUM('Aguardando envio', 'A caminho', 'Entregue', 'Cancelado') DEFAULT 'Aguardando envio',
    trackingCode VARCHAR(25) NOT NULL,
    CONSTRAINT fk_delivery_order FOREIGN KEY(iddOrder) REFERENCES orders(idOrder)
);

-- Adicionado o tipo de pagamento para atender a questão "Pagamento – Pode ter cadastrado mais de uma forma de pagamento;"
CREATE TABLE payments(
    idPayment INT AUTO_INCREMENT PRIMARY KEY,
    idPClient INT,    
    typePayment ENUM('Boleto', 'Cartão', 'Dois cartões', 'PIX') NOT NULL,
    limitAvailable FLOAT,
    CONSTRAINT fk_payments_client FOREIGN KEY(idPClient) REFERENCES clients(idClient)
);

CREATE TABLE supplier(
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255)NOT NULL,
    CNPJ CHAR(15)NOT NULL,
    contact CHAR(11)NOT NULL,
    CONSTRAINT unique_supplier UNIQUE(CNPJ)
);

CREATE TABLE seller(
    idSeller INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255)NOT NULL,
    AbstName VARCHAR(255),
    CNPJ CHAR(15)NOT NULL,
    CPF CHAR(9),
    locations VARCHAR(255),
    contact CHAR(11)NOT NULL,
    CONSTRAINT unique_cnpj_seller UNIQUE(CNPJ),
    CONSTRAINT unique_cpf_seller UNIQUE(CPF)
);

CREATE TABLE productSeller(
    idPseller INT,
    idPproduct INT,
    prodQuantity INT DEFAULT 1,
    PRIMARY KEY(idPseller, idPproduct),
    CONSTRAINT fk_product_seller FOREIGN KEY(idPseller) REFERENCES seller(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY(idPproduct) REFERENCES product(idProduct)
);

CREATE TABLE productOrder(
    idPOproduct INT,
    idPOorder INT,
    poQuantity INT DEFAULT 1,
    poStatus enum('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY(idPOproduct, idPOorder),
    CONSTRAINT fk_productorder_product FOREIGN KEY(idPOproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_productorder_order FOREIGN KEY(idPOorder) REFERENCES orders(idOrder)
);

CREATE TABLE productStorage(
    idLstorage INT AUTO_INCREMENT,
    idLproduct INT,    
    locations VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY(idLstorage, idLproduct),
    CONSTRAINT fk_storagelocation_product FOREIGN KEY(idLproduct) REFERENCES product(idProduct)    
);

CREATE TABLE productSupplier(
    idPsSupplier INT,
    idPsProduct INT,
    quantity INT NOT NULL,
    PRIMARY KEY(idPsSupplier, idPsProduct),
    CONSTRAINT fk_productsupplier_supplier FOREIGN KEY(idPsSupplier) REFERENCES supplier(idSupplier),
    CONSTRAINT fk_productsupplier_product FOREIGN KEY(idPsProduct) REFERENCES product(idProduct)
);

