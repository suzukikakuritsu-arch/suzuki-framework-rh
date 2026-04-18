import Lake
open Lake DSL

package «suzuki-rh» where
  srcDir := "."

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.11.0"

lean_lib SuzukiRH where
  srcDir := "."
