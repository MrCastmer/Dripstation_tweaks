#!/bin/sh
set -e

if command -v python >/dev/null 2>&1; then
	PY=python
elif command -v python3 >/dev/null 2>&1; then
	PY=python3
elif command -v py >/dev/null 2>&1; then
	PY=py
if [ "$*" = "-m precommit" ]; then
	echo "Hooks are being updated..."
	echo "Details: https://github.com/tgstation/tgstation/pull/55658"
	if [ "$(uname -o)" = "Msys" ]; then
		tools/hooks/Install.bat
	else
		tools/hooks/install.sh
	fi
	echo "---------------"
	exec tools/hooks/pre-commit.hook
else
	echo "tools/hooks/python.sh is replaced by tools/bootstrap/python"
	echo "Details: https://github.com/tgstation/tgstation/pull/55658"
	exit 1
fi
