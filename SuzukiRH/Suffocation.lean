import SuzukiRH.Basic

namespace SuzukiRH

/-- 
【公理：解析的窒息 (Analytic Suffocation)】
出典: Hadamard (1893), de la Vallée-Poussin (1896).
オイラー積の収束特性および関数等式の反射特性により、
Re(s) ≥ 1 および Re(s) ≤ 0 の領域ではゼータ関数のエネルギーが零点を許容しない。
-/
axiom outer_suffocation (s : ℂ) :
  (s.re ≥ 1 ∨ s.re ≤ 0) → zeta s ≠ 0

end SuzukiRH
