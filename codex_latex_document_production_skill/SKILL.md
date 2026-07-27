---
name: latex-document-production
description: Use when installing or diagnosing LaTeX, selecting venue or thesis templates/classes, configuring Thai/English fonts, fixing missing glyph boxes, handling math-symbol/font issues, formatting tables/columns, building PDFs, or doing final layout QA for hanging headings, orphan/widow lines, captions, and page breaks.
---

# LaTeX Document Production

Use this skill for document production and formatting work. It is separate from
thesis content review. It may edit LaTeX/source/build configuration only when
the user explicitly asks for a formatting, build, or revision pass.

## Core Rule

Do not fix layout before the content is stable enough for formatting work. For
review-only tasks, report formatting risks in review notes instead of editing
source files.

## Workflow Router

| User need | Workflow |
|---|---|
| Install/check LaTeX | Setup and environment diagnosis |
| Venue says use class/template | Venue template selection |
| Thai thesis/report | Thai font and XeLaTeX/LuaLaTeX setup |
| English or symbols appear as square boxes | Font/glyph diagnosis |
| Math symbols fail or look wrong | Math font/package diagnosis |
| Wide/broken tables | Table layout and autofit workflow |
| Hanging heading/line/caption | Final PDF page-layout QA |
| Build fails | Log triage and minimal reproducible fix |

## Setup And Environment Diagnosis

1. Identify platform and engine availability: `xelatex`, `lualatex`,
   `latexmk`, `biber`, `bibtex`, `tlmgr`.
2. Prefer `latexmk` for local builds when available.
3. For Thai documents, prefer XeLaTeX or LuaLaTeX over pdfLaTeX.
4. Record non-portable local installs, fonts, and caches in `.ai/LOCAL_RESOURCES.md`
   when the workspace has `.ai/`.
5. Do not silently download packages/fonts. Ask or report the command needed if
   network/admin access is required.

## Venue Template Selection

Use the venue's official instructions as the source of truth:

- official LaTeX class/template
- bibliography system and style
- page size, column count, fonts, margins, and line spacing
- figure/table/caption rules
- supplementary material rules

Do not invent venue requirements. If instructions are not supplied, mark
`needs live verification` and ask for the venue URL/template files.

## Thai Font Setup

For formal Thai documents:

- Thai body/headings: `TH Sarabun New` when required by institution.
- Engine: XeLaTeX or LuaLaTeX.
- Use `fontspec` and a known local Thai setup.
- If `TH Sarabun New` is missing, install it only with user approval or report
  the missing font and fallback used.
- For public/non-bureaucratic documents, `Noto Sans Thai`, `Sarabun`, or
  institution-approved fonts may be safer fallbacks.

Example pattern to adapt, not paste blindly:

```tex
\usepackage{fontspec}
\setmainfont{TH Sarabun New}
\newfontfamily\englishfont{TeX Gyre Termes}
```

## Missing Glyph / Square Box Diagnosis

Square boxes usually mean missing glyphs, wrong engine, or font mismatch. Check:

- Was the file built with XeLaTeX/LuaLaTeX, not pdfLaTeX?
- Does the chosen font contain Thai, English, punctuation, and needed symbols?
- Are English words accidentally rendered with a Thai-only font?
- Are math symbols in text mode or text symbols in math mode?
- Are Unicode symbols better replaced with LaTeX commands?

For mixed Thai-English documents, use explicit Thai and English font families
when needed. For math-heavy documents, keep text fonts and math fonts compatible.

## Math Font And Symbol Setup

- Traditional math: use packages such as `amsmath`, `amssymb`, `mathtools`.
- Unicode math: use LuaLaTeX/XeLaTeX with `unicode-math` and a compatible math
  font such as Latin Modern Math or a template-approved math font.
- Do not mix incompatible math font systems without a reason.

## Tables, Autofit, And Columns

- Prefer semantic tables over manually spaced text.
- Use `tabularx`/`xltabular` for width-constrained wrapping columns.
- Use `booktabs` for clean rules.
- Use `longtable`/`xltabular` for multi-page tables.
- Use `siunitx` for aligned numeric columns.
- For two-column venues, check whether tables need `table*`, rotation, or appendix.
- Avoid tiny fonts as the first fix; split or redesign overly wide tables.

Autofit strategy:

1. identify fixed-width vs flexible columns
2. wrap text columns, keep numeric columns compact
3. move low-value columns to appendix/supplement
4. inspect final PDF, especially Thai word breaks in cells

## Final PDF Layout QA

Before calling a PDF final, inspect the built PDF for:

- no heading stranded at the bottom of a page
- no hanging title/caption
- no orphan/widow line that looks visibly bad
- no figure/table separated from its caption
- tables fit page/column width
- columns balanced enough for venue requirements
- Thai word breaks are acceptable
- English text and math symbols render, not square boxes
- fonts are embedded or consistently available
- bibliography and citations compile cleanly
- page numbers, headers, footers, and margins are correct

Automated build success is only a first check. Visual PDF inspection is required
for final formatting claims.

## Build Log Triage

1. read the first meaningful error
2. identify source file and line if possible
3. distinguish missing package/font, syntax error, and bibliography error
4. fix the smallest cause
5. rebuild
6. do not delete content or weaken venue requirements just to pass

## Output

For review-only work:

```markdown
## LaTeX / PDF Production Review
### Build Environment
### Template / Venue Requirements
### Font And Glyph Risks
### Table / Column Risks
### Final PDF QA Risks
### Required Inputs Or Commands
```

For implementation work, report files changed, build command, engine/template,
fonts required/used, checks run, PDF QA status, and remaining visual checks.
