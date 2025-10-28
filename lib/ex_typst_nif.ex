defmodule ExTypst.NIF do
  @moduledoc false
  version = Mix.Project.config()[:version]

  # use Rustler, otp_app: :ex_typst, crate: "extypst_nif"
  use RustlerPrecompiled,
    otp_app: :ex_typst,
    crate: "extypst_nif",
    base_url: "https://github.com/billylanchantin/ex_typst/releases/download/v#{version}",
    force_build: System.get_env("RUSTLER_PRECOMPILED_BUILD") in ["1", "true"],
    version: version

  def compile(_content, _font_paths), do: :erlang.nif_error(:nif_not_loaded)
end
