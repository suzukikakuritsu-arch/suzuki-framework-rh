import Mathlib.Data.Complex.Basic
import Mathlib.Data.Set.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit
import SuzukiRH.FourOrbitDecomposition

namespace SuzukiRH

open Set

/--
  collapse は分類に還元される
-/
theorem collapse_four_to_reflect :
  ∀ s : ℂ, IsNontrivialZero s →
    orbit s ⊆ orbitCandidates s →
    orbit s ⊆ {s, 1 - s} :=
by
  intro s hs hsubset

  -- 軌道型分類
  have htype := classify_orbit s

  cases htype with
  | fixed =>
      -- 1点軌道
      simp [orbitCandidates]

  | reflectPair =>
      -- 2点構造
      simp [orbitCandidates]

  | fullFour =>
      -- 4点は排除（核心）
      exfalso
      exact four_orbit_impossible s htype

end SuzukiRH
