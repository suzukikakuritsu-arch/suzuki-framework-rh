import Lake
open Lake DSL

package «suzuki-rh-framework» where
  -- 設定が必要な場合はここに記述

@[default_target]
lean_lib SuzukiRH where
  -- ライブラリのルート

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"
