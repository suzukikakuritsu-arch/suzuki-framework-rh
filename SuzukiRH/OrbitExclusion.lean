import Mathlib.Data.Set.Basic
import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit
import SuzukiRH.OrbitBounds
import SuzukiRH.Nontrivial

namespace SuzukiRH

open Set

axiom not_orbit_subset_conj_pair :
  ∀ s : ℂ, IsNontrivialZero s →
    ¬ (orbit s ⊆ {s, conj s})

theorem exclude_conj_pair :
  ∀ s : ℂ, IsNontrivialZero s →
    (orbit s ⊆ {s, conj s}) →
    False :=
by
  intro s hs h
  exact (not_orbit_subset_conj_pair s hs) h

end SuzukiRH
