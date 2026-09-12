# validate.pics website

[![Mechatron Prime CI](https://img.shields.io/endpoint?url=https%3A%2F%2Fthelio-nixos.tail66c90.ts.net%2Fbadges%2Fvalidate_website.json&style=for-the-badge)](https://thelio-nixos.tail66c90.ts.net/mechatron-prime/)

Public static pages for [Mecha Validate](https://validate.pics/). This repository
contains the website, not the validation engine or desktop application source.
Application development is private; separately published decoder libraries keep
their own licenses. Existing grants are unchanged.

## Update and deploy

The generator remains in the private `validate` repository under `site/`.
Generate and review its output there first, then commit that output privately.
From this repository, run:

```sh
nix develop -c ./import-snapshot ../validate COMMIT_SHA
nix develop -c ./test
git diff --stat
git diff -- public
# Review before committing and pushing yolo.
```

The importer selects only 100 generated HTML pages, two shared assets, the
sitemap and CNAME from an exact committed snapshot. It excludes application
source, private generator code, research documents and test corpora. It does
not commit or push. Existing public paths are checked before an update.

GitHub Pages deploys only `public/` on pushes to `yolo`. GitHub Actions is used
only for Pages deployment; Mechatron Prime owns the Nix check. `./build` produces
the checked static artifact in `result/`. Tests check the full public file set,
all local page/asset references, the domain, and obsolete download/source links.
Passing these checks does not certify translated prose or product claims.

`SOURCE_COMMIT` records the private generator snapshot. Imports rewrite the old
application GitHub link to this public website repository without changing the
translated page text. The original source license is retained in `LICENSE`;
this migration does not introduce a new license or future-opening promise.

The split was approved by Peter on September 12, 2026 to retain the public
website while the integrated application repository becomes private.
