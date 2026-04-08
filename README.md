# Horta Inteligente

Sistema IoT + Web para monitoramento da maturação de frutas com base na análise de cor, utilizando sensores e integração com banco de dados.

---

## Sobre o Projeto

O **Horta Inteligente** é um sistema desenvolvido para identificar o estado de maturação de frutas e legumes através da variação de cor da casca.

A solução combina:

* Aplicação Web (JSP + Servidor)
* Processamento de dados
* Dispositivo IoT (ESP8266 + sensor RGB)
* Banco de dados MySQL

---

## Objetivo

Permitir que o usuário acompanhe, de forma simples e visual, o estado de maturação dos frutos:

* 🟢 Imaturo
* 🟡 Quase maduro
* 🔴 Maduro

---

## Tecnologias Utilizadas

### Backend / Web

* Java (JSP/Servlet)
* Apache Tomcat
* MySQL
* JDBC

### Frontend

* HTML
* CSS
* JavaScript
* Bootstrap

### IoT / Hardware

* ESP8266
* Sensor de cor RGB TCS34725
* Display OLED
* LED RGB

---

## Funcionamento do Sistema

1. O sensor RGB captura a cor do fruto
2. O microcontrolador processa os dados
3. O sistema classifica o estado da fruta
4. Os dados são enviados (CSV / Serial → Banco de Dados)
5. O sistema web exibe as informações ao usuário

---

## Funcionalidades - CRUD completo

* ✅ Cadastro de dados via CSV
* ✅ Listagem de registros
* ✅ Exclusão de dados
* ✅ Visualização do status da fruta
* ✅ Integração com banco de dados

---

## Banco de Dados

O sistema utiliza MySQL com a seguinte estrutura:

```sql
CREATE TABLE fruta(
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(35) NOT NULL,
    data_registro DATE NOT NULL,
    status_fruta VARCHAR(50)
);
```

---

## Como Executar o Projeto?

### 1. Clonar o repositório

```bash
git clone https://github.com/seu-usuario/horta-inteligente.git
```

---

### 2. Configurar o banco de dados

* Criar banco: `horta`
* Executar o script `.sql`

---

### 3. Configurar conexão

Crie o arquivo:

```bash
WEB-INF/db.properties
```

Exemplo:

```properties
db.url=jdbc:mysql://localhost:3306/horta
db.user=root
db.password=sua_senha
```

Esse arquivo NÃO está no repositório por segurança.

---

### 4. Executar

* Importar no NetBeans
* Configurar o Apache Tomcat
* Rodar o projeto

---

## Integração com IoT

O sistema foi projetado para receber dados de um sensor físico utilizando:

* Leitura de cor RGB
* Processamento via microcontrolador
* Envio de dados via Serial / CSV

---

## Exemplo de Entrada (CSV)

```csv
Maca;2024-01-01;MADURA
Banana;2024-01-02;IMATURA
```

---

## Protótipo

O sistema físico utiliza:

* Sensor de cor para análise
* LED RGB para feedback visual
* Display OLED para exibição local

---

## Equipe

* Edson de Oliveira Correia
* Gustavo Silva de Brito
* José Elias Gomes Camargo
* Jose Joaquin Julcamoro Bustamante
* Lucas Henrique Damasceno

---

## Contexto Acadêmico

Projeto desenvolvido no curso de:

🎓 Análise e Desenvolvimento de Sistemas
🏫 SENAC – Campus Santo Amaro

---

## Possíveis Melhorias

* Integração em tempo real via API
* Dashboard com gráficos
* Deploy em nuvem
* App mobile

---

## Licença

Este projeto é acadêmico e livre para fins de estudo.

---
