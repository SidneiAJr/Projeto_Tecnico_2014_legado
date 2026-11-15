# 👔 Sistema de Funcionários por Cargo — ASP.NET WebForms (C# Legado)

> **Status: DESCONTINUADO** — Projeto acadêmico legado. Não deve ser mantido ou evoluído.

---

## 📌 O que é esse projeto?

Sistema web simples que permite **filtrar funcionários pelo cargo** selecionado. Desenvolvido em **ASP.NET WebForms com C#**, usando banco de dados acessado via OleDb. Exibe foto, código, nome e salário de cada funcionário filtrado.

---

## 🗂️ Páginas e funcionalidades

| Arquivo | Função |
|---|---|
| `Default.aspx` | Única página: dropdown de cargos + listagem de funcionários filtrados |

---

## 🗄️ Banco de dados

- **Acesso:** OleDb (string de conexão no `Web.config`)
- **Tabelas:** `CARGOS` (Car_Codigo, Car_Descricao), `FUNCIONARIOS` (Fun_Codigo, Fun_Nome, Fun_Salario, Fun_Cargo)

---

## ⚙️ Como funciona

1. O DropDownList carrega os cargos do banco (`CARGOS`)
2. Ao selecionar um cargo (`AutoPostBack="True"`), a DataList filtra automaticamente os funcionários daquele cargo
3. Cada funcionário exibe foto (`Imagens/{Fun_Codigo}.jpg`), código, nome e salário formatado como moeda

---

## ⚙️ Stack tecnológica

- **Linguagem:** C# / ASP.NET WebForms
- **Framework:** .NET Framework 4.5
- **Banco:** Access/SQL via OleDb
- **Padrão:** Code-behind declarativo (sem lógica C# customizada)

---

## ❌ Por que foi descontinuado?

1. **Projeto de exercício** com escopo mínimo — uma única página, sem CRUD completo.
2. **WebForms** é tecnologia legada, substituída por MVC/Core.
3. **Sem validações, autenticação ou tratamento de erros**.
4. Dependência de imagens físicas por convenção de nome (`Fun_Codigo.jpg`) — frágil e não escalável.

---

*Gerado em: Novembro 2026*
