import Mathlib.Data.Complex.Basic
import Mathlib.Data.Set.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit
import SuzukiRH.FourOrbitDecomposition

namespace SuzukiRH

open Set

/--
  collapse は分類で処理する
-/
theorem collapse_four_to_reflect :
  ∀ s : ℂ, IsNontrivialZero s →
    orbit s ⊆ {s, 1 - s} :=
by
  intro s hs

  -- 軌道分類
  have htype := classify_orbit s

  cases htype with
  | fixed =>
      -- 1点軌道
      simp [orbit]

  | reflectPair =>
      -- 2点構造
      simp [orbit]

  | fullFour =>
      -- 4点は不可能
      exfalso
      exact four_orbit_impossible s htype

end SuzukiRH
