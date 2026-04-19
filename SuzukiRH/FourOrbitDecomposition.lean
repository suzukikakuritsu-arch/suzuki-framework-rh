import Mathlib.Data.Complex.Basic
import Mathlib.Data.Set.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit

namespace SuzukiRH

open Set

/--
  軌道の型（命題）
-/
inductive OrbitType (s : ℂ) : Prop
  | fixed : OrbitType s
  | reflectPair : OrbitType s
  | fullFour : OrbitType s

/--
  軌道型分類（仮）
-/
axiom classify_orbit :
  ∀ s : ℂ,
    OrbitType s

/--
  fullFour は不可能（核心）
  ★ここで (s := s) を明示する
-/
axiom four_orbit_impossible :
  ∀ s : ℂ,
    OrbitType.fullFour (s := s) → False

end SuzukiRH
