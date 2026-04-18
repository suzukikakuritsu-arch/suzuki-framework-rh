import Lake
open Lake DSL

package "suzuki-rh" where
  leanOptions := #[⟨`pp.unicode.fun, true⟩, ⟨`autoImplicit, false⟩]

-- Mathlibを安定したコミットに固定
require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.11.0"

@[default_target]
lean_lib SuzukiRH where
  srcDir := "."
  roots := #[`SuzukiRH]
