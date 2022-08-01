defmodule TestSvgWeb.Svg do

  # Build the library at compile time
  @library Adept.Svg.compile( "assets/svg" )

  # Accesses the library at run time
  defp library(), do: @library

  # Render an svg from the library
  def render( key, opts \\ [] ) do
    Adept.Svg.render( library(), key, opts )
  end
end
