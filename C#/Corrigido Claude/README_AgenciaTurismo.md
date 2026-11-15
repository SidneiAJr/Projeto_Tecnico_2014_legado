# 🏖️ Agência de Turismo — ASP.NET WebForms (C# Legado)

> **Status: DESCONTINUADO** — Projeto acadêmico legado. Não deve ser mantido ou evoluído.

---

## 📌 O que é esse projeto?

Sistema web de uma agência de turismo fictícia desenvolvido em **ASP.NET WebForms com C#**, usando banco de dados **Microsoft Access (.mdb)** via OleDb. Permite cadastrar e listar pacotes de viagem, hospedagens e tipos de pacotes, além de uma tela de simulação de valores.

---

## 🗂️ Páginas e funcionalidades

| Arquivo | Função |
|---|---|
| `ADDHOSPEDAGEM.ASPX` | Formulário para cadastrar hospedagens vinculadas a pacotes |
| `ADDPACOTES.ASPX` | Formulário para cadastrar novos pacotes de viagem |
| `ADDTIPOSPACOTES.ASPX` | Formulário para cadastrar tipos/categorias de pacotes |
| `hospedagem.aspx` | Listagem das hospedagens disponíveis |
| `pacotes.aspx` | Listagem dos pacotes de viagem |
| `tipospacotes.aspx` | Listagem dos tipos de pacotes |
| `simulacao.aspx` | Simulação de valor total por número de pessoas *(incompleta — não busca tarifa do banco)* |
| `WebService.asmx` | WebService básico (stub, sem implementação real) |
| `MasterPage.master` | Layout base com menu de navegação |

---

## 🗄️ Banco de dados

- **Tipo:** Microsoft Access `.mdb`
- **Arquivo:** `bcorecuperacao.mdb` (dentro de `App_Data`)
- **Acesso:** OleDb com `Microsoft.Jet.OLEDB.4.0`
- **Tabelas principais:** `HOSPEDAGEM`, `PACOTES`, `TIPOSPACOTES`

---

## ⚙️ Stack tecnológica

- **Linguagem:** C# / ASP.NET WebForms
- **Framework:** .NET Framework 4.5
- **Banco:** Microsoft Access (OleDb / Jet Engine)
- **Padrão:** Code-behind (`.aspx` + `.aspx.cs`)

---

## ❌ Por que foi descontinuado?

1. **ASP.NET WebForms** é tecnologia legada desde ~2010, substituída por ASP.NET MVC e depois ASP.NET Core.
2. **Microsoft Access (.mdb) com Jet OLEDB 4.0** é incompatível com ambientes 64-bit modernos e não suporta concorrência real.
3. **Sem separação de responsabilidades** — lógica de negócio misturada com código de UI no code-behind.
4. **Simulação incompleta** — a página `simulacao.aspx` não calcula o valor real (não consulta a tarifa do banco).
5. **Sem autenticação, sem validações robustas**, sem tratamento de erros.
6. **Projeto acadêmico** — criado para fins de aprendizado, não para produção.

---

## 🧠 O que aprender com esse projeto?

Mesmo descontinuado, ele mostra conceitos importantes:
- Uso de `OleDbConnection`, `OleDbCommand` e parâmetros para evitar SQL Injection
- Padrão de MasterPage para layout compartilhado
- Redirecionamento pós-ação com `Response.Redirect`
- Integração de DataSource com controles visuais (DropDownList, DataList)

---

*Gerado em: Novembro 2026*
