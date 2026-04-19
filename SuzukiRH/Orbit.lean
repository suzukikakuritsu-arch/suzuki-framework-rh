import Mathlib.Data.Set.Basic
import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction

namespace SuzukiRH

open Set

/-- 軌道 -/
noncomputable def orbit (s : ℂ) : Set ℂ :=
  {x | ∃ g : SymOp, act g s = x}

/-- 自分自身は軌道に入る -/
theorem mem_orbit_self (s : ℂ) :
  s ∈ orbit s :=
by
  unfold orbit
  exact ⟨SymOp.ident, by simp [act]⟩

/-- 固定なら軌道は1点 -/
theorem fixed_implies_orbit_trivial :
  ∀ s : ℂ,
    (∀ g : SymOp, act g s = s) →
    orbit s = {s} :=
by
  intro s hfix
  ext x
  constructor
  · intro hx
    rcases hx with ⟨g, hg⟩
    have : act g s = s := hfix g
    simpa [hg] using this
  · intro hx
    have hx' : x = s := by simpa using hx
    subst hx'
    exact mem_orbit_self s

end SuzukiRH
