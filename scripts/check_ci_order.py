from __future__ import annotations

import sys
from pathlib import Path


PROJECT_ROOT = Path(__file__).resolve().parents[1]
CI_WORKFLOW_PATH = PROJECT_ROOT / ".github" / "workflows" / "ci.yml"


def find_line_numbers(lines: list[str], needle: str) -> list[int]:
    return [idx for idx, line in enumerate(lines, start=1) if needle in line]


def main() -> int:
    if not CI_WORKFLOW_PATH.exists():
        print(f"Workflow file not found at {CI_WORKFLOW_PATH}", file=sys.stderr)
        return 1

    lines = CI_WORKFLOW_PATH.read_text().splitlines()

    pnpm_setup_lines = find_line_numbers(lines, "uses: pnpm/action-setup@v2")
    node_setup_lines = find_line_numbers(lines, "uses: actions/setup-node@v4")

    if not pnpm_setup_lines:
        print("pnpm/action-setup step not found in workflow", file=sys.stderr)
        return 1

    if not node_setup_lines:
        print("actions/setup-node step not found in workflow", file=sys.stderr)
        return 1

    pnpm_line = pnpm_setup_lines[0]
    node_line = node_setup_lines[0]

    if pnpm_line > node_line:
        print(
            "pnpm/action-setup step appears after actions/setup-node; order is incorrect",
            file=sys.stderr,
        )
        return 1

    cache_lines = find_line_numbers(lines, "cache: 'pnpm'")

    if not cache_lines:
        print("pnpm cache configuration missing from actions/setup-node", file=sys.stderr)
        return 1

    cache_line = cache_lines[0]
    if cache_line < node_line:
        print("pnpm cache configuration does not belong to actions/setup-node step", file=sys.stderr)
        return 1

    print("Workflow order and cache configuration look correct.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
