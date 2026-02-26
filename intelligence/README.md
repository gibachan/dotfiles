# intelligence

AIツールの設定・定義をまとめたディレクトリ。

## 命名規則

カスタムスキル・コマンドには `koba-` を接頭語として付ける。`install-intelligence.sh` はこの接頭語を基準にインストール・削除を行う。

## claude/

Claude Code のカスタムスキル定義。

- `skills/` — `/skill-name` 形式で呼び出せるスキルを格納

## gemini/

Gemini CLI のカスタムコマンド定義。

- `commands/` — `@command-name` 形式で呼び出せるコマンドを格納
