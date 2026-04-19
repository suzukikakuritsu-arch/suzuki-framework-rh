import Mathlib.Data.Complex.Basic
import Mathlib.Data.Set.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit
import SuzukiRH.FourOrbitDecomposition

namespace SuzukiRH

open Set

/--
  軌道の候補集合（定義として固定）
-/
def orbitCandidates (s : ℂ) : Set ℂ :=
  {s, 1 - s}

/--
  collapse（分類ベースの弱形）
-/
theorem collapse_four_to_reflect :
  ∀ s : ℂ, IsNontrivialZero s →
    orbit s ⊆ orbitCandidates s :=
by
  intro s hs

  have htype := classify_orbit s

  cases htype with
  | fixed =>
      intro x hx
      -- singleton
      simp [orbitCandidates]

  | reflectPair =>
      intro x hx
      -- 2点構造
      simp [orbitCandidates]

  | fullFour =>
      exfalso
      exact four_orbit_impossible s htype

end SuzukiRH
