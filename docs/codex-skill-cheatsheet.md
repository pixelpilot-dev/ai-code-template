# Codex Skill Cheatsheet

Короткая карта этого workflow: что здесь является глобальной маршрутизацией, что является `skill`, что является `agent`, и что подтягивается из внешних пакетов.

## 1. Слои системы

### Global Routing

- [`AGENTS.md`](/ai-code-template/AGENTS.md)

Это не skill и не agent.
Это общий routing layer:

- определяет язык работы
- задаёт типовые work modes
- говорит, когда подключать local skills
- говорит, когда опираться на `superpowers`
- говорит, когда использовать внешние Vercel skills
- задаёт правила для subagents

### External Process Skills

Основной process layer приходит из `superpowers` в `~/.agents/skills/superpowers`.

Ключевые skills:

- `superpowers:using-superpowers`
- `superpowers:brainstorming`
- `superpowers:writing-plans`
- `superpowers:requesting-code-review`
- `superpowers:receiving-code-review`
- `superpowers:verification-before-completion`
- `superpowers:systematic-debugging`
- `superpowers:test-driven-development`

Их роль:

- запускать правильный workflow
- не прыгать сразу в код
- давать planning / debugging / review process
- проверять результат до финального заявления

### External Frontend Skills

Frontend / React / UI best practices приходят из внешних skill packages в `~/.agents/skills/`.

Основные:

- `vercel-react-best-practices`
- `vercel-composition-patterns`
- `vercel-react-view-transitions`
- `web-design-guidelines`
- `deploy-to-vercel`
- `vercel-cli-with-tokens`
- `find-skills`

Их роль:

- быть source of truth для React / Next.js / UI implementation
- быть source of truth для React / UI review
- давать Vercel-maintained best practices вместо локального React skill

### Local Skills

Локальные skills живут в этом репозитории и покрывают то, что не хочется отдавать внешним пакетам:

- [`using-superpowers`](/ai-code-template/skills/using-superpowers/SKILL.md)
- [`architecture-review`](/ai-code-template/skills/architecture-review/SKILL.md)
- [`security-review`](/ai-code-template/skills/security-review/SKILL.md)
- [`clean-code-review`](/ai-code-template/skills/clean-code-review/SKILL.md)
- [`code-review`](/ai-code-template/skills/code-review/SKILL.md)
- [`cto-advisor`](/ai-code-template/skills/cto-advisor/SKILL.md)

Их роль:

- архитектурный анализ
- security review
- clean code review
- локальный quality bar для code review
- CTO / leadership guidance
- локальная маршрутизация того, как сочетать `superpowers`, local skills и Vercel skills

### Local Agents

Локальные agents живут в [`agents/`](/ai-code-template/agents) и нужны только для bounded autonomous work.

Актуальные агенты:

- [`code-reviewer`](/ai-code-template/agents/code-reviewer.md)
- [`architect-review`](/ai-code-template/agents/architect-review.md)
- [`security-auditor`](/ai-code-template/agents/security-auditor.md)
- [`documentation-expert`](/ai-code-template/agents/documentation-expert.md)
- [`api-documenter`](/ai-code-template/agents/api-documenter.md)

Их роль:

- не управлять процессом
- не заменять skills
- выполнять независимый автономный кусок работы через subagent / `spawn_agent`

## 2. Что к чему относится

| Что нужно | Основной process skill | Основной domain skill | Возможный agent | Внешние пакеты |
| --- | --- | --- | --- | --- |
| Понять, какой workflow нужен | `superpowers:using-superpowers` | `using-superpowers` | — | `find-skills` при поиске новых capabilities |
| Сначала продумать решение | `superpowers:brainstorming` | — | — | — |
| Построить план | `superpowers:writing-plans` | — | — | — |
| Реализовать React / Next.js / UI задачу | `superpowers:brainstorming` -> `superpowers:writing-plans` при необходимости | — | — | `vercel-react-best-practices`, `vercel-composition-patterns`, `vercel-react-view-transitions` при motion-задачах |
| Сделать архитектурный анализ | — | `architecture-review` | `architect-review` | при внешних библиотеках дополнительно `Context7` |
| Проверить безопасность | — | `security-review` | `security-auditor` | при внешних библиотеках дополнительно `Context7` |
| Проверить чистоту кода | — | `clean-code-review` | — | — |
| Провести code review | `superpowers:requesting-code-review` | `code-review` | `code-reviewer` | для React/UI review: `vercel-react-best-practices`, `vercel-composition-patterns`, `web-design-guidelines` |
| Обработать замечания ревью | `superpowers:receiving-code-review` | `code-review` при необходимости | — | для React/UI feedback при необходимости те же Vercel skills |
| Написать общую документацию | — | — | `documentation-expert` | — |
| Написать API документацию | — | — | `api-documenter` | — |
| Получить CTO-level guidance | — | `cto-advisor` | — | — |
| Задеплоить на Vercel | — | — | — | `deploy-to-vercel`, `vercel-cli-with-tokens` |

## 3. Как формулировать запросы по типам задач

### Routing / Start

- `Сначала определи правильный workflow через superpowers:using-superpowers и local routing.`
- `Выбери минимальный набор skills под эту задачу и только потом начинай.`

### Brainstorming / Planning

- `Используй superpowers:brainstorming и сначала разложи варианты решения.`
- `Не пиши код сразу, сначала пройди через brainstorming.`
- `Используй superpowers:writing-plans и составь пошаговый план без реализации.`

### React / Next.js / UI

- `Используй vercel-react-best-practices и vercel-composition-patterns и реализуй это изменение.`
- `Если тут есть анимации или переходы, подключи vercel-react-view-transitions.`
- `Проведи review этого React-кода с опорой на vercel-react-best-practices и web-design-guidelines.`

### Architecture / Security / Clean Code

- `Используй architecture-review и оцени границы модулей и trade-offs.`
- `Используй security-review и проверь auth, validation, secrets и data exposure.`
- `Используй clean-code-review и оцени naming, cohesion и local simplicity.`

### Code Review

- `Используй superpowers:requesting-code-review, а reviewer возьми локальный.`
- `Проведи review с упором на баги, риски, регрессии и тестовые пробелы.`
- `Для React/UI части используй Vercel skills как источник best practices.`
- `Используй superpowers:receiving-code-review и разбери этот feedback без слепого согласия.`

### Documentation

- `Подготовь документацию как documentation-expert.`
- `Сделай API docs как api-documenter.`

### Leadership / CTO

- `Используй cto-advisor и оцени это как технический лидер.`
- `Помоги приоритизировать техдолг и сформулировать решение для команды и бизнеса.`

### Verification / Debugging

- `Используй superpowers:systematic-debugging и сначала найди причину.`
- `Перед завершением пройди superpowers:verification-before-completion и проверь результат реальными командами.`

## 4. Что является skill, а что agent

### Это skills

Skills управляют workflow или дают доменную экспертизу.

Примеры:

- `superpowers:brainstorming`
- `superpowers:writing-plans`
- `architecture-review`
- `security-review`
- `clean-code-review`
- `code-review`
- `cto-advisor`
- `vercel-react-best-practices`

Используй их, когда нужно:

- запустить процесс
- выбрать метод работы
- получить экспертные правила или review bar

### Это agents

Agents нужны для делегирования bounded autonomous work.

Примеры:

- `code-reviewer`
- `architect-review`
- `security-auditor`
- `documentation-expert`
- `api-documenter`

Используй их, когда нужен:

- отдельный reviewer
- отдельный security audit
- отдельный architecture pass
- отдельный documentation draft

Не используй agents как замену skills.

## 5. Актуальная модель review

Review в этом проекте разбит на три части:

1. Процесс review:
   - `superpowers:requesting-code-review`
   - `superpowers:receiving-code-review`

2. Reviewer:
   - [`agents/code-reviewer.md`](/ai-code-template/agents/code-reviewer.md)

3. Local quality bar:
   - [`skills/code-review/SKILL.md`](/ai-code-template/skills/code-review/SKILL.md)

Если review касается React / UI:

- ориентируйся на `vercel-react-best-practices`
- ориентируйся на `vercel-composition-patterns`
- добавляй `vercel-react-view-transitions`, если есть motion / transitions
- добавляй `web-design-guidelines`, если это UI/accessibility/design audit

## 6. Установка внешних пакетов

### Superpowers

```bash
git clone https://github.com/obra/superpowers.git ~/.codex/superpowers
mkdir -p ~/.agents/skills
ln -s ~/.codex/superpowers/skills ~/.agents/skills/superpowers
```

Проверка:

```bash
ls -la ~/.agents/skills/superpowers
```

### Vercel Skills

```bash
npx skills add vercel-labs/agent-skills
```

Проверка:

```bash
ls -la ~/.agents/skills
```

Ожидаемые папки:

- `vercel-react-best-practices`
- `vercel-composition-patterns`
- `vercel-react-view-transitions`
- `web-design-guidelines`
- `deploy-to-vercel`
- `vercel-cli-with-tokens`

После установки лучше открыть новый чат или перезапустить Codex.

## 7. Самые полезные короткие триггеры

Если держать в голове только короткий минимум, то вот он:

- `Используй superpowers:brainstorming`
- `Используй superpowers:writing-plans`
- `Используй architecture-review`
- `Используй security-review`
- `Используй clean-code-review`
- `Используй superpowers:requesting-code-review`
- `Используй superpowers:receiving-code-review`
- `Используй vercel-react-best-practices`
- `Используй vercel-composition-patterns`
- `Используй web-design-guidelines`
- `Используй cto-advisor`
