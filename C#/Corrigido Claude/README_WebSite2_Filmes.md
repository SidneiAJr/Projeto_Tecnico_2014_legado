# 🎬 Catálogo de DVDs por Gênero (WebSite2) — ASP.NET WebForms (C# Legado)

> **Status: DESCONTINUADO** — Projeto acadêmico legado. Não deve ser mantido ou evoluído.

---

## 📌 O que é esse projeto?

Sistema web de consulta de uma **locadora de DVDs fictícia**. Permite selecionar um gênero e ver os filmes daquele gênero com título, preço, atores, sinopse, duração e censura. Versão simplificada/inicial (ver também WebSite4 e WebSite6 para versões com mais funcionalidades).

---

## 🗂️ Páginas e funcionalidades

| Arquivo | Função |
|---|---|
| `Default.aspx` | Página única: dropdown de gêneros + listagem de DVDs filtrados |

---

## 🗄️ Banco de dados

- **Tabelas:** `Tabela_GENEROS` (Gen_Codigo, Gen_Nome), `Tabela_DVD` (Dvd_Codigo, Dvd_Titulo, Dvd_Preco, Dvd_Atores, Dvd_Sinopse, Dvd_Duracao, Dvd_Censura, Dvd_Genero)

---

## ⚙️ Como funciona

1. DropDownList carrega os gêneros disponíveis
2. Selecionando um gênero, DataList exibe os DVDs filtrados com todos os detalhes
3. Cada DVD mostra capa (`Imagens/{Dvd_Codigo}.jpg`)

---

## ❌ Por que foi descontinuado?

1. **Projeto de exercício** — única página, sem CRUD, sem busca por texto.
2. **WebSite4** e **WebSite6** são versões mais completas com MasterPage e busca por título.
3. **WebForms** é tecnologia legada.
4. Locadoras de DVD são um modelo de negócio extinto.

---

*Gerado em: Novembro 2026*
