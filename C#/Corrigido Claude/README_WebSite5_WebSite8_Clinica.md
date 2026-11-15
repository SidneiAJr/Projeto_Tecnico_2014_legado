# 🏥 Sistema de Clínica Médica (WebSite5 / WebSite8) — ASP.NET WebForms (C# Legado)

> **Status: DESCONTINUADO** — Projetos acadêmicos legados. Não devem ser mantidos ou evoluídos.
> ⚠️ **WebSite5 e WebSite8 são idênticos** — duplicatas do mesmo exercício.

---

## 📌 O que é esse projeto?

Sistema web de consulta de uma **clínica médica fictícia**. Permite buscar médicos por especialidade ou por plano de saúde aceito. Inclui listagem de especialidades e planos disponíveis.

---

## 🗂️ Páginas e funcionalidades

| Arquivo | Função |
|---|---|
| `MasterPage.master` | Layout base com navegação |
| `Especialidades.aspx` | Lista todas as especialidades médicas |
| `Planos.aspx` | Lista todos os planos de saúde aceitos |
| `MED_POR_ESPECIALIDADE.ASPX` | Filtra médicos por especialidade |
| `MED_POR_PLANO.aspx` | Filtra médicos pelo plano de saúde |
| `MedicoBusca.aspx` | Busca de médicos por nome ou texto livre |

---

## 🗄️ Banco de dados

- **Arquivo:** `bd_clinica.mdb` (Microsoft Access)
- **Driver:** `Microsoft.Jet.OLEDB.4.0`
- **Curiosidade:** O `Web.config` define 4 connection strings (`ConnectionString` a `ConnectionString4`) apontando para o **mesmo banco** — provavelmente cada uma foi criada pelo Visual Studio ao arrastar um novo controle SqlDataSource.

---

## ⚠️ Por que existem dois projetos idênticos (WebSite5 e WebSite8)?

Assim como WebSite4/6, o projeto foi duplicado por engano. WebSite8 ainda contém uma subpasta `WebSite2` com uma terceira cópia dos mesmos arquivos.

---

## ❌ Por que foi descontinuado?

1. **Triplicata** — mesmo código em WebSite5, WebSite8 e WebSite8/WebSite2.
2. **4 connection strings para o mesmo banco** no Web.config — indica falta de organização no desenvolvimento.
3. **Microsoft Access** inadequado para dados médicos reais (sem controle de acesso, sem transações confiáveis).
4. **WebForms** é tecnologia legada.
5. Dados de saúde exigem segurança (LGPD/HIPAA) que essa arquitetura não oferece.

---

*Gerado em: Novembro 2026*
