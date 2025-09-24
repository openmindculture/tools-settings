## fork or force git upstream

### fork or add Upstream

To use a repository as a template for another one, fork it on GitHub or set it as a remote upstream of an existing project.

Disambiguation: "upstream" has at least two slightly different meanings:

- a remote branch as a default pull and push equivalent of a local branch, configured by using `push --set-upstream origin branch`
- another repository apart from `origin` that provides autoritative upstream updates to repositories that were forked from it or later added the upstream repository using a command like the example command below.

If a respository was not really forked from the upstream, git might be refusing to merge unrelated histories. This change was introduced in Git 2.9 to prevent merging parallel histories into existing projects unnecessarily. Git isn't aware of the connection between these two projects, so it will refuse to merge them and throw the aforementioned error message unless we use the `--allow-unrelated-histories` option to override while merging.

- `git remote add upstream git@github.com:maintainer/project.git`

Use `git remote -v` to verify (or list) the configured remote repositories.

To synchronize/pull upstream updates, we can use it similar to working with branches:

- `git fetch upstream`
- `git merge upstream/main --allow-unrelated-histories`