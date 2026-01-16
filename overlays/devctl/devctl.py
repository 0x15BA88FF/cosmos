#!/usr/bin/env python3

import os
import re
import sys
import shutil
import argparse
import subprocess
from pathlib import Path
from typing import Optional, Tuple


class Devctl:
    def __init__(self) -> None:
        self.root: Path = Path(
            os.environ.get("DEVDIR", Path.home() / "Dev")
        ).expanduser()
        self.root.mkdir(parents=True, exist_ok=True)
        self.hosts_dir: Path = self.root / "hosts"
        self.local_dir: Path = self.root / "local"
        self.templates_dir: Path = self.root / "templates"

    def clone(self, origin: str) -> None:
        """Clone a repository and place it in the correct directory."""
        platform, username, repo = self._parse_origin(origin)

        if username:
            dest = self.hosts_dir / platform / username / repo
        else:
            dest = self.hosts_dir / platform / repo

        if dest.exists():
            print(f"[ERROR]: Destination already exists: {dest}")
            sys.exit(1)

        dest.parent.mkdir(parents=True, exist_ok=True)
        subprocess.run(["git", "clone", origin, str(dest)], check=True)
        print(f"[INFO]: Cloned to {dest}")

    def new(
        self, name: str, template: Optional[str] = None, origin: Optional[str] = None
    ) -> None:
        """Create a new project, optionally from a template."""
        name = name.lower()

        if not re.fullmatch(r"[a-z0-9_.-]+", name):
            print(f"[ERROR]: Invalid repository name: '{name}'")
            sys.exit(1)

        if origin:
            platform, username, _ = self._parse_origin(origin)
            if username:
                dest = self.hosts_dir / platform / username / name
            else:
                dest = self.hosts_dir / platform / name
        else:
            dest = self.local_dir / name

        if dest.exists():
            print(f"[ERROR]: Path already exists: {dest}")
            sys.exit(1)

        dest.mkdir(parents=True, exist_ok=True)

        if template:
            template_path = self.templates_dir / template
            if not template_path.exists():
                print(f"[ERROR]: Template not found: {template}")
                sys.exit(1)

            for item in template_path.iterdir():
                if item.name == ".git":
                    continue
                if item.is_dir():
                    shutil.copytree(item, dest / item.name)
                else:
                    shutil.copy2(item, dest / item.name)

        subprocess.run(["git", "init", str(dest)], check=True, capture_output=True)

        if origin:
            subprocess.run(
                ["git", "remote", "add", "origin", origin],
                cwd=str(dest),
                check=True,
                capture_output=True,
            )

        print(f"[INFO]: Created project at {dest}")

    def find(self, query: Optional[str] = None) -> None:
        """Search for repositories within the workspace."""
        if query == "*":
            pattern = None
        elif query:
            pattern = re.compile(query, re.IGNORECASE)
        else:
            pattern = None

        for base_dir in [self.hosts_dir, self.local_dir, self.templates_dir]:
            if not base_dir.exists():
                continue
            for repo in self._find_repositories(base_dir, max_depth=5):
                if pattern is None or pattern.search(str(repo)):
                    print(repo.relative_to(self.root))

    def clean(self) -> None:
        """Perform maintenance: remove empty dirs and fix misplaced repos."""
        for base_dir in [self.hosts_dir, self.local_dir]:
            if not base_dir.exists():
                continue

            for repo in self._find_repositories(base_dir, max_depth=5):
                origin = self._get_origin(repo)
                if origin:
                    expected_path = self._get_expected_path(origin)
                    if expected_path and repo != expected_path:
                        print(
                            f"[INFO]: Moving {repo.relative_to(self.root)} -> {expected_path.relative_to(self.root)}"
                        )
                        expected_path.parent.mkdir(parents=True, exist_ok=True)
                        shutil.move(str(repo), str(expected_path))

            self._remove_empty_dirs(base_dir)

        print("[INFO]: Cleanup complete")

    def _find_repositories(
        self, path: Path, max_depth: int, current_depth: int = 0
    ) -> list[Path]:
        """Find all Git repositories up to max_depth."""
        if current_depth >= max_depth or not path.is_dir():
            return []

        if (path / ".git").is_dir():
            return [path]

        repos: list[Path] = []
        try:
            for child in path.iterdir():
                if child.is_dir() and child.name not in {
                    ".git",
                    "node_modules",
                    "__pycache__",
                }:
                    repos.extend(
                        self._find_repositories(child, max_depth, current_depth + 1)
                    )
        except PermissionError:
            pass

        return repos

    def _get_origin(self, repo: Path) -> Optional[str]:
        """Get the origin URL of a repository."""
        try:
            result = subprocess.run(
                ["git", "remote", "get-url", "origin"],
                cwd=str(repo),
                capture_output=True,
                text=True,
                check=True,
            )
            return result.stdout.strip()
        except subprocess.CalledProcessError:
            return None

    def _get_expected_path(self, origin: str) -> Optional[Path]:
        """Calculate expected path for a repository based on its origin."""
        try:
            platform, username, repo = self._parse_origin(origin)
            if username:
                return self.hosts_dir / platform / username / repo
            else:
                return self.hosts_dir / platform / repo
        except SystemExit:
            return None

    def _remove_empty_dirs(self, path: Path) -> None:
        """Recursively remove empty directories."""
        if not path.is_dir():
            return

        for child in list(path.iterdir()):
            if child.is_dir():
                self._remove_empty_dirs(child)

        try:
            if not any(path.iterdir()) and path != self.root:
                path.rmdir()
        except OSError:
            pass

    def _parse_origin(self, url: str) -> Tuple[str, str, str]:
        """Parse Git URL into (platform, username, repo)."""
        patterns = [
            r"^https?://(?P<platform>[^/]+)/(?P<username>[^/]+)/(?P<repo>[^/]+?)(?:\.git)?$",
            r"^git@(?P<platform>[^:]+):(?P<username>[^/]+)/(?P<repo>[^/]+?)(?:\.git)?$",
        ]

        for pattern in patterns:
            match = re.match(pattern, url)
            if match:
                return (
                    match.group("platform").lower(),
                    match.group("username").lower(),
                    match.group("repo").lower().removesuffix(".git"),
                )

        print(f"[ERROR]: Invalid Git URL: {url}")
        sys.exit(1)


def main() -> None:
    dev = Devctl()
    parser = argparse.ArgumentParser(
        prog="devctl", description="Development workspace manager"
    )
    sub = parser.add_subparsers(dest="command", required=True)

    path_parser = sub.add_parser("path", help="Show notes directory path")
    path_parser.set_defaults(func=lambda args: print(dev.root))

    clone_parser = sub.add_parser("clone", help="Clone a repository")
    clone_parser.add_argument("origin", help="Git repository URL")
    clone_parser.set_defaults(func=lambda args: dev.clone(args.origin))

    new_parser = sub.add_parser("new", help="Create a new project")
    new_parser.add_argument("name", help="Repository name")
    new_parser.add_argument("--template", help="Template to use")
    new_parser.add_argument("--origin", help="Remote origin URL")
    new_parser.set_defaults(
        func=lambda args: dev.new(args.name, args.template, args.origin)
    )

    find_parser = sub.add_parser("find", help="Search for repositories")
    find_parser.add_argument("query", nargs="?", help="Search pattern")
    find_parser.set_defaults(func=lambda args: dev.find(args.query))

    clean_parser = sub.add_parser("clean", help="Clean and organize workspace")
    clean_parser.set_defaults(func=lambda args: dev.clean())

    args = parser.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()
