import Mathlib.Data.Complex.Basic
import Mathlib.Data.Set.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit
import SuzukiRH.FourOrbitDecomposition

namespace SuzukiRH

open Set

/--
  collapse は分類から導かれる
-/
theorem collapse_four_to_reflect :
  ∀ s : ℂ, IsNontrivialZero s →
    orbit s ⊆ orbitCandidates s →
    orbit s ⊆ {s, 1 - s} :=
by
  intro s hs h

  have htype := classify_orbit s

  cases htype with
  | fixed =>
      -- singletonなら自明
      simp [orbitCandidates] at *

  | reflectPair =>
      -- 2点反転構造
      simp [orbitCandidates] at *

  | fullFour =>
      exfalso
      exact four_orbit_impossible s htype

end SuzukiRH
