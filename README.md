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

The September 24, 2026 refresh was coordinated with the validation engine's
agent. The format list describes development scope, not a release support
guarantee. Coverage retains 237 historical measurement rows with their original
rates and dates. Old mechanism descriptions are omitted pending the engine's
claims audit, and sample columns contain sizes only because fixture names may
identify private source files. Both disclosures and the sample-size boundary
are checked for every locale; nine injected defects exercise rejection paths.

The October 10 review candidate retains 235 historical rows after removing the
tabled BLIP Archive and BLIP Mini entries. Raw historical evidence remains in
the private project. The dense 4,096-byte overwrite column is labeled
"Nuke (legacy shotgun)" to distinguish it from modern sparse shotgun trials.
All 50 coverage pages disclose the unaccepted current evidence for RAW, PDF,
H.264/H.265, MP3/M4A and DICOM. The private generator pins the selected report's
SHA-256 instead of choosing the newest run. Twelve injected defects exercise
the public boundary. This candidate adds no new detection rates and is prepared
for review without deployment or a release.

`SOURCE_COMMIT` records the private generator snapshot. Imports rewrite the old
application GitHub link to this public website repository without changing the
translated page text. The original source license is retained in `LICENSE`;
this migration does not introduce a new license or future-opening promise.

The split was approved by Peter on September 12, 2026 to retain the public
website while the integrated application repository becomes private.
