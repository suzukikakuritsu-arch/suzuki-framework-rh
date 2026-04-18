import Lake
open Lake DSL

package «suzuki-rh-framework» where
  -- プロジェクトの基本設定
  leanOptions := #[
    ⟨`pp.unicode.fun, true⟩, -- Unicode表示を有効化
    ⟨`autoImplicit, false⟩  -- 暗黙の変数を制限し、厳密性を高める
  ]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"

@[default_target]
lean_lib SuzukiRH where
  -- SuzukiRHディレクトリ以下のファイルをライブラリとして認識
  srcDir := "."
  roots := #[`SuzukiRH.Basic, `SuzukiRH.Suffocation, `SuzukiRH.Rigidity, `SuzukiRH.MainTheorem]
