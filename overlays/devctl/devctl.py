#!/usr/bin/env python3

import os
import re
import sys
import argparse
import subprocess

from pathlib import Path
from typing import List, Tuple


class Devault:
    def __init__(self) -> None:
        self.dev_dir: Path = Path(
            os.environ.get("DEVDIR", Path.home() / "dev")
        ).expanduser()
        self.dev_dir.mkdir(parents=True, exist_ok=True)

    def find_repo(self, *queries: str) -> None:
        pattern = re.compile("|".join(queries))
        for repo in self._find_repositories(self.dev_dir):
            if pattern.search(str(repo)):
                print(repo)

    def mkrepo(self, name: str) -> None:
        if not re.fullmatch(r"[a-zA-Z0-9_.-]+", name):
            print(f"[ERROR]: Invalid repository name: '{name}'")
            sys.exit(1)
        path = self.dev_dir / "hosts" / "local" / name
        if path.exists():
            print(f"[ERROR]: Path already exists: {path}")
            sys.exit(1)
        path.mkdir(parents=True)
        (path / "README.md").touch()
        subprocess.run(["git", "init", str(path)], check=True)
        print(f"[INFO]: Created repository at {path}")

    def clone(self, url: str, collections: List[str]) -> None:
        provider, directory, repo = self._parse_url(url)
        dst = self.dev_dir / "hosts" / provider / directory / repo
        dst.parent.mkdir(parents=True, exist_ok=True)
        subprocess.run(["git", "clone", url, str(dst)], check=True)
        for col in collections:
            col_path = self.dev_dir / col
            col_path.mkdir(parents=True, exist_ok=True)
            symlink = col_path / repo
            if not symlink.exists():
                symlink.symlink_to(dst)
        print(f"[INFO]: Cloned {url} to {dst}")

    def group(self, *args: str) -> None:
        if len(args) < 2:
            print("[ERROR]: Need at least two arguments")
            sys.exit(1)
        collection = self.dev_dir / args[-1]
        collection.mkdir(parents=True, exist_ok=True)
        for repo_name in args[:-1]:
            repo_path = self.dev_dir / repo_name
            if not repo_path.exists():
                print(f"[WARNING]: Skipping missing repo: {repo_path}")
                continue
            link = collection / repo_path.name
            if not link.exists():
                link.symlink_to(repo_path)
        print(f"[INFO]: Grouped repositories into: {collection}")

    def _find_repositories(self, path: Path, depth: int = 5) -> List[Path]:
        if depth == 0 or not path.is_dir():
            return []
        if (path / ".git").is_dir():
            return [path]
        repos: List[Path] = []
        for child in path.iterdir():
            if child.is_dir() and child.name not in {".git", "node_modules"}:
                repos.extend(self._find_repositories(child, depth - 1))
        return repos

    def _parse_url(self, url: str) -> Tuple[str, str, str]:
        patterns = [
            r"^https?://(?P<provider>[^/]+)(?:/(?P<dir>.*?))?/(?P<repo>[^/]+)\.git$",
            r"^git@(ssh\.)?(?P<provider>[^:]+)(?::(?P<dir>.*?))?/(?P<repo>[^/]+)\.git$",
        ]
        for pattern in patterns:
            match = re.match(pattern, url)
            if match:
                return (
                    match.group("provider").lower(),
                    (match.group("dir") or "").lower(),
                    match.group("repo").lower(),
                )
        print(f"[ERROR]: Invalid Git URL: {url}")
        sys.exit(1)


def main() -> None:
    dev = Devault()
    parser = argparse.ArgumentParser(prog="devault", description="Minimal repo manager")
    sub = parser.add_subparsers(dest="command", required=True)

    new_parser = sub.add_parser("new", help="Create a new local repository")
    new_parser.add_argument("name", help="Repository name")
    new_parser.set_defaults(func=lambda args: dev.mkrepo(args.name))

    clone_parser = sub.add_parser("clone", help="Clone a Git repository")
    clone_parser.add_argument("url", help="Git repository URL")
    clone_parser.add_argument(
        "collections", nargs="*", help="Optional collection paths"
    )
    clone_parser.set_defaults(func=lambda args: dev.clone(args.url, args.collections))

    find_parser = sub.add_parser(
        "find", help="Search for repositories matching patterns"
    )
    find_parser.add_argument("queries", nargs="+", help="Regex patterns to match")
    find_parser.set_defaults(func=lambda args: dev.find_repo(*args.queries))

    group_parser = sub.add_parser("group", help="Group repositories into a collection")
    group_parser.add_argument("repositories", nargs="+", help="Paths to existing repos")
    group_parser.add_argument("collection", help="Target collection path")
    group_parser.set_defaults(
        func=lambda args: dev.group(*args.repositories, args.collection)
    )

    args = parser.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()
