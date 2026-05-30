# Project-Specific AI Development Guidelines

## 1. Core Operating Rules & Budget Optimization
- **Token & Cost Efficiency:** Do not waste the user's API budget on unnecessary or repetitive reasoning loops. 
- **Error Handling Fallback:** If a code execution or testing error occurs, you are limited to a maximum of TWO (2) autonomous self-correction attempts. If the issue is not resolved after the second attempt, stop immediately and ask the user for feedback.
- **Language Constraint:** You must always reply to the user and write all logs/documents in **Korean (한국어)**.

## 2. Obsidian Real-Time Synchronization Rules (Crucial)
Whenever you make significant code modifications or architectural design changes, you must document them in the `./ai-record/` directory. This folder is linked directly to the user's Obsidian Vault.

### Rule A: Development Logs (Append Mode)
- Automatically create or append to a file named **`[YYYY-MM-DD]_개발로그.md`** inside the `./ai-record/` directory.
- **NO Duplicate File Titles:** Do NOT write the file name or a main H1 title (e.g., `# [YYYY-MM-DD]_개발로그`) at the top of the file. Start writing the content directly using H3 (`###`) headings to avoid duplication in Obsidian.
- All log content must be written in **Korean (한국어)**.
- Track the entry number sequentially (e.g., `### 0차 기록`, `### 1차 기록`, `### 2차 기록`) whenever you append new logs to the same file.

Use the following structured template for every log entry:
```markdown
### [N]차 기록
- **작업 일시:** Current date and time
- **수정한 파일명:** (e.g., `src/components/ProtectedRoute.tsx`)
- **수정 요약:** Summary of the user's request and your core solution
- **수정된 코드:** Code snippets highlighting the important changes