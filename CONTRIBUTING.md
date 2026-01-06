# Contributing to Fabric Skills for Claude

Thank you for your interest in contributing! This document provides guidelines for adding new skills or improving existing ones.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How to Contribute](#how-to-contribute)
- [Skill Development Guidelines](#skill-development-guidelines)
- [Pull Request Process](#pull-request-process)
- [Style Guide](#style-guide)

---

## Code of Conduct

Be respectful, constructive, and collaborative. We're all here to make AI more useful.

---

## How to Contribute

### Reporting Issues

- Check existing issues first
- Use the issue template
- Include: skill name, expected behavior, actual behavior, steps to reproduce

### Suggesting New Skills

Open an issue with:
- Proposed skill name
- List of Fabric patterns to include
- Example use cases
- Why these patterns belong together (the "user intent" they serve)

### Submitting Changes

1. Fork the repository
2. Create a feature branch: `git checkout -b skill/skill-name` or `git checkout -b fix/issue-description`
3. Make your changes
4. Test thoroughly
5. Submit a pull request

---

## Skill Development Guidelines

### 1. Identify the User Intent

Before creating a skill, answer:
- What **goal** does the user have?
- What **question** are they trying to answer?
- What patterns serve this goal?

**Good grouping:** "Help me understand research" (analyze_paper, summarize_paper, extract_references)

**Bad grouping:** "Things that output markdown" (too broad, no shared intent)

### 2. Skill Structure

```
skills/
└── skill-name/
    ├── SKILL.md           # Required: routing logic
    └── references/
        ├── pattern_1.md   # One file per pattern
        ├── pattern_2.md
        └── ...
```

### 3. SKILL.md Requirements

**YAML Frontmatter (required):**
```yaml
---
name: skill-name
description: Clear description including trigger phrases. Use when [contexts]. 
  Triggers include "phrase 1", "phrase 2", "phrase 3".
---
```

**Body sections:**
- Pattern Selection table (intent → pattern → when to use)
- Decision Flow (text or diagram showing routing logic)
- Pattern References (links to reference files)
- Output Guidelines (consistency requirements)
- Chaining Suggestions (logical follow-ups)

**Size limit:** Keep SKILL.md under 500 lines. Move details to references.

### 4. Pattern Adaptation

Don't copy Fabric patterns directly. Adapt them for Claude:

**Original Fabric pattern:**
```markdown
# IDENTITY AND PURPOSE
You are an expert at...

# STEPS
- Step 1
- Step 2

# OUTPUT INSTRUCTIONS
- Output in markdown
- Use bullets
```

**Adapted for Claude skill:**
```markdown
# Pattern Name

## IDENTITY AND PURPOSE
You are an expert at... [expanded context]

## STEPS
1. **Step 1** - [explanation]
2. **Step 2** - [explanation]

## OUTPUT INSTRUCTIONS

### Section 1
[Structured template]

### Section 2
[Structured template]

## PRINCIPLES
- [Guideline 1]
- [Guideline 2]
```

Key differences:
- Numbered steps with explanations
- Structured output templates (not just bullet guidelines)
- Added principles/guidelines section
- More explicit formatting

### 5. Trigger Phrases

The `description` field is the primary discovery mechanism. Include:
- Action verbs: "analyze", "extract", "create", "improve"
- Contexts: "academic", "technical", "code", "meeting"
- Exact phrases users might say: "fix typos", "make this clearer"

**Example:**
```yaml
description: Improve writing quality, fix errors, and transform style. 
  Use when asked to proofread, edit, improve clarity, fix grammar/typos, 
  enhance academic writing, analyze prose quality, humanize technical content. 
  Triggers include "improve this writing", "fix typos", "proofread", 
  "make this clearer", "academic style", "humanize", "write an essay".
```

### 6. Decision Flow Design

Route by **intent**, not keywords.

**Bad (keyword-based):**
```
"paper" → analyze_paper
```

**Good (intent-based):**
```
Scientific paper?
├─ "deep analysis" → analyze_paper
├─ "quick summary" → summarize_paper
├─ "what claims" → analyze_claims
└─ "cite/reference" → extract_references
```

### 7. Testing Your Skill

Before submitting, verify:
- [ ] SKILL.md loads without errors
- [ ] Routing works for various phrasings
- [ ] Output templates render correctly
- [ ] Chaining suggestions are logical
- [ ] No duplicate patterns across skills

---

## Pull Request Process

### PR Title Format

- New skill: `feat(skill): add skill-name`
- Pattern addition: `feat(skill-name): add pattern_name pattern`
- Bug fix: `fix(skill-name): description`
- Documentation: `docs: description`

### PR Description Template

```markdown
## Summary
[What does this PR do?]

## Skill/Pattern Details
- **Skill:** [name]
- **Patterns added/modified:** [list]
- **Fabric patterns adapted:** [list with links]

## Use Cases
1. [Example use case 1]
2. [Example use case 2]

## Testing
- [ ] Tested routing with multiple phrasings
- [ ] Verified output formatting
- [ ] Checked for conflicts with existing skills

## Checklist
- [ ] SKILL.md under 500 lines
- [ ] All patterns in references/
- [ ] Trigger phrases are comprehensive
- [ ] Decision flow is documented
```

### Review Criteria

PRs are evaluated on:
1. **Intent coherence** - Do patterns genuinely belong together?
2. **Routing quality** - Does the decision flow make sense?
3. **Pattern adaptation** - Are outputs well-structured?
4. **Trigger coverage** - Will users find this skill?
5. **Documentation** - Is usage clear?

---

## Style Guide

### Markdown

- Use ATX headers (`#`, `##`, `###`)
- One blank line before headers
- Use fenced code blocks with language tags
- Tables for structured comparisons

### Naming

- Skill names: `kebab-case` (e.g., `research-intelligence`)
- Pattern files: `snake_case.md` (e.g., `analyze_claims.md`)
- Match Fabric pattern names where possible

### Language

- Active voice
- Present tense
- Concise but complete
- Technical accuracy over brevity

---

## Questions?

Open an issue with the `question` label or start a discussion.

Thank you for contributing! 🎉
