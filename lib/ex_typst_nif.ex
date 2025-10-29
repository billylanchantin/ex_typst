defmodule ExTypst.NIF do
  @moduledoc false

  mix_config = Mix.Project.config()
  version = mix_config[:version]
  # tag = "v#{version}"
  tag = "rustler-precompiled-test-6"
  # github_url = mix_config[:package][:links]["GitHub"]
  github_url = "https://github.com/billylanchantin/ex_typst"
  # Since Rustler 0.27.0, we need to change manually the mode for each env.
  # We want "debug" in dev and test because it's faster to compile.
  mode = if Mix.env() in [:dev, :test], do: :debug, else: :release

  # use Rustler, otp_app: :ex_typst, crate: "extypst_nif"
  use RustlerPrecompiled,
    otp_app: :ex_typst,
    crate: "extypst_nif",
    base_url: "#{github_url}/releases/download/#{tag}",
    force_build: System.get_env("RUSTLER_PRECOMPILED_BUILD") in ["1", "true"],
    version: version

  def compile(_content, _font_paths), do: :erlang.nif_error(:nif_not_loaded)
end
