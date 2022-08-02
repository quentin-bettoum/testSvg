defmodule TestSvgWeb.Svg do
  @svg_path "assets/svg"
  @svg_path_wildcard Path.wildcard(@svg_path <> "/**/*.svg")
  @paths_hash :erlang.md5(@svg_path_wildcard)

  for path <- @svg_path_wildcard do
    @external_resource path
  end

  def __mix_recompile__?() do
    :erlang.md5(@svg_path_wildcard) != @paths_hash
  end

  # Build the library at compile time
  @library Adept.Svg.compile( @svg_path )

  # Accesses the library at run time
  defp library(), do: @library

  # Render an svg from the library
  def render( key, opts \\ [] ) do
    Adept.Svg.render( library(), key, opts )
  end
end
