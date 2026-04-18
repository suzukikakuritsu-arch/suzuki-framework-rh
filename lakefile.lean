import Lake
open Lake DSL

package "suzuki-rh" where
  -- 外部通信を最小限にするため、不要な設定を削ります
  leanOptions := #[⟨`pp.unicode.fun, true⟩, ⟨`autoImplicit, false⟩]

-- Mathlibを特定のコミット（v4.11.0）に固定
require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.11.0"

@[default_target]
lean_lib SuzukiRH where
  srcDir := "."
