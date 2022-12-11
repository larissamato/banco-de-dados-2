**1. Crie uma papel (role) com o seu nome. Ele assumirá a função de administradorde uma base de dados, ou seja, será o proprietário da base de dados (owner). Este novo usuário deve ter os seguintes atributos ativos:
-- login
-- criar novos papéis/usuários e
-- criar novas bases de dados. **

```postgresql
CREATE ROLE larissa CREATEDB LOGIN CREATEROLE PASSWORD 'teste';
```

**2. Conectado no banco de dados, com o usuário definido no exercício 1, escreva os comando SQL:
-- crie uma base de dados com o seu nome.**

```postgresql
CREATE DATABASE teste owner larissa;
```

**-- revogue todos os privilégios do papel (role) “public” na base de dados que você criou.**

```postgresql
REVOKE ALL on DATABASE teste FROM public;
```

**-- conceda todos os privilégios na base de dados que você criou ao papel (role) com seu nome. **

```postgresql
GRANT ALL ON SCHEMA public TO larissa;
```

**4. Crie as tabelas:**

```postgresql
CREATE TABLE produtos (
idprod SERIAL,
descricao text,
desconto numeric CHECK (desconto > 0 AND desconto < 0.10),
preco numeric CONSTRAINT preco_positivo CHECK (preco > 0), CHECK (preco > desconto),
PRIMARY KEY (idprod)
);

CREATE TABLE pedidos (
idped SERIAL,
idprod integer,
quantidade integer,
PRIMARY KEY (idped),
CONSTRAINT pedidos_fk FOREIGN KEY (idprod) REFERENCES produtos (idprod)
);
```

**5. Crie dois papeis roles de grupos**

```postgresql
CREATE ROLE FINANCEIRO;
```

```postgresql
CREATE ROLE GERENCIA;
```

**6 .Crie quatro papeis (role) de usuário com senhas e tempo de validade até 31/12/2022**

```postgresql
CREATE ROLE aline LOGIN PASSWORD 'aline' VALID UNTIL '2022-12-31';
CREATE ROLE rosangela LOGIN PASSWORD 'rosangela' VALID UNTIL '2022-12-31';
CREATE ROLE marcio LOGIN PASSWORD 'marcio' VALID UNTIL '2022-12-31';
CREATE ROLE ana LOGIN PASSWORD 'ana' VALID UNTIL '2022-12-31';
```

**7. Associe dois usuário a primeiro grupo criado no exercício 5 e os outros dois ao segundo grupo.**

```postgresql
GRANT FINANCEIRO TO aline, rosangela;
GRANT GERENCIA TO marcio, ana;
```

**8. Conceda os privilégios aos grupos conforme apresentado: **

**1º e 2º Grupo
Permitir que os usuário dos grupos possam se conectar à base de dados que você criou.**

```postgresql
GRANT CONNECT on DATABASE teste TO FINANCEIRO;
GRANT CONNECT on DATABASE teste TO GERENCIA;
```

**1º Grupo **

**Na tabela produtos poderá manipular os dados como quiser**

**Na tabela pedidos poderá apenas consultar os dados.**

```postgresql
GRANT SELECT, UPDATE, DELETE, INSERT ON produtos to FINANCEIRO;
GRANT SELECT ON pedidos to FINANCEIRO;
```

**2º Grupo**

**Na tabela produtos poderá apenas consultar os dados da coluna descricao e preco**

**Na tabela pedidos poderá manipular os dados como quiser, porém sem poder excluir os pedidos.**

```postgresql
GRANT SELECT(descricao, preco) ON TABLE produtos TO GERENCIA;
GRANT SELECT, UPDATE,INSERT ON pedidos to GERENCIA;
```