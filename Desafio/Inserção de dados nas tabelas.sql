USE ecommerce;

INSERT INTO clients (typeClient, cName, cpfCnpj, cAddress) VALUES
    ('Pessoa Física', 'João Barbosa', '12345678900', 'Rua dos Anjos, 123'),
    ('Pessoa Física', 'Maria Joaquina', '98765432100', 'Rua das Flores, 321'),
    ('Pessoa Física', 'Ana souza', '00123456789', 'Rua das Orquídeas, 987'),
    ('Pessoa jurídica', 'Mercadão', '12345678000109', 'Rua das Rosas, 789'),
    ('Pessoa jurídica', 'JM Shop', '98765432000101', 'Rua das Arueiras, 654'),
    ('Pessoa Física', 'Paulo Silva', '00987654321', 'Rua das Margaridas, 456');

INSERT INTO product (Pname, category, Pdescription, Pvalue, rating) VALUES
    ('Smartphone DIO', 'Eletrônico', 'Smartphone primeira geração da DIO', 1000.00, 4.8),
    ('Notebook DIO', 'Eletrônico', 'Notebook de última geração da DIO', 2500.00, 4.9),
    ('Camiseta Personalizada', 'Vestimenta', 'Camiseta com estampa personalizada', 49.90, 4.5),
    ('Bermuda Personalizada', 'Vestimenta', 'Bermuda com estampa personalizada', 59.90, 4.6),
    ('Quebra-cabeças', 'Brinquedos', 'Quebra-cabeças de 1000 peças', 19.90, 4.3),
    ('Baralho infantil', 'Brinquedos', 'Baralho para crianças a partir de 05 anos', 9.90, 4.2),
    ('Arroz Parbolizado', 'Alimentos', 'Arroz parbolizado tipo 1', 5.80, 4.8),
    ('Feijão Preto', 'Alimentos', 'Feijão preto tradicional', 7.80, 4.8),
    ('Jogo de sofás', 'Móveis', 'Sofás 2 e 3 lugares em suede', 1299.90, 4.5),
    ('Jogo de mesa', 'Móveis', 'Mesa e 6 cadeiras para sala de jantar', 499.90, 4.6);

INSERT INTO orders (idOrderClient, orderStatus, orderDescrption, sendValue, paymentCash) VALUES
    (1, 'Entregue', 'Pedido entregue com sucesso', 10.00, TRUE),
    (1, 'Em processamento', 'Em breve seu pedido será enviado', 20.00, TRUE),
    (2, 'Aguardando pagamento', 'Aguardando confirmação de pagamento', 10.00, FALSE),
    (3, 'Cancelado', 'Pedido cancelado pelo cliente', 15.00, FALSE),
    (4, 'Confirmado', 'Seu pagamento foi confirmado, seu pedido será encaminhado para a loja.', 30.00, TRUE),
    (4, 'Entregue', 'Pedido entregue com sucesso', 50.00, TRUE),
    (5, 'Enviado', 'Pedido em deslocamento', 20.00, TRUE);

INSERT INTO delivery (iddOrder, deliveryStatus, trackingCode) VALUES
    (1, 'Entregue', 'AB123456789BR'),
    (2, 'Aguardando envio', 'AB987654321BR'),
    (3, 'Aguardando envio', 'CD111222333BR'),
    (4, 'Cancelado', 'CD444555666BR'),
    (5, 'Aguardando envio', 'CD777888999BR'),
    (6, 'Entregue', 'EF999666333BR'),
    (7, 'A caminho', 'EF777444111BR');

INSERT INTO payments (idPClient, typePayment) VALUES
    (1, 'Cartão'),
    (2, 'Boleto'),
    (3, 'PIX'),
    (4, 'Boleto'),
    (5, 'Cartão'),
    (6, 'Dois cartões');

INSERT INTO supplier (CNPJ, SocialName, contact) VALUES
    ('23456789000101', 'Fornecedor 1', '7133692258'),
    ('98765432000101', 'Fornecedor 2', '7141235689'),
    ('74185296000101', 'Fornecedor 3', '7123456789');

INSERT INTO seller (SocialName, CNPJ, locations, contact) VALUES
    ('Vendedor 1', '99888777000109', 'Rua da distribuição, 01', '71998877666'),
    ('Vendedor 2', '66555444000109', 'Rua das vendas, 12', '71999666333'),
    ('Vendedor 3', '74185296000101', 'Rua das compras, 23', '7123456789');

INSERT INTO productSeller (idPseller, idPproduct, prodQuantity) VALUES
    (1, 1, 50),
    (1, 2, 25),
    (2, 3, 100),
    (2, 4, 100),
    (2, 5, 75),
    (2, 6, 75),
    (3, 7, 200),
    (3, 8, 200),
    (1, 9, 20),
    (1, 10, 20);

INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus) VALUES
    (1, 1, 1, 'Disponível'),
    (2, 2, 1, 'Disponível'),
    (3, 3, 2, 'Disponível'),
    (5, 4, 1, 'Disponível'),
    (10, 5, 1, 'Disponível'),
    (9, 6, 1, 'Disponível'),
    (4, 7, 5, 'Disponível');

INSERT INTO productStorage (idLproduct, quantity, locations) VALUES
    (1, 50, 'Galpão de armazenamento 1'),
    (2, 25, 'Galpão de armazenamento 1'),
    (3, 100, 'Galpão de armazenamento 2'),
    (4, 100, 'Galpão de armazenamento 2'),
    (5, 75, 'Galpão de armazenamento 2'),
    (6, 75, 'Galpão de armazenamento 2'),
    (7, 200, 'Galpão de armazenamento 3'),
    (8, 200, 'Galpão de armazenamento 3'),
    (9, 20, 'Galpão de armazenamento 1'),
    (10, 20, 'Galpão de armazenamento 1');

INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity) VALUES
    (1, 1, 50),
    (1, 2, 25),
    (2, 3, 100),
    (2, 4, 100),
    (2, 5, 75),
    (2, 6, 75),
    (3, 7, 200),
    (3, 8, 200),
    (1, 9, 20),
    (1, 10, 20);