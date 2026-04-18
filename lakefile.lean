import Lake
open Lake DSL

package «suzuki-rh» where
  -- ルートを src として扱う（SuzukiRH ディレクトリを直接読む）
  srcDir := "."

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"

lean_lib SuzukiRH where
  -- SuzukiRH/ をトップレベルモジュールとして扱う
  srcDir := "."
