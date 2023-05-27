defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    palette_bit_size(color_count, 0)
  end

  defp palette_bit_size(color_count, size) do
    if Integer.pow(2, size) < color_count do
      palette_bit_size(color_count, size + 1)
    else
      size
    end
  end

  def empty_picture(), do: <<>>

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    palette_bit_size = palette_bit_size(color_count)
    <<pixel_color_index::size(palette_bit_size), picture::bitstring>>
  end

  def get_first_pixel(picture, color_count) do
    palette_bit_size = palette_bit_size(color_count)

    case picture do
      <<px::size(palette_bit_size), _picture::bitstring>> -> px
      _ -> nil
    end
  end

  def drop_first_pixel(picture, color_count) do
    palette_bit_size = palette_bit_size(color_count)

    case picture do
      <<_::size(palette_bit_size), rest::bitstring>> -> rest
      _ -> ""
    end
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
