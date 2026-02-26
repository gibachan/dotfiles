---
name: koba-review
description: iOS code review skill. Use `/koba-review branch <target> [base]` to review branch diffs, or `/giba-review commit` to review the latest commit.
argument-hint: branch <target-branch> [base-branch] | commit
allowed-tools: Bash
---

# giba-review

Subcommand received: `$ARGUMENTS`

---

## branch subcommand

If `$ARGUMENTS` starts with `branch`, perform a **branch diff review**.

### 1. Determine branches

Parse the arguments after `branch`:
- One argument → TARGET_BRANCH = that argument, BASE_BRANCH = `develop`
- Two arguments → TARGET_BRANCH = first, BASE_BRANCH = second

### 2. Sync local branches

Run in order:
```
git fetch origin ${BASE_BRANCH}:${BASE_BRANCH}
git fetch origin ${TARGET_BRANCH}:${TARGET_BRANCH}
```

### 3. Retrieve the diff

```
git diff ${BASE_BRANCH}...${TARGET_BRANCH}
```

### 4. Review priorities

1. **Swift Paradigms** — Adherence to Swift API Design Guidelines and idiomatic patterns (`guard`, `if let`, `extensions`).
2. **Memory Management** — Retain cycles, improper `weak`/`unowned`, resource leaks.
3. **Architecture & SOLID** — Separation of concerns, testability, adherence to project architecture (MVVM, VIPER, etc.).
4. **Concurrency** — Correct use of Structured Concurrency (`async/await`) or GCD; no main-thread blocking.
5. **Robustness** — Edge-case handling, optional unwrapping safety, error propagation.

### 5. Output structure

- **Executive Summary** — Concise overview of the changes.
- **Priority Fixes (Critical)** — Bugs, crashes, or security concerns requiring immediate action.
- **Refinement Suggestions** — Actionable advice with **code snippets**.
- **Positive Highlights** — Notable improvements or elegant solutions.

Tone: technically rigorous yet constructive. Always explain the *why* behind suggestions.

---

## commit subcommand

If `$ARGUMENTS` starts with `commit`, perform a **latest-commit review**.

### 1. Retrieve the diff

```
git diff HEAD~1 || git show
```

### 2. Review focus

- **Memory leaks** — retain cycles, strong captures, delegates not marked `weak`, long-lived tasks, `NotificationCenter`, timers, Combine / Swift concurrency misuse.
- **Deprecated APIs** — detect deprecated or legacy Apple APIs and suggest modern alternatives.
- **Technical debt** — tight coupling, poor abstractions, hidden side effects, unclear ownership, low testability, magic numbers/strings, unnecessary singletons.

Explain the engineering reasoning and propose concrete fixes when issues are found.

### 3. Output (全て日本語で記述)

🔴 **Critical Issues** — Must be fixed before merging.
- File / Issue / Reason / Fix

🟠 **Important Improvements** — Strongly recommended.

🟡 **Minor Suggestions** — Readability and maintainability.

✅ **Good Practices** — Solid design or implementation choices.

問題が見つからない場合は、このコミットがシニアレベルの品質を満たしている旨を明記する。
