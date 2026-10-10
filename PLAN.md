# PLAN

## Launch coverage review (October 10)

- [x] Coordinate ownership with Validate, preserve its dirty draft, and audit historical evidence without engine builds; source 7b32c2afb (done 2026-10-10 19:17 EDT).
- [x] Prepare 50 locales with tabled BLIP rows removed and explicit launch gaps; 16 generator suites, 12 public injected-defect checks and Nix build passed for source 7b32c2afb (done 2026-10-10 19:17 EDT).
- [ ] Keep the October 10 candidate undeployed pending explicit deployment direction; current whole-file coverage remains unaccepted.

## Current website refresh

- [x] Reconcile claims with the validate agent and prepare the generated snapshot at private commit 1ed2a7657 (done 2026-09-24 16:50 EDT).
- [x] Import all 50 locales and pass the public-boundary suite, nine injected-defect checks, and Nix build using source 1ed2a7657 (done 2026-09-24 16:50 EDT).

## Website separation

- [x] Copy the explicitly allowed committed website files and preserve existing licensing. September 12, 2026 EDT.
- [x] Pass file-boundary, page/link and six injected-defect checks locally and in Nix. September 12, 2026 EDT.
- [x] Deploy the standalone site and transfer validate.pics without DNS changes. GitHub Pages run 34695861346 succeeded; HTTPS certificate remains approved and enforced.
- [x] Disable the old deployment workflow, make validate private, verify the domain's served bytes and anonymous source denial. Authenticated user Nix fetch succeeded at b9a68bce5d8743b174df345d9e1b31a1620c75ca.
- [x] Verify Mechatron and document the private-to-public update workflow in README.md. Mechatron passed commit 8cfd87a809fbfb5d367f4bab799971a107b36e74 on September 12, 2026 at 09:18 EDT.
