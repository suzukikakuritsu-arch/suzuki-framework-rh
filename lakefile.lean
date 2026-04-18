import Lake
open Lake DSL

package "suzuki-rh" where
  -- 余計なオプションを削り、基礎に徹する
  leanOptions := #[⟨`pp.unicode.fun, true⟩]

@[default_target]
lean_lib SuzukiRH where
  -- SuzukiRHフォルダの中を見に行く設定
  srcDir := "."
