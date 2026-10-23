# Coverage review readiness — October 14, 2026

## October 23 deployment follow-up

Peter explicitly requested "deploy again" on October 23, superseding the earlier
deployment hold. The following October 14 sections preserve the historical
review record rather than impose a new approval request.

Further diagnosis corrected the earlier assumption about generation: the raw
Zig file is valid ASCII/UTF-8, but five escaped Igbo strings omit a UTF-8
continuation byte. The decoder preserves those invalid bytes. The isolated
source branch repairs the five entries (NACHA, COFF, OBJ, STEP, STL), regenerates
the Igbo coverage page, and adds an all-page encoding regression test. Public
checks independently use iconv and reject an injected incomplete sequence.
Both encoding tests failed on the old output before the source repair.

Historical measurements and disclosures remain unchanged; deployment is not
acceptance of current PDF/RAW coverage evidence or an application release.

The corrected private snapshot is
`d40417e5505d77dc062ced59f8b6158ab0f3cdcd`. All 17 site-generator suites pass.
All 105 public files match that commit after the documented URL rewrite and
empty `.nojekyll` addition. The public suite passes, including 13 injected
defects, and the static Nix build passes with iconv explicitly provided.

Deployment completed October 23 at public commit
`b6ec38c1d6350ea323593576999258324aff698f`, GitHub Pages run `40002086613`.
All 100 live HTML pages, both shared assets and the sitemap returned HTTP 200
and matched the committed files byte for byte at `https://validate.pics/`.

## October 14 snapshot

The prepared presentation correction remains public candidate
`6689438dd452d879d96b1e8524cdee8da5a38eb4`, generated from private source
`7b32c2afb3990675d49cc16d6e9935fa5503a555`. It has not been deployed.
The local `yolo` and `origin/yolo` references remain at
`f34bd06fa45868ddd3633882209e610c96d25cb3`; these references are not a fresh
observation of the live server.

The candidate removes tabled BLIP rows, labels the historical dense overwrite
column "Nuke (legacy shotgun)", and discloses missing accepted current coverage
in all 50 locales. It retains 235 historical rows without changing their dates
or rates. Unknown `n/a` values remain unknown. It adds no current detection rates
or brand-wide RAW support claims. A historical dense overwrite measurement is
not a modern sparse-shotgun measurement.

## Evidence status

The October 11 coordination request prioritizes PDF and some RAW formats before
launch and explicitly preserves the deployment hold. Validate's October 14
PLAN identifies NEF and PEF as the named RAW priorities and says no mutation
packet exists on a current consumer. Its generator integration item still lists
`7b32c2afb` as pending reconciliation. These are project status statements, not
acceptance of new measurements.

Validate's October 14 reply confirms no current whole-file PDF or exact RAW
variant mutation evidence has been accepted. Earlier packets are historical or
provisional, and verdict rules have since changed. It also confirms that the
generator branch is not integrated; reconciliation with its existing coverage
edits is queued, and Validate will send the resulting commit. Any new claim
needs the exact source revision,
binary digest and build profile, exact variant scope, valid-original controls,
per-mode counts, and adjudication. Until such evidence is accepted, the historical
rows and the candidate's current-evidence disclosure remain unchanged. Engine
development, a passing decoder test, and a partial variant measurement alone do
not establish current whole-file coverage.

## Review and publication

The complete source comparison passed for all 105 files: 100 HTML pages,
four assets/metadata files, and the empty `.nojekyll` marker. The only expected
transformation was 200 exact GitHub URL replacements across the HTML pages.
Both committed candidate bytes and working `public/` bytes matched. The public
Git tree is `3d6a1836984bbd397690bae02bb890cb1580668e`; the sorted SHA-256
file manifest hashes to
`0bbfbd81579e9e07836fc578c2cf4ecb42df27d22c604198b2c3bd8f8c506455`.
This comparison used Git blob reads rather than rerunning the importer.

The October 14 byte comparison found malformed UTF-8 in
`public/ig/coverage/index.html`, inherited unchanged from the private generated
page: the NACHA/ACH translated label contains the incomplete byte sequence
`e1 bb` before `6e 74`. Validate confirmed its translation source is valid UTF-8;
the defect therefore occurs in generation, with the exact cause still under
investigation. Validate owns the generator repair and an all-page encoding
regression check as part of branch reconciliation. Regeneration must be followed
by review of the new exact candidate. The existing public boundary suite does not establish valid
UTF-8. This was the only invalid UTF-8 HTML page in the 100-page scan. The repair
request was delivered to Validate. Do not silently replace malformed bytes or
describe this candidate as ready for publication.

The coordinator's October 10 receipt accepted an independent replay of all 16
generator suites at the exact source commit and reviewed the English rendering.
That acceptance covers generator behavior; it does not accept detection rates
or authorize deployment.

Independent public boundary/privacy and source-to-snapshot acceptance remains
open. The website author's checks are supporting evidence and do not close that
independent review. Explicit deployment direction is required afterward. No
owner choice is being re-asked while those review prerequisites remain open.

The October 14 follow-up authorizes ordinary local work, not deployment, an
engine build, a provider change, or a new mutation campaign.

## Local verification status

The byte comparison and PLAN lint passed on October 14. The single queued
`build-budget` job for the public suite, static Nix build and artifact comparison
was cancelled after approximately ten minutes of contention. A slot became
available during cancellation and Nix began fetching a source; its task-owned
scope was subsequently confirmed inactive/dead. No test or build result was
obtained. The documentation
changes remain uncommitted pending verification. The October 10 passing results
remain historical results for the unchanged candidate, not a new test run.
