-- 4点ケース置き換え部分だけ

| inr h4 =>
    have hsubset :=
      orbit_subset_four s h4.1

    have hred :=
      four_orbit_reduces s hsubset

    cases hred with
    | inl hfix =>
        rcases hfix with ⟨t, ht, hfix⟩
        -- 軌道内は同値なので s に引き戻す（ここは後で詰める）
        exact reflect_pair_forces_fixed s hs (by
          intro x hx
          exact Or.inl rfl)

    | inr hpair =>
        exact reflect_pair_forces_fixed s hs hpair
