import Lake
open Lake DSL

-- パッケージ名はリポジトリ名に合わせる必要はありませんが、
-- ここでは汎用的な名称にします
package «suzuki-rh» where
  leanOptions := #[
    ⟨`pp.unicode.fun, true⟩,
    ⟨`autoImplicit, false⟩
  ]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"

-- 【ここが重要】フォルダ名が SuzukiRH なら、ここも SuzukiRH にする
@[default_target]
lean_lib SuzukiRH where
  srcDir := "."
  roots := #[`SuzukiRH]
