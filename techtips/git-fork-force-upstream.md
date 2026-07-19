# git merge or rebase, fork or force upstream

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


## prevent git merge "conflicts"

- avoid large changes
- avoid (interactive) rebase, especially over large histories
- check files for common patterns
  - often, two different, completely unrelated blocks have been added at the same spot, causing an alleged conflict, as git is unsure which insertion to put first, so you decide!
  - often, a typo has been fixed or a version number upgraded which is mostly obvious to the human eye, especially an increased number
- brute-force paste the latest version if you don't really care for the history, e.g. when doing a squash / cleanup rebase to remove irrelevant or critical information from the history
- start a new repository if the old one is too messy and unrelated from what you're currently doing 

### prefer merge over rebase

Git merge is generally safer and faster than git rebase main when resolving merge conflicts.

One-and-Done Resolution (Faster): Running `git merge main` looks at the final states of both branches. You resolve all conflicts exactly once in a single, combined merge commit. Conversely, `git rebase main` replays your feature branch commits one by one on top of main. If the same lines conflict across five different commits, you must resolve that same conflict five separate times during the rebase.

No History Rewriting (Safer): `git merge` leaves your existing commits entirely untouched. It simply adds a new merge commit. If you make a mistake while resolving conflicts, you can easily abort or undo the merge. `git rebase` explicitly rewrites git history by creating brand new commits with new SHA-1 hashes. 

### understand HEAD vs. incoming

When you are on your feature branch and run git merge master, which is current change which is incoming change and how to learn the wording: 

- Current Change (or "HEAD"): This is your feature branch (the code you wrote).
- Incoming Change: This is the master branch (the code coming into your branch). 

But when rebasing this is the other way round.

The non-current marker either shows the branch name or the commit message that is coming in and potentially conflicting with the current code. 