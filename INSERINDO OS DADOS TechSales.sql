USE TechSales;


-- INSERINDO OS DADOS 

INSERT INTO tabela_clientes
(nome, email, cpf, cidade, estado)
VALUES
('Ana Souza', 'ana.souza@email.com', '12345678901', 'São Paulo', 'SP'),
('Bruno Lima', 'bruno.lima@email.com', '23456789012', 'Santo André', 'SP'),
('Carla Mendes', 'carla.mendes@email.com', '34567890123', 'Rio de Janeiro', 'RJ'),
('Diego Santos', 'diego.santos@email.com', '45678901234', 'Curitiba', 'PR'),
('Eduarda Costa', 'eduarda.costa@email.com', '56789012345', 'Belo Horizonte', 'MG'),
('Felipe Rocha', 'felipe.rocha@email.com', '67890123456', 'Campinas', 'SP'),
('Gabriela Alves', 'gabriela.alves@email.com', '78901234567', 'Salvador', 'BA'),
('Henrique Martins', 'henrique.martins@email.com', '89012345678', 'Porto Alegre', 'RS'),
('Isabela Ferreira', 'isabela.ferreira@email.com', '90123456789', 'Recife', 'PE'),
('João Oliveira', 'joao.oliveira@email.com', '01234567890', 'Brasília', 'DF');


INSERT INTO produtos
(produto, categoria_produto, preco, estoque)
VALUES
('Notebook Dell Inspiron', 'INFORMÁTICA', 3500.00, 15),
('Notebook Lenovo IdeaPad', 'INFORMÁTICA', 3200.00, 12),
('Teclado Logitech K120', 'PERIFÉRICOS', 89.90, 50),
('Mouse Logitech M170', 'PERIFÉRICOS', 79.90, 40),
('Monitor LG 24 polegadas', 'MONITORES', 899.90, 20),
('Monitor Samsung 27 polegadas', 'MONITORES', 1299.90, 10),
('SSD Kingston 480GB', 'ARMAZENAMENTO', 249.90, 30),
('SSD Samsung 1TB', 'ARMAZENAMENTO', 499.90, 18),
('Cabo HDMI 2 metros', 'ACESSÓRIOS', 39.90, 100),
('Adaptador USB-C', 'ACESSÓRIOS', 59.90, 60);

-- Inserção na tabela de vendas atualizada (removido o valor_total)
INSERT INTO tabela_vendas
(id_cliente, status_venda)
VALUES
(1, 'CONCLUÍDA'),
(2, 'CONCLUÍDA'),
(3, 'PENDENTE'),
(4, 'CONCLUÍDA'),
(5, 'PENDENTE'),
(6, 'CANCELADA'),
(7, 'CONCLUÍDA'),
(8, 'PENDENTE'),
(9, 'CONCLUÍDA'),
(10, 'CONCLUÍDA');


INSERT INTO tabela_item_vendas
(id_venda, id_produto, quantidade, preco_unitario)
VALUES
(1, 1, 1, 3500.00),
(1, 3, 1, 89.90),
(1, 9, 1, 39.90),

(2, 3, 1, 89.90),
(2, 4, 1, 79.90),

(3, 5, 1, 899.90),

(4, 7, 1, 249.90),
(4, 8, 1, 499.90),

(5, 6, 1, 1299.90),

(6, 4, 2, 79.90),
(6, 9, 5, 39.90),

(7, 1, 1, 3500.00),
(7, 10, 1, 59.90),

(8, 7, 1, 249.90),
(8, 8, 1, 289.90),

(9, 3, 1, 89.90),

(10, 5, 2, 899.90);

