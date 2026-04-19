import Mathlib.Data.Complex.Basic
import Mathlib.Data.Set.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit

namespace SuzukiRH

open Set

/--
  軌道の型
-/
inductive OrbitType : ℂ → Type
  | fixed (s : ℂ) : OrbitType s
  | reflectPair (s : ℂ) : OrbitType s
  | fullFour (s : ℂ) : OrbitType s

/--
  軌道型分類（仮）
-/
axiom classify_orbit :
  ∀ s : ℂ,
    OrbitType s

/--
  fullFour は不可能（核心）
-/
axiom four_orbit_impossible :
  ∀ s : ℂ,
    OrbitType.fullFour s → False

end SuzukiRH
