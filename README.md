# Fabric Skills for Claude

> Transform 250+ Fabric patterns into 7 intelligent, composable skills for Claude

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Skills](https://img.shields.io/badge/skills-7-blue.svg)](#available-skills)
[![Patterns](https://img.shields.io/badge/patterns-49-green.svg)](#available-skills)

---

## What is this?

This project bridges [Daniel Miessler's Fabric](https://github.com/danielmiessler/fabric) prompt library with [Claude's skill system](https://docs.anthropic.com/). Instead of memorizing 250+ individual patterns, you get 7 intelligent skills that route to the right pattern based on what you actually ask.

**Before:** "Should I use `analyze_paper`, `summarize_paper`, `extract_references`, or `extract_wisdom`?"

**After:** "Help me understand this paper" → The skill figures it out.

---

## Quick Start

### Installation

1. Download the skills you need from the [Releases](../../releases) page
2. Extract to your Claude skills directory:
   ```bash
   # Example for a single skill
   unzip research-intelligence.skill -d ~/.claude/skills/
   ```
3. The skill is now available in Claude

### Or clone the entire repository:

```bash
git clone https://github.com/spitoglou/fabric-claude-skills.git
cd fabric-claude-skills

# Copy all skills to Claude's skill directory
cp -r skills/* ~/.claude/skills/
```

---

## Available Skills

| Skill | Patterns | Size | Description |
|-------|----------|------|-------------|
| [research-intelligence](#research-intelligence) | 7 | 8.5 KB | Papers, claims, wisdom extraction |
| [technical-documentation](#technical-documentation) | 9 | 13 KB | Architecture docs, PRDs, code explanation |
| [writing-enhancement](#writing-enhancement) | 6 | 8.7 KB | Editing, proofreading, style improvement |
| [content-transformation](#content-transformation) | 7 | 9.1 KB | Summarization, format conversion |
| [critical-thinking](#critical-thinking) | 7 | 11 KB | Argument analysis, red-teaming, root cause |
| [learning-education](#learning-education) | 7 | 11 KB | Tutorials, quizzes, study materials |
| [content-creation](#content-creation) | 6 | 9.4 KB | Newsletters, emails, presentations |

**Total: 49 patterns across 7 skills (~71 KB)**

---

## Skill Details

### research-intelligence

Extract insights from academic content, analyze claims, and synthesize research.

**Trigger phrases:** "analyze this paper", "extract key insights", "summarize the research", "what are the main claims", "compile references"

| Pattern | Purpose |
|---------|---------|
| `extract_wisdom` | Flagship insight extraction from any content |
| `analyze_paper` | Deep scientific paper analysis with methodology assessment |
| `summarize_paper` | Quick paper overview |
| `analyze_claims` | Truth claim evaluation with fallacy detection |
| `extract_references` | Citation compilation |
| `extract_ideas` | Concept extraction for innovation |
| `extract_controversial_ideas` | Contested viewpoints identification |

---

### technical-documentation

Create and improve technical documentation, from architecture designs to PR descriptions.

**Trigger phrases:** "document this", "create a design doc", "explain this code", "write a PRD", "create a diagram", "architecture overview"

| Pattern | Purpose |
|---------|---------|
| `create_design_document` | C4 architecture documentation |
| `refine_design_document` | Improve existing design docs |
| `review_design` | Architecture review and scoring |
| `create_prd` | Product Requirements Documents |
| `create_user_story` | Agile stories with acceptance criteria |
| `explain_code` | Code walkthroughs |
| `explain_docs` | Transform docs into clearer versions |
| `create_mermaid_visualization` | Diagram generation |
| `write_pull_request` | PR descriptions |

---

### writing-enhancement

Improve writing quality, fix errors, and transform style.

**Trigger phrases:** "improve this writing", "fix typos", "proofread", "make this clearer", "academic style", "humanize"

| Pattern | Purpose |
|---------|---------|
| `improve_writing` | Enhance clarity, flow, style |
| `improve_academic_writing` | Scholarly tone and structure |
| `fix_typos` | Spelling, grammar, punctuation |
| `analyze_prose` | Writing quality analysis |
| `humanize` | Technical → conversational |
| `write_essay` | Essays in specific author styles |

---

### content-transformation

Convert content between formats and summarize at different levels.

**Trigger phrases:** "convert to markdown", "summarize in one sentence", "make this a tweet", "create flashcards", "TL;DR"

| Pattern | Purpose |
|---------|---------|
| `summarize` | Balanced key points extraction |
| `summarize_micro` | 1-2 sentence TL;DR |
| `create_5_sentence_summary` | Progressive 5-level summary |
| `convert_to_markdown` | Any format → Markdown |
| `tweet` | Content → tweet-length |
| `to_flashcards` | Content → study cards |
| `youtube_summary` | Video → key points + timestamps |

---

### critical-thinking

Analyze arguments, detect biases, and evaluate claims rigorously.

**Trigger phrases:** "evaluate this argument", "logical fallacies", "fact check", "identify biases", "devil's advocate", "red team this"

| Pattern | Purpose |
|---------|---------|
| `analyze_claims` | Truth claim evaluation + fallacy detection |
| `extract_predictions` | Assess forecasts and predictions |
| `analyze_mistakes` | Learn from errors (5 Whys) |
| `extract_primary_problem` | Root cause identification |
| `t_red_team_thinking` | Adversarial analysis |
| `extract_alpha` | Most novel/surprising insights |
| `create_idea_compass` | 4-dimensional thought organization |

---

### learning-education

Create learning materials, explain concepts, and generate study aids.

**Trigger phrases:** "explain this", "help me learn", "create a quiz", "tutorial for", "study guide", "teach me"

| Pattern | Purpose |
|---------|---------|
| `explain_terms` | Glossary with analogies |
| `explain_math` | Step-by-step math concepts |
| `create_story_explanation` | Concept → engaging narrative |
| `create_quiz` | Questions by difficulty level |
| `create_flash_cards` | Spaced repetition cards |
| `create_reading_plan` | Structured learning path |
| `dialog_with_socrates` | Learn through questioning |

---

### content-creation

Create polished content for publication and communication.

**Trigger phrases:** "write a newsletter", "draft an email", "create a post", "presentation", "blog post"

| Pattern | Purpose |
|---------|---------|
| `create_newsletter_entry` | Newsletter sections |
| `create_formal_email` | Professional correspondence |
| `create_show_intro` | Podcast/show openings |
| `enrich_blog_post` | Blog enhancement + SEO |
| `create_keynote` | TED-style presentations |
| `create_aphorisms` | Curated wisdom quotes |

---

## Architecture

Each skill follows a consistent structure optimized for Claude's context window:

```
skill-name/
├── SKILL.md           # Routing logic + pattern selection (always loaded)
└── references/
    ├── pattern_1.md   # Full pattern (loaded on-demand)
    ├── pattern_2.md
    └── pattern_n.md
```

### Design Principles

1. **Progressive Disclosure** - SKILL.md contains routing logic; full patterns load only when needed
2. **Intent-Based Routing** - Patterns grouped by user goal, not output format
3. **Decision Trees** - Smart routing based on request context, not just keywords
4. **Steelman First** - Critical analysis patterns present strongest arguments before critiquing
5. **Chaining Support** - Skills suggest logical follow-up patterns

### SKILL.md Structure

```markdown
---
name: skill-name
description: What this skill does. Trigger phrases and use cases.
---

# Skill Name

## Pattern Selection
| Intent | Pattern | When to Use |
|--------|---------|-------------|
| [goal] | `pattern_name` | [context] |

## Decision Flow
[Routing logic as text or diagram]

## Pattern References
[Links to reference patterns]

## Output Guidelines
[Consistency requirements]

## Chaining Suggestions
[Logical follow-ups]
```

---

## Creating New Skills

Want to add patterns or create new skills? Follow these steps:

### 1. Identify Pattern Clusters

Group Fabric patterns by **user intent**, not output format. Ask: "What goal do these patterns serve?"

### 2. Create the Skill Structure

```bash
mkdir -p skills/my-skill/references
```

### 3. Write SKILL.md

Keep it under 500 lines. Include:
- YAML frontmatter with name, description, triggers
- Pattern selection table
- Decision flow logic
- Output guidelines

### 4. Adapt Patterns

Don't copy Fabric patterns directly. Adapt them:
- Add structured OUTPUT INSTRUCTIONS
- Include example outputs
- Ensure consistent formatting

### 5. Test Routing

Verify the skill routes correctly for various phrasings of the same intent.

### Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b skill/my-new-skill`)
3. Add your skill following the structure above
4. Submit a pull request with:
   - Description of the skill's purpose
   - List of patterns included
   - Example use cases

---

## Roadmap

### Planned Skills

| Skill | Patterns | Status |
|-------|----------|--------|
| security-analysis | ~22 | 🔜 Planned |
| meeting-productivity | ~8 | 🔜 Planned |
| business-strategy | ~18 | 💭 Considering |
| visualization-diagrams | ~14 | 💭 Considering |

### Improvements

- [ ] Automated testing for routing logic
- [ ] Skill dependency management
- [ ] Version compatibility tracking
- [ ] Usage analytics integration

---

## Credits & Disclaimer

This project builds on the excellent work of:

- **[Fabric](https://github.com/danielmiessler/fabric)** by Daniel Miessler - The source of 250+ battle-tested AI patterns
- **[Anthropic](https://anthropic.com)** - Claude and the skill system architecture

The patterns in this repository are adapted from Fabric's open-source collection and restructured for Claude's skill format.

**Disclaimer:** This is an independent project. Daniel Miessler and the Fabric team have no affiliation with, involvement in, or responsibility for this work. This project simply adapts patterns from Fabric's open-source repository into a format suitable for Claude's skill system.

---

## License

MIT License - See [LICENSE](LICENSE) for details.

The original Fabric patterns are subject to their own licensing terms.

---

## Links

- 📖 [Blog Post: From 250 Patterns to 7 Skills](link-to-blog-post)
- 🔧 [Fabric Project](https://github.com/danielmiessler/fabric)
- 📚 [Claude Documentation](https://docs.anthropic.com)
- 🐛 [Report Issues](../../issues)

---

<p align="center">
  <i>The future of AI assistance isn't more prompts—it's smarter organization of the prompts we have.</i>
</p>
