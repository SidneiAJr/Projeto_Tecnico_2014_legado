# 🎬 Locadora de DVDs Completa (WebSite4 / WebSite6) — ASP.NET WebForms (C# Legado)

> **Status: DESCONTINUADO** — Projetos acadêmicos legados. Não devem ser mantidos ou evoluídos.
> ⚠️ **WebSite4 e WebSite6 são idênticos** — duplicatas do mesmo exercício.

---

## 📌 O que é esse projeto?

Sistema web mais completo de uma **locadora de DVDs fictícia**, com MasterPage, múltiplas páginas de navegação, filtro por gênero e busca por título. Evolução direta do WebSite2.

---

## 🗂️ Páginas e funcionalidades

| Arquivo | Função |
|---|---|
| `MasterPage.master` | Layout base com menu de navegação entre seções |
| `listageneros.aspx` | Lista todos os gêneros cadastrados |
| `filmesporgenero.aspx` | Lista filmes filtrados pelo gênero selecionado |
| `busca.aspx` | Busca de filmes por texto no título ou sinopse |

---

## 🗄️ Banco de dados

- **Arquivo:** `DVDs.mdb` (Microsoft Access)
- **Driver:** `Microsoft.Jet.OLEDB.4.0`
- **Tabelas:** `Tabela_GENEROS`, `Tabela_DVD`

---

## ⚙️ Como funciona

1. Usuário acessa lista de gêneros
2. Clica em um gênero → vê filmes daquele gênero
3. Pode usar a busca para encontrar filmes por texto livre (LIKE `%termo%`)

---

## ⚠️ Por que existem dois projetos idênticos (WebSite4 e WebSite6)?

Provavelmente o projeto foi salvo/copiado em duas pastas por engano durante o desenvolvimento. O conteúdo é o mesmo.

---

## ❌ Por que foi descontinuado?

1. **Duplicata** sem diferenciação real entre WebSite4 e WebSite6.
2. **Microsoft Access** não suporta múltiplos usuários simultâneos de forma confiável.
3. **WebForms** é tecnologia legada.
4. Sem paginação — listar todos os filmes de uma vez é inviável em escala.
5. **Projeto acadêmico** sem deploy real.

---

*Gerado em: Novembro 2026*
