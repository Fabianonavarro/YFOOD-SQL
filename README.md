# Projeto de Banco de Dados para E-commerce

Este projeto visa a criação de um banco de dados para gerenciar as operações de um e-commerce. O sistema abrange desde o cadastro de clientes, fornecedores e vendedores, até o gerenciamento de produtos, pedidos e estoques. Além disso, ele permite o controle de ordens de vendas e a rastreabilidade de estoque dos produtos por localizações específicas.

## Descrição do Projeto

O sistema foi projetado para atender as necessidades de um e-commerce que comercializa diversos produtos. O banco de dados foi estruturado com tabelas relacionadas a clientes, fornecedores, vendedores, produtos, pedidos, estoques e ordens de pedidos. O objetivo principal deste banco de dados é armazenar e gerenciar informações cruciais de cada uma dessas áreas, permitindo uma gestão eficiente e análise de dados do e-commerce.

### Funcionalidades do Sistema

1. **Clientes**: Armazenar as informações de clientes, incluindo dados pessoais e endereço de entrega.
2. **Produtos**: Gerenciar os produtos disponíveis no e-commerce, com informações como categoria, avaliação e tamanhos.
3. **Pedidos**: Controlar o status dos pedidos realizados pelos clientes e as formas de pagamento.
4. **Estoque**: Manter o controle do estoque dos produtos, incluindo as localizações dos mesmos.
5. **Fornecedores**: Registrar os fornecedores que abastecem os produtos do e-commerce.
6. **Vendedores**: Registrar informações sobre os vendedores que realizam as transações de vendas.
7. **Ordens de Pedidos**: Controlar as ordens de pedidos associadas a produtos e verificar a disponibilidade de estoque.

## Esquema do Banco de Dados

### Tabelas Criadas

1. **Clientes**  
   A tabela `Clientes` armazena informações dos clientes, incluindo nome, CPF e endereço.
   - **Campos**: `Id_Cliente`, `Nome`, `CPF`, `Endereco`
   - **Chave Primária**: `Id_Cliente`
   - **Constraint**: `unique_cpf_Cliente` (garante que o CPF seja único).

2. **Produto**  
   A tabela `Produto` armazena informações sobre os produtos, como nome, categoria, classificação e avaliação.
   - **Campos**: `Id_Produto`, `Produto_Nome`, `Classificacao_kids`, `Categoria`, `Avaliacao`, `Size`
   - **Chave Primária**: `Id_Produto`

3. **Pedido**  
   A tabela `Pedido` registra os pedidos feitos pelos clientes, incluindo o status, frete e tipo de pagamento.
   - **Campos**: `id_Pedido`, `idOrdens_Cliente`, `Status_Pedido`, `Frete`, `Tipo_Pagamento`
   - **Chave Primária**: `id_Pedido`

4. **Estoque**  
   A tabela `Estoque` armazena informações sobre a localização e quantidade dos produtos no estoque.
   - **Campos**: `id_Estoque`, `Localizacao`, `quantidade`
   - **Chave Primária**: `id_Estoque`

5. **Produtos_Estoque**  
   A tabela `Produtos_Estoque` faz a relação entre os produtos e o estoque, incluindo a quantidade de cada produto disponível.
   - **Campos**: `PProduto_id_produto`, `PEstoque_id_Estoque`, `Quantidade_estoque`, `Location`
   - **Chave Primária**: (`PEstoque_id_Estoque`, `PProduto_id_produto`)

6. **Fornecedor**  
   A tabela `Fornecedor` armazena informações sobre os fornecedores, como razão social, CNPJ, CPF e produto fornecido.
   - **Campos**: `id_fornecedor`, `RazaoSocial`, `CNPJ`, `CPF`, `Contato`, `Cidade`, `Pais`, `E_mail`, `Produto_Fornecido`
   - **Chave Primária**: `id_fornecedor`

7. **Vendedor**  
   A tabela `Vendedor` armazena as informações dos vendedores, como CNPJ, CPF, e informações de contato.
   - **Campos**: `id_Vendedor`, `Razao_Social`, `CNPJ`, `CPF`, `Contato_Vendedor`, `Contato`, `Localidade`
   - **Chave Primária**: `id_Vendedor`

8. **Produto_Vendedor**  
   A tabela `Produto_Vendedor` faz a relação entre os vendedores e os produtos que vendem, incluindo a quantidade disponível.
   - **Campos**: `id_PVendedor`, `id_Prod_Produto`, `Quantidade`
   - **Chave Primária**: (`id_PVendedor`, `id_Prod_Produto`)

9. **Disp_produto**  
   A tabela `Disp_produto` relaciona os fornecedores aos produtos que estão disponíveis.
   - **Campos**: `id_disp_fornecedor`, `id_disp_produto`
   - **Chave Primária**: (`id_disp_fornecedor`, `id_disp_produto`)

10. **Ordens_Pedidos**  
    A tabela `Ordens_Pedidos` relaciona os produtos aos pedidos, incluindo a quantidade de produtos e o status da disponibilidade.
    - **Campos**: `id_PoProduto`, `id_Popedido`, `Po_Quantidade`, `Po_Status`
    - **Chave Primária**: (`id_PoProduto`, `id_Popedido`)

### Relacionamentos

- **Clientes ↔ Pedidos**: Um cliente pode fazer múltiplos pedidos.
- **Produtos ↔ Estoque**: Cada produto pode ter múltiplas localizações no estoque.
- **Produtos ↔ Fornecedores**: Os produtos podem ter múltiplos fornecedores.
- **Vendedores ↔ Produtos**: Os vendedores podem vender múltiplos produtos.
